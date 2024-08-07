using OfficeOpenXml;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddHttpClient(); // Đăng ký HttpClient
builder.Services.AddHttpContextAccessor(); // Đăng ký IHttpContextAccessor

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}
ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseDeveloperExceptionPage();
app.UseRouting();

app.UseAuthorization();
app.UseSession(); // Session middleware

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Review}/{action=createReview}/{id?}");

app.Run();

