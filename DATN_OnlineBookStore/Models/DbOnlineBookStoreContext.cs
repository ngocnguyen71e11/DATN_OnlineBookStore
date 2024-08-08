using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DATN_OnlineBookStore.Models;

public partial class DbOnlineBookStoreContext : DbContext
{
    public DbOnlineBookStoreContext()
    {
    }

    public DbOnlineBookStoreContext(DbContextOptions<DbOnlineBookStoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblCtdonhang> TblCtdonhangs { get; set; }

    public virtual DbSet<TblCtgiohang> TblCtgiohangs { get; set; }

    public virtual DbSet<TblCtkhuyenmai> TblCtkhuyenmais { get; set; }

    public virtual DbSet<TblCtphieukiemke> TblCtphieukiemkes { get; set; }

    public virtual DbSet<TblCtphieunhaphang> TblCtphieunhaphangs { get; set; }

    public virtual DbSet<TblCtsach> TblCtsaches { get; set; }

    public virtual DbSet<TblCttrangthaidonhang> TblCttrangthaidonhangs { get; set; }

    public virtual DbSet<TblCtvanphongpham> TblCtvanphongphams { get; set; }

    public virtual DbSet<TblDanhgium> TblDanhgia { get; set; }

    public virtual DbSet<TblDanhmuc> TblDanhmucs { get; set; }

    public virtual DbSet<TblDiachiKh> TblDiachiKhs { get; set; }

    public virtual DbSet<TblDonhang> TblDonhangs { get; set; }

    public virtual DbSet<TblGiohang> TblGiohangs { get; set; }

    public virtual DbSet<TblHuyen> TblHuyens { get; set; }

    public virtual DbSet<TblKhachhang> TblKhachhangs { get; set; }

    public virtual DbSet<TblKhuyenmai> TblKhuyenmais { get; set; }

    public virtual DbSet<TblNhacungcap> TblNhacungcaps { get; set; }

    public virtual DbSet<TblNhanvien> TblNhanviens { get; set; }

    public virtual DbSet<TblPhanquyen> TblPhanquyens { get; set; }

    public virtual DbSet<TblPhieukiemke> TblPhieukiemkes { get; set; }

    public virtual DbSet<TblPhieunhaphang> TblPhieunhaphangs { get; set; }

    public virtual DbSet<TblSanpham> TblSanphams { get; set; }

    public virtual DbSet<TblTaikhoan> TblTaikhoans { get; set; }

    public virtual DbSet<TblTheloai> TblTheloais { get; set; }

    public virtual DbSet<TblTinh> TblTinhs { get; set; }

    public virtual DbSet<TblXa> TblXas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-HOBK3H5\\MINSHN;Initial Catalog=db_OnlineBookStore;Integrated Security=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblCtdonhang>(entity =>
        {
            entity.HasKey(e => e.PkICtdonhangId).HasName("PK__tblCTdon__F7AB8A3A03E10482");

            entity.ToTable("tblCTdonhang");

            entity.Property(e => e.PkICtdonhangId).HasColumnName("PK_iCTdonhangID");
            entity.Property(e => e.FGiaban).HasColumnName("fGiaban");
            entity.Property(e => e.FKhuyenmai).HasColumnName("fKhuyenmai");
            entity.Property(e => e.FkIDonhangId).HasColumnName("FK_iDonhangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIDonhang).WithMany(p => p.TblCtdonhangs)
                .HasForeignKey(d => d.FkIDonhangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTdonh__FK_iD__6754599E");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtdonhangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTdonh__FK_iS__66603565");
        });

        modelBuilder.Entity<TblCtgiohang>(entity =>
        {
            entity.HasKey(e => e.PkICtgiohangId).HasName("PK__tblCTgio__DDD7D40B4991CEDA");

            entity.ToTable("tblCTgiohang");

            entity.Property(e => e.PkICtgiohangId).HasColumnName("PK_iCTGiohangID");
            entity.Property(e => e.DThoigiancapnhat)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiancapnhat");
            entity.Property(e => e.FkIGiohangId).HasColumnName("FK_iGiohangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIGiohang).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkIGiohangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iG__6E01572D");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iS__6D0D32F4");
        });

        modelBuilder.Entity<TblCtkhuyenmai>(entity =>
        {
            entity.HasKey(e => e.PkICtkhuyenmaiId).HasName("PK__tblCTkhu__2FE4DA8D5E27B161");

            entity.ToTable("tblCTkhuyenmai");

            entity.Property(e => e.PkICtkhuyenmaiId).HasColumnName("PK_iCTkhuyenmaiID");
            entity.Property(e => e.FChietkhau).HasColumnName("fChietkhau");
            entity.Property(e => e.FkIKhuyenmaiId).HasColumnName("FK_iKhuyenmaiID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");

            entity.HasOne(d => d.FkIKhuyenmai).WithMany(p => p.TblCtkhuyenmais)
                .HasForeignKey(d => d.FkIKhuyenmaiId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTkhuy__FK_iK__571DF1D5");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtkhuyenmais)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTkhuy__FK_iS__5812160E");
        });

        modelBuilder.Entity<TblCtphieukiemke>(entity =>
        {
            entity.HasKey(e => e.PkICtkiemkeId).HasName("PK__tblCTphi__78986D0A3F2B2599");

            entity.ToTable("tblCTphieukiemke");

            entity.Property(e => e.PkICtkiemkeId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTkiemkeID");
            entity.Property(e => e.FGiavon).HasColumnName("fGiavon");
            entity.Property(e => e.FkIPhieukiemke).HasColumnName("FK_iPhieukiemke");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluongthucte).HasColumnName("iSoluongthucte");
            entity.Property(e => e.ITonkho).HasColumnName("iTonkho");

            entity.HasOne(d => d.FkIPhieukiemkeNavigation).WithMany(p => p.TblCtphieukiemkes)
                .HasForeignKey(d => d.FkIPhieukiemke)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iP__534D60F1");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtphieukiemkes)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iS__5441852A");
        });

        modelBuilder.Entity<TblCtphieunhaphang>(entity =>
        {
            entity.HasKey(e => e.PkICtphieunhapId).HasName("PK__tblCTphi__E5AA799EF6BF0788");

            entity.ToTable("tblCTphieunhaphang");

            entity.Property(e => e.PkICtphieunhapId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTphieunhapID");
            entity.Property(e => e.FChietkhau).HasColumnName("fChietkhau");
            entity.Property(e => e.FGianhap).HasColumnName("fGianhap");
            entity.Property(e => e.FkIPhieunhaphangId).HasColumnName("FK_iPhieunhaphangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIPhieunhaphang).WithMany(p => p.TblCtphieunhaphangs)
                .HasForeignKey(d => d.FkIPhieunhaphangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iP__4F7CD00D");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtphieunhaphangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iS__5070F446");
        });

        modelBuilder.Entity<TblCtsach>(entity =>
        {
            entity.HasKey(e => e.PkICtsachId).HasName("PK__tblCTsac__DE17AA4A73E13DCC");

            entity.ToTable("tblCTsach");

            entity.Property(e => e.PkICtsachId).HasColumnName("PK_iCTsachID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISotrang).HasColumnName("iSotrang");
            entity.Property(e => e.Isbn)
                .HasMaxLength(255)
                .HasColumnName("ISBN");
            entity.Property(e => e.SNamxuatban)
                .HasMaxLength(255)
                .HasColumnName("sNamxuatban");
            entity.Property(e => e.SNgonngu)
                .HasMaxLength(255)
                .HasColumnName("sNgonngu");
            entity.Property(e => e.SNguoidich)
                .HasMaxLength(255)
                .HasColumnName("sNguoidich");
            entity.Property(e => e.SNhaxuatban)
                .HasMaxLength(255)
                .HasColumnName("sNhaxuatban");
            entity.Property(e => e.STacgia)
                .HasMaxLength(255)
                .HasColumnName("sTacgia");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtsaches)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTsach__FK_iS__5EBF139D");
        });

        modelBuilder.Entity<TblCttrangthaidonhang>(entity =>
        {
            entity.HasKey(e => e.PkITrangthaidonhangId).HasName("PK__tblCTtra__ACB443514D7F5E06");

            entity.ToTable("tblCTtrangthaidonhang");

            entity.Property(e => e.PkITrangthaidonhangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTrangthaidonhangID");
            entity.Property(e => e.STentrangthai)
                .HasMaxLength(255)
                .HasColumnName("sTentrangthai");
        });

        modelBuilder.Entity<TblCtvanphongpham>(entity =>
        {
            entity.HasKey(e => e.PkICtvanphongphamId).HasName("PK__tblCTvan__75C3326849A59453");

            entity.ToTable("tblCTvanphongpham");

            entity.Property(e => e.PkICtvanphongphamId).HasColumnName("PK_iCTvanphongphamID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.SChatlieu)
                .HasMaxLength(255)
                .HasColumnName("sChatlieu");
            entity.Property(e => e.SKichthuoc)
                .HasMaxLength(255)
                .HasColumnName("sKichthuoc");
            entity.Property(e => e.SMausac)
                .HasMaxLength(255)
                .HasColumnName("sMausac");
            entity.Property(e => e.SThuonghieu)
                .HasMaxLength(255)
                .HasColumnName("sThuonghieu");
            entity.Property(e => e.SXuatxu)
                .HasMaxLength(255)
                .HasColumnName("sXuatxu");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtvanphongphams)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTvanp__FK_iS__5BE2A6F2");
        });

        modelBuilder.Entity<TblDanhgium>(entity =>
        {
            entity.HasKey(e => e.PkIDanhgiaId).HasName("PK__tblDanhg__0A1F2B253FDAF353");

            entity.ToTable("tblDanhgia");

            entity.Property(e => e.PkIDanhgiaId).HasColumnName("PK_iDanhgiaID");
            entity.Property(e => e.DThoigiantao)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiantao");
            entity.Property(e => e.FXephang).HasColumnName("fXephang");
            entity.Property(e => e.FkICtdonhangId).HasColumnName("FK_iCTdonhangID");
            entity.Property(e => e.SMota)
                .HasMaxLength(255)
                .HasColumnName("sMota");

            entity.HasOne(d => d.FkICtdonhang).WithMany(p => p.TblDanhgia)
                .HasForeignKey(d => d.FkICtdonhangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDanhgi__FK_iC__70DDC3D8");
        });

        modelBuilder.Entity<TblDanhmuc>(entity =>
        {
            entity.HasKey(e => e.PkIDanhmucId).HasName("PK__tblDanhm__A295340745AF6EDE");

            entity.ToTable("tblDanhmuc");

            entity.Property(e => e.PkIDanhmucId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iDanhmucID");
            entity.Property(e => e.STendanhmuc)
                .HasMaxLength(255)
                .HasColumnName("sTendanhmuc");
        });

        modelBuilder.Entity<TblDiachiKh>(entity =>
        {
            entity.HasKey(e => e.PkSDiachiKhid).HasName("PK__tblDiach__E54C3887FB6070EE");

            entity.ToTable("tblDiachiKH");

            entity.Property(e => e.PkSDiachiKhid).HasColumnName("PK_sDiachiKHID");
            entity.Property(e => e.FkIHuyenId).HasColumnName("FK_iHuyenID");
            entity.Property(e => e.FkITinhId).HasColumnName("FK_iTinhID");
            entity.Property(e => e.FkIXaId).HasColumnName("FK_iXaID");
            entity.Property(e => e.FkSKhid)
                .HasMaxLength(10)
                .HasColumnName("FK_sKHID");
            entity.Property(e => e.IsTrangthai).HasColumnName("isTrangthai");
            entity.Property(e => e.SDiachicuthe)
                .HasMaxLength(255)
                .HasColumnName("sDiachicuthe");
            entity.Property(e => e.SHo)
                .HasMaxLength(255)
                .HasColumnName("sHo");
            entity.Property(e => e.SSdt)
                .HasMaxLength(20)
                .HasColumnName("sSDT");
            entity.Property(e => e.STen)
                .HasMaxLength(255)
                .HasColumnName("sTen");

            entity.HasOne(d => d.FkIHuyen).WithMany(p => p.TblDiachiKhs)
                .HasForeignKey(d => d.FkIHuyenId)
                .HasConstraintName("FK__tblDiachi__FK_iH__38996AB5");

            entity.HasOne(d => d.FkITinh).WithMany(p => p.TblDiachiKhs)
                .HasForeignKey(d => d.FkITinhId)
                .HasConstraintName("FK__tblDiachi__FK_iT__398D8EEE");

            entity.HasOne(d => d.FkIXa).WithMany(p => p.TblDiachiKhs)
                .HasForeignKey(d => d.FkIXaId)
                .HasConstraintName("FK__tblDiachi__FK_iX__37A5467C");

            entity.HasOne(d => d.FkSKh).WithMany(p => p.TblDiachiKhs)
                .HasForeignKey(d => d.FkSKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDiachi__FK_sK__36B12243");
        });

        modelBuilder.Entity<TblDonhang>(entity =>
        {
            entity.HasKey(e => e.PkIDonhangId).HasName("PK__tblDonha__2200A070C2F99362");

            entity.ToTable("tblDonhang");

            entity.Property(e => e.PkIDonhangId).HasColumnName("PK_iDonhangID");
            entity.Property(e => e.DThoigiancapnhat)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiancapnhat");
            entity.Property(e => e.DThoigianmua)
                .HasColumnType("datetime")
                .HasColumnName("dThoigianmua");
            entity.Property(e => e.FPhivanchuyen).HasColumnName("fPhivanchuyen");
            entity.Property(e => e.FTongtien).HasColumnName("fTongtien");
            entity.Property(e => e.FkITrangthai).HasColumnName("FK_iTrangthai");
            entity.Property(e => e.FkSDiachiKhid).HasColumnName("FK_sDiachiKHID");
            entity.Property(e => e.FkSKhid)
                .HasMaxLength(10)
                .HasColumnName("FK_sKHID");
            entity.Property(e => e.IDungdiemthuong).HasColumnName("iDungdiemthuong");
            entity.Property(e => e.SGhichu)
                .HasMaxLength(255)
                .HasColumnName("sGhichu");
            entity.Property(e => e.SMavanchuyen)
                .HasMaxLength(255)
                .HasColumnName("sMavanchuyen");

            entity.HasOne(d => d.FkITrangthaiNavigation).WithMany(p => p.TblDonhangs)
                .HasForeignKey(d => d.FkITrangthai)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDonhan__FK_iT__628FA481");

            entity.HasOne(d => d.FkSDiachiKh).WithMany(p => p.TblDonhangs)
                .HasForeignKey(d => d.FkSDiachiKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDonhan__FK_sD__6383C8BA");

            entity.HasOne(d => d.FkSKh).WithMany(p => p.TblDonhangs)
                .HasForeignKey(d => d.FkSKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDonhan__FK_sK__619B8048");
        });

        modelBuilder.Entity<TblGiohang>(entity =>
        {
            entity.HasKey(e => e.PkIGiohangId).HasName("PK__tblGioha__2972451D31E5A812");

            entity.ToTable("tblGiohang");

            entity.Property(e => e.PkIGiohangId).HasColumnName("PK_iGiohangID");
            entity.Property(e => e.FkIKhid)
                .HasMaxLength(10)
                .HasColumnName("FK_iKHID");

            entity.HasOne(d => d.FkIKh).WithMany(p => p.TblGiohangs)
                .HasForeignKey(d => d.FkIKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblGiohan__FK_iK__6A30C649");
        });

        modelBuilder.Entity<TblHuyen>(entity =>
        {
            entity.HasKey(e => e.PkIHuyenId).HasName("PK__tblHuyen__46B37DF55BF92B19");

            entity.ToTable("tblHuyen");

            entity.Property(e => e.PkIHuyenId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iHuyenID");
            entity.Property(e => e.FkITinhId).HasColumnName("FK_iTinhID");
            entity.Property(e => e.STenhuyen)
                .HasMaxLength(255)
                .HasColumnName("sTenhuyen");

            entity.HasOne(d => d.FkITinh).WithMany(p => p.TblHuyens)
                .HasForeignKey(d => d.FkITinhId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblHuyen__FK_iTi__276EDEB3");
        });

        modelBuilder.Entity<TblKhachhang>(entity =>
        {
            entity.HasKey(e => e.PkSKhid).HasName("PK__tblKhach__5AC4B023CCAE759E");

            entity.ToTable("tblKhachhang");

            entity.Property(e => e.PkSKhid)
                .HasMaxLength(10)
                .HasColumnName("PK_sKHID");
            entity.Property(e => e.DNgaysinh)
                .HasColumnType("datetime")
                .HasColumnName("dNgaysinh");
            entity.Property(e => e.FkITaikhoanId).HasColumnName("FK_iTaikhoanID");
            entity.Property(e => e.IDiemthuong).HasColumnName("iDiemthuong");
            entity.Property(e => e.IsGioitinh).HasColumnName("isGioitinh");
            entity.Property(e => e.SHo)
                .HasMaxLength(255)
                .HasColumnName("sHo");
            entity.Property(e => e.SNghenghiep)
                .HasMaxLength(255)
                .HasColumnName("sNghenghiep");
            entity.Property(e => e.SSdt)
                .HasMaxLength(20)
                .HasColumnName("sSDT");
            entity.Property(e => e.STen)
                .HasMaxLength(255)
                .HasColumnName("sTen");

            entity.HasOne(d => d.FkITaikhoan).WithMany(p => p.TblKhachhangs)
                .HasForeignKey(d => d.FkITaikhoanId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblKhachh__FK_iT__33D4B598");
        });

        modelBuilder.Entity<TblKhuyenmai>(entity =>
        {
            entity.HasKey(e => e.PkIKhuyenmaiId).HasName("PK__tblKhuye__833D44A11DAF0B41");

            entity.ToTable("tblKhuyenmai");

            entity.Property(e => e.PkIKhuyenmaiId).HasColumnName("PK_iKhuyenmaiID");
            entity.Property(e => e.DThoigianbatdau)
                .HasColumnType("datetime")
                .HasColumnName("dThoigianbatdau");
            entity.Property(e => e.DThoigianketthuc)
                .HasColumnType("datetime")
                .HasColumnName("dThoigianketthuc");
            entity.Property(e => e.IsTrangthai).HasColumnName("isTrangthai");
            entity.Property(e => e.STenchuongtrinh)
                .HasMaxLength(255)
                .HasColumnName("sTenchuongtrinh");
        });

        modelBuilder.Entity<TblNhacungcap>(entity =>
        {
            entity.HasKey(e => e.PkINccid).HasName("PK__tblNhacu__245AB29D7B471C68");

            entity.ToTable("tblNhacungcap");

            entity.Property(e => e.PkINccid).HasColumnName("PK_iNCCID");
            entity.Property(e => e.SEmail)
                .HasMaxLength(255)
                .HasColumnName("sEmail");
            entity.Property(e => e.SMasothue)
                .HasMaxLength(255)
                .HasColumnName("sMasothue");
            entity.Property(e => e.SSdt)
                .HasMaxLength(20)
                .HasColumnName("sSDT");
            entity.Property(e => e.STenNcc)
                .HasMaxLength(255)
                .HasColumnName("sTenNCC");
        });

        modelBuilder.Entity<TblNhanvien>(entity =>
        {
            entity.HasKey(e => e.PkSNhanvienId).HasName("PK__tblNhanv__BD2DD5AAADA58749");

            entity.ToTable("tblNhanvien");

            entity.Property(e => e.PkSNhanvienId)
                .HasMaxLength(10)
                .HasColumnName("PK_sNhanvienID");
            entity.Property(e => e.DNgaysinh)
                .HasColumnType("date")
                .HasColumnName("dNgaysinh");
            entity.Property(e => e.FkITaikhoanId).HasColumnName("FK_iTaikhoanID");
            entity.Property(e => e.IsGioitinh).HasColumnName("isGioitinh");
            entity.Property(e => e.IsTrangthai).HasColumnName("isTrangthai");
            entity.Property(e => e.SHo)
                .HasMaxLength(255)
                .HasColumnName("sHo");
            entity.Property(e => e.SSdt)
                .HasMaxLength(20)
                .HasColumnName("sSDT");
            entity.Property(e => e.STen)
                .HasMaxLength(255)
                .HasColumnName("sTen");

            entity.HasOne(d => d.FkITaikhoan).WithMany(p => p.TblNhanviens)
                .HasForeignKey(d => d.FkITaikhoanId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblNhanvi__FK_iT__3C69FB99");
        });

        modelBuilder.Entity<TblPhanquyen>(entity =>
        {
            entity.HasKey(e => e.PkIQuyenId).HasName("PK__tblPhanq__517272A8770646EF");

            entity.ToTable("tblPhanquyen");

            entity.Property(e => e.PkIQuyenId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iQuyenID");
            entity.Property(e => e.STenquyen)
                .HasMaxLength(255)
                .HasColumnName("sTenquyen");
        });

        modelBuilder.Entity<TblPhieukiemke>(entity =>
        {
            entity.HasKey(e => e.PkIPhieukiemkeId).HasName("PK__tblPhieu__008849546FFA22EB");

            entity.ToTable("tblPhieukiemke");

            entity.Property(e => e.PkIPhieukiemkeId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iPhieukiemkeID");
            entity.Property(e => e.DThoigiantao)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiantao");
            entity.Property(e => e.SGhichu).HasColumnName("sGhichu");
        });

        modelBuilder.Entity<TblPhieunhaphang>(entity =>
        {
            entity.HasKey(e => e.PkIPhieunhaphangId).HasName("PK__tblPhieu__D61B58152EB4F4F8");

            entity.ToTable("tblPhieunhaphang");

            entity.Property(e => e.PkIPhieunhaphangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iPhieunhaphangID");
            entity.Property(e => e.DThoigiantao)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiantao");
            entity.Property(e => e.FChietkhau).HasColumnName("fChietkhau");
            entity.Property(e => e.FThueGtgt).HasColumnName("fThueGTGT");
            entity.Property(e => e.FkSNccid).HasColumnName("FK_sNCCID");
            entity.Property(e => e.SGhichu).HasColumnName("sGhichu");

            entity.HasOne(d => d.FkSNcc).WithMany(p => p.TblPhieunhaphangs)
                .HasForeignKey(d => d.FkSNccid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblPhieun__FK_sN__4CA06362");
        });

        modelBuilder.Entity<TblSanpham>(entity =>
        {
            entity.HasKey(e => e.PkISanphamId).HasName("PK__tblSanph__29B3296402204550");

            entity.ToTable("tblSanpham");

            entity.Property(e => e.PkISanphamId).HasColumnName("PK_iSanphamID");
            entity.Property(e => e.DThoigiantao)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiantao");
            entity.Property(e => e.FGiaban).HasColumnName("fGiaban");
            entity.Property(e => e.FGiavon).HasColumnName("fGiavon");
            entity.Property(e => e.FTrongluong).HasColumnName("fTrongluong");
            entity.Property(e => e.FkITheloaiId).HasColumnName("FK_iTheloaiID");
            entity.Property(e => e.ITonkho).HasColumnName("iTonkho");
            entity.Property(e => e.IsTrangthai).HasColumnName("isTrangthai");
            entity.Property(e => e.SHinhanh).HasColumnName("sHinhanh");
            entity.Property(e => e.SMavach)
                .HasMaxLength(255)
                .HasColumnName("sMavach");
            entity.Property(e => e.SMota).HasColumnName("sMota");
            entity.Property(e => e.STensanpham)
                .HasMaxLength(255)
                .HasColumnName("sTensanpham");

            entity.HasOne(d => d.FkITheloai).WithMany(p => p.TblSanphams)
                .HasForeignKey(d => d.FkITheloaiId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblSanpha__dThoi__440B1D61");
        });

        modelBuilder.Entity<TblTaikhoan>(entity =>
        {
            entity.HasKey(e => e.PkITaikhoanId).HasName("PK__tblTaikh__1E20CA9F17B995B7");

            entity.ToTable("tblTaikhoan");

            entity.Property(e => e.PkITaikhoanId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTaikhoanID");
            entity.Property(e => e.FkIQuyenId).HasColumnName("FK_iQuyenID");
            entity.Property(e => e.SEmail)
                .HasMaxLength(255)
                .HasColumnName("sEmail");
            entity.Property(e => e.SMatkhau)
                .HasMaxLength(255)
                .HasColumnName("sMatkhau");

            entity.HasOne(d => d.FkIQuyen).WithMany(p => p.TblTaikhoans)
                .HasForeignKey(d => d.FkIQuyenId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblTaikho__FK_iQ__2F10007B");
        });

        modelBuilder.Entity<TblTheloai>(entity =>
        {
            entity.HasKey(e => e.PkITheloaiId).HasName("PK__tblThelo__752A1C960DC5D95B");

            entity.ToTable("tblTheloai");

            entity.Property(e => e.PkITheloaiId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTheloaiID");
            entity.Property(e => e.FkIDanhmucId).HasColumnName("FK_iDanhmucID");
            entity.Property(e => e.STentheloai)
                .HasMaxLength(255)
                .HasColumnName("sTentheloai");

            entity.HasOne(d => d.FkIDanhmuc).WithMany(p => p.TblTheloais)
                .HasForeignKey(d => d.FkIDanhmucId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblTheloa__FK_iD__412EB0B6");
        });

        modelBuilder.Entity<TblTinh>(entity =>
        {
            entity.HasKey(e => e.PkITinhId).HasName("PK__tblTinh__F263F561BF64DBAA");

            entity.ToTable("tblTinh");

            entity.Property(e => e.PkITinhId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTinhID");
            entity.Property(e => e.STentinh)
                .HasMaxLength(255)
                .HasColumnName("sTentinh");
        });

        modelBuilder.Entity<TblXa>(entity =>
        {
            entity.HasKey(e => e.PkIXaId).HasName("PK__tblXa__9FE72B245CD91B90");

            entity.ToTable("tblXa");

            entity.Property(e => e.PkIXaId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iXaID");
            entity.Property(e => e.FkIHuyenId).HasColumnName("FK_iHuyenID");
            entity.Property(e => e.STenxa)
                .HasMaxLength(255)
                .HasColumnName("sTenxa");

            entity.HasOne(d => d.FkIHuyen).WithMany(p => p.TblXas)
                .HasForeignKey(d => d.FkIHuyenId)
                .HasConstraintName("FK__tblXa__FK_iHuyen__2A4B4B5E");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
