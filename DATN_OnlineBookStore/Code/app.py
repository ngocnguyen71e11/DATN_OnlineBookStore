import json
import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.decomposition import TruncatedSVD
from sklearn.feature_extraction.text import TfidfVectorizer
import pyodbc
from flask import Flask, jsonify, request
from pyvi import ViTokenizer
from sklearn.metrics import mean_absolute_error, mean_squared_error

app = Flask(__name__)

# Kết nối cơ sở dữ liệu
def get_connection():
    server = 'DESKTOP-HOBK3H5\\MINSHN'
    database = 'db_OnlineBookStore'
    try:
        conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                              f'SERVER={server};'
                              f'DATABASE={database};'
                              'Trusted_Connection=yes;')
        return conn
    except pyodbc.Error as e:
        print(f"Error connecting to database: {e}")
        return None

# Lấy thông tin sản phẩm
def get_item_profiles():
    conn = get_connection()
    if conn is None:
        return None

    try:
        query = """
        SELECT PK_iSanphamID, sTensanpham, sMota, FK_iTheloaiID
        FROM tblSanpham;
        """
        df = pd.read_sql(query, conn)
        return df
    except Exception as e:
        print(f"Error fetching item profiles: {e}")
        return None

# Lấy thông tin người dùng
def get_user_info(user_id):
    conn = get_connection()
    if conn is None:
        return None

    try:
        query = f"""
        SELECT sNghenghiep, dNgaysinh
        FROM tblKhachhang
        WHERE PK_sKHID = '{user_id}';
        """
        df = pd.read_sql(query, conn)
        return df
    except Exception as e:
        print(f"Error fetching user info: {e}")
        return None

# Tính toán MAE và RMSE
def calculate_mae_rmse(true_ratings, predicted_ratings):
    try:
        mae = mean_absolute_error(true_ratings, predicted_ratings)
        rmse = mean_squared_error(true_ratings, predicted_ratings, squared=False)
        return float(mae), float(rmse)
    except ValueError as e:
        print(f"Error calculating MAE and RMSE: {e}")
        return None, None

def preprocess_text(text):
    return ViTokenizer.tokenize(text)

def get_similar_items(item_profiles, user_info):
    if item_profiles is not None and user_info is not None:
        user_occupation = user_info['sNghenghiep'].values[0]       
        vectorizer = TfidfVectorizer(tokenizer=preprocess_text)
        item_profiles['sMota'] = item_profiles['sMota'].fillna('')
        item_vectors = vectorizer.fit_transform(item_profiles['sMota'])
        user_vector = vectorizer.transform([user_occupation])
        
        similarities = cosine_similarity(user_vector, item_vectors).flatten()
        item_profiles['Similarity'] = similarities
        
        return item_profiles[['PK_iSanphamID', 'Similarity']].sort_values('Similarity', ascending=False)
    return pd.DataFrame(columns=['PK_iSanphamID', 'Similarity'])

def recommend_items(user_id, n_recommendations=5):
    conn = get_connection()
    if conn is None:
        return {'error': 'Failed to connect to the database.'}

    try:
        query = f"""
        SELECT COUNT(*) as RatingCount
        FROM tblDanhgia
        WHERE FK_iCTdonhangID IN (
            SELECT PK_iCTdonhangID
            FROM tblCTdonhang
            WHERE FK_iDonhangID IN (
                SELECT PK_iDonhangID
                FROM tblDonhang
                WHERE FK_sKHID = '{user_id}'
            )
        );
        """
        rating_count = pd.read_sql(query, conn).iloc[0]['RatingCount']

        if rating_count > 0:
            query = """
                SELECT tblDonhang.FK_sKHID AS UserId, tblCTdonhang.FK_iSanphamID AS ItemId, tblDanhgia.fXephang AS Rating
                FROM tblDanhgia
                INNER JOIN tblCTdonhang ON tblDanhgia.FK_iCTdonhangID = tblCTdonhang.PK_iCTdonhangID
                INNER JOIN tblDonhang ON tblCTdonhang.FK_iDonhangID = tblDonhang.PK_iDonhangID;
            """
            df = pd.read_sql(query, conn)
            user_item_matrix = df.pivot_table(index='UserId', columns='ItemId', values='Rating').fillna(0)
            
            if str(user_id) in user_item_matrix.index:
                similarity_matrix = cosine_similarity(user_item_matrix)
                similarity_df = pd.DataFrame(similarity_matrix, index=user_item_matrix.index, columns=user_item_matrix.index)

                svd = TruncatedSVD(n_components=min(7, user_item_matrix.shape[1] - 1))
                latent_matrix = svd.fit_transform(user_item_matrix)
                latent_similarity = cosine_similarity(latent_matrix)
                enhanced_similarity = (similarity_df.values + latent_similarity) / 2
                enhanced_similarity_df = pd.DataFrame(enhanced_similarity, index=user_item_matrix.index, columns=user_item_matrix.index)

                similar_users = enhanced_similarity_df.loc[str(user_id)].sort_values(ascending=False)[1:].head(n_recommendations)
                similar_users_ids = similar_users.index.tolist()

                recommended_items = pd.DataFrame(columns=['ItemId', 'PredictedRating'])
                for other_user in similar_users_ids:
                    other_user_ratings = user_item_matrix.loc[other_user]
                    other_user_ratings = other_user_ratings[other_user_ratings > 0]
                    recommended_items = pd.concat([recommended_items, pd.DataFrame({
                        'ItemId': other_user_ratings.index,
                        'PredictedRating': other_user_ratings.values * similar_users.loc[other_user]
                    })])

                final_recommendations = recommended_items.groupby('ItemId').sum().sort_values('PredictedRating', ascending=False)
                final_recommendations = final_recommendations.head(n_recommendations).reset_index()
                final_recommendations.rename(columns={'PredictedRating': 'CollaborativeScore'}, inplace=True)

                # Lấy đánh giá thực tế của người dùng từ cơ sở dữ liệu
                actual_ratings_query = f"""
                SELECT tblKetquathucte.FK_iSanphamId AS ItemId, tblKetquathucte.fXephang AS Rating
                FROM tblKetquathucte              
                WHERE tblKetquathucte.FK_iKhachhangId = '{user_id}';
                """
                actual_ratings = pd.read_sql(actual_ratings_query, conn)
                
                # Kiểm tra NaN và xử lý
                merged = final_recommendations.merge(actual_ratings, left_on='ItemId', right_on='ItemId', how='left')
                merged = merged.dropna(subset=['Rating'])
                
                if not merged.empty:
                    mae, rmse = calculate_mae_rmse(merged['Rating'], merged['CollaborativeScore'])
                    final_recommendations_dict = final_recommendations.to_dict(orient='records')
                    # Thêm MAE và RMSE vào kết quả trả về
                    print(f"MAE: {mae}")
                    print(f"RMSE: {rmse}")
                    return {'recommendations': final_recommendations_dict, 'MAE': mae, 'RMSE': rmse}
                else:
                    print("No actual ratings found for comparison.")
                    final_recommendations_dict = final_recommendations.to_dict(orient='records')
                    return {'recommendations': final_recommendations_dict, 'MAE': None, 'RMSE': None}
                
            else:
                return {'recommendations': [], 'MAE': None, 'RMSE': None}
        
        else:
            item_profiles = get_item_profiles()
            user_info = get_user_info(user_id)
            if item_profiles is not None and user_info is not None:
                similar_items = get_similar_items(item_profiles, user_info)
                similar_items.rename(columns={'Similarity': 'ContentBasedScore'}, inplace=True)
                similar_items_dict = similar_items.sort_values(by='ContentBasedScore', ascending=False).head(n_recommendations).to_dict(orient='records')
                return {'recommendations': similar_items_dict, 'MAE': None, 'RMSE': None}
            else:
                return {'recommendations': [], 'MAE': None, 'RMSE': None}

    except Exception as e:
        print(f"Error in generating recommendations: {e}")
        return {'recommendations': [], 'MAE': None, 'RMSE': None}

@app.route('/api/recommendation/user/<int:user_id>/recommendations', methods=['GET'])
def recommend(user_id):
    n_recommendations = request.args.get('n', 5)
    recommendations = recommend_items(user_id, n_recommendations=int(n_recommendations))
    return jsonify(recommendations)

if __name__ == '__main__':
    app.run(debug=True)
