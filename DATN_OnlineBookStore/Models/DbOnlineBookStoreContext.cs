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

    public virtual DbSet<TblTinh> TblTinhs { get; set; }

    public virtual DbSet<TblTlsach> TblTlsaches { get; set; }

    public virtual DbSet<TblTlvanphongpham> TblTlvanphongphams { get; set; }

    public virtual DbSet<TblXa> TblXas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-HOBK3H5\\MINSHN;Initial Catalog=db_OnlineBookStore;Integrated Security=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblCtdonhang>(entity =>
        {
            entity.HasKey(e => e.PkICtdonhangId).HasName("PK__tblCTdon__F7AB8A3AA65CE9F3");

            entity.ToTable("tblCTdonhang");

            entity.Property(e => e.PkICtdonhangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTdonhangID");
            entity.Property(e => e.FGiaban).HasColumnName("fGiaban");
            entity.Property(e => e.FKhuyenmai).HasColumnName("fKhuyenmai");
            entity.Property(e => e.FkIDonhangId).HasColumnName("FK_iDonhangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIDonhang).WithMany(p => p.TblCtdonhangs)
                .HasForeignKey(d => d.FkIDonhangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTdonh__FK_iD__68487DD7");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtdonhangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTdonh__FK_iS__6754599E");
        });

        modelBuilder.Entity<TblCtgiohang>(entity =>
        {
            entity.HasKey(e => e.PkICtgiohangId).HasName("PK__tblCTgio__DDD7D40B8451F389");

            entity.ToTable("tblCTgiohang");

            entity.Property(e => e.PkICtgiohangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTGiohangID");
            entity.Property(e => e.FkIGiohangId).HasColumnName("FK_iGiohangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIGiohang).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkIGiohangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iG__6EF57B66");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iS__6E01572D");
        });

        modelBuilder.Entity<TblCtkhuyenmai>(entity =>
        {
            entity.HasKey(e => e.PkICtkhuyenmaiId).HasName("PK__tblCTkhu__2FE4DA8DA3423D61");

            entity.ToTable("tblCTkhuyenmai");

            entity.Property(e => e.PkICtkhuyenmaiId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTkhuyenmaiID");
            entity.Property(e => e.FChietkhau).HasColumnName("fChietkhau");
            entity.Property(e => e.FkIKhuyenmaiId).HasColumnName("FK_iKhuyenmaiID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");

            entity.HasOne(d => d.FkIKhuyenmai).WithMany(p => p.TblCtkhuyenmais)
                .HasForeignKey(d => d.FkIKhuyenmaiId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTkhuy__FK_iK__4F7CD00D");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtkhuyenmais)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTkhuy__FK_iS__5070F446");
        });

        modelBuilder.Entity<TblCtphieukiemke>(entity =>
        {
            entity.HasKey(e => e.PkICtkiemkeId).HasName("PK__tblCTphi__78986D0AED8CF43F");

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
                .HasConstraintName("FK__tblCTphie__FK_iP__4BAC3F29");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtphieukiemkes)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iS__4CA06362");
        });

        modelBuilder.Entity<TblCtphieunhaphang>(entity =>
        {
            entity.HasKey(e => e.PkICtphieunhapId).HasName("PK__tblCTphi__E5AA799E155B0583");

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
                .HasConstraintName("FK__tblCTphie__FK_iP__47DBAE45");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtphieunhaphangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTphie__FK_iS__48CFD27E");
        });

        modelBuilder.Entity<TblCtsach>(entity =>
        {
            entity.HasKey(e => e.PkICtsachId).HasName("PK__tblCTsac__DE17AA4AB7EAECCA");

            entity.ToTable("tblCTsach");

            entity.Property(e => e.PkICtsachId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTsachID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.FkITlsachId).HasColumnName("FK_iTLsachID");
            entity.Property(e => e.ISotrang).HasColumnName("iSotrang");
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

            entity.HasOne(d => d.FkITlsach).WithMany(p => p.TblCtsaches)
                .HasForeignKey(d => d.FkITlsachId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTsach__FK_iT__5FB337D6");
        });

        modelBuilder.Entity<TblCttrangthaidonhang>(entity =>
        {
            entity.HasKey(e => e.PkITrangthaidonhangId).HasName("PK__tblCTtra__ACB4435187C21500");

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
            entity.HasKey(e => e.PkICtvanphongphamId).HasName("PK__tblCTvan__75C332689B398517");

            entity.ToTable("tblCTvanphongpham");

            entity.Property(e => e.PkICtvanphongphamId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iCTvanphongphamID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.FkITlvanphongphamId).HasColumnName("FK_iTLvanphongphamID");
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
                .HasConstraintName("FK__tblCTvanp__FK_iS__5AEE82B9");

            entity.HasOne(d => d.FkITlvanphongpham).WithMany(p => p.TblCtvanphongphams)
                .HasForeignKey(d => d.FkITlvanphongphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTvanp__FK_iT__5BE2A6F2");
        });

        modelBuilder.Entity<TblDanhgium>(entity =>
        {
            entity.HasKey(e => e.PkIDanhgiaId).HasName("PK__tblDanhg__0A1F2B25EA784E51");

            entity.ToTable("tblDanhgia");

            entity.Property(e => e.PkIDanhgiaId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iDanhgiaID");
            entity.Property(e => e.FXephang).HasColumnName("fXephang");
            entity.Property(e => e.FkICtdonhangId).HasColumnName("FK_iCTdonhangID");
            entity.Property(e => e.SMota)
                .HasMaxLength(255)
                .HasColumnName("sMota");

            entity.HasOne(d => d.FkICtdonhang).WithMany(p => p.TblDanhgia)
                .HasForeignKey(d => d.FkICtdonhangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDanhgi__FK_iC__71D1E811");
        });

        modelBuilder.Entity<TblDanhmuc>(entity =>
        {
            entity.HasKey(e => e.PkIDanhmucId).HasName("PK__tblDanhm__A295340721B7A7D3");

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
            entity.HasKey(e => e.PkSDiachiKhid).HasName("PK__tblDiach__E54C3887E303E43B");

            entity.ToTable("tblDiachiKH");

            entity.Property(e => e.PkSDiachiKhid)
                .ValueGeneratedNever()
                .HasColumnName("PK_sDiachiKHID");
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
            entity.HasKey(e => e.PkIDonhangId).HasName("PK__tblDonha__2200A070E3F323FD");

            entity.ToTable("tblDonhang");

            entity.Property(e => e.PkIDonhangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iDonhangID");
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
                .HasConstraintName("FK__tblDonhan__FK_iT__6383C8BA");

            entity.HasOne(d => d.FkSDiachiKh).WithMany(p => p.TblDonhangs)
                .HasForeignKey(d => d.FkSDiachiKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDonhan__FK_sD__6477ECF3");

            entity.HasOne(d => d.FkSKh).WithMany(p => p.TblDonhangs)
                .HasForeignKey(d => d.FkSKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblDonhan__FK_sK__628FA481");
        });
        modelBuilder.Entity<TblCtgiohang>(entity =>
        {
            entity.HasKey(e => e.PkICtgiohangId).HasName("PK__tblCTgio__DDD7D40B8451F389");

            entity.ToTable("tblCTgiohang");

            entity.Property(e => e.PkICtgiohangId)
                .ValueGeneratedOnAdd() // Đảm bảo rằng giá trị được tự động sinh ra
                .HasColumnName("PK_iCTGiohangID");

            entity.Property(e => e.FkIGiohangId).HasColumnName("FK_iGiohangID");
            entity.Property(e => e.FkISanphamId).HasColumnName("FK_iSanphamID");
            entity.Property(e => e.ISoluong).HasColumnName("iSoluong");

            entity.HasOne(d => d.FkIGiohang).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkIGiohangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iG__6EF57B66");

            entity.HasOne(d => d.FkISanpham).WithMany(p => p.TblCtgiohangs)
                .HasForeignKey(d => d.FkISanphamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblCTgioh__FK_iS__6E01572D");
        });

        modelBuilder.Entity<TblGiohang>(entity =>
        {
            entity.HasKey(e => e.PkIGiohangId).HasName("PK__tblGioha__2972451DFD9B65CC");

            entity.ToTable("tblGiohang");

            entity.Property(e => e.PkIGiohangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iGiohangID");
            entity.Property(e => e.FkIKhid)
                .HasMaxLength(10)
                .HasColumnName("FK_iKHID");

            entity.HasOne(d => d.FkIKh).WithMany(p => p.TblGiohangs)
                .HasForeignKey(d => d.FkIKhid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblGiohan__FK_iK__6B24EA82");
        });

        modelBuilder.Entity<TblHuyen>(entity =>
        {
            entity.HasKey(e => e.PkIHuyenId).HasName("PK__tblHuyen__46B37DF5FAF1026D");

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
                .HasConstraintName("FK__tblHuyen__FK_iTi__267ABA7A");
        });

        modelBuilder.Entity<TblKhachhang>(entity =>
        {
            entity.HasKey(e => e.PkSKhid).HasName("PK__tblKhach__5AC4B023315B4494");

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
            entity.HasKey(e => e.PkIKhuyenmaiId).HasName("PK__tblKhuye__833D44A159B176A8");

            entity.ToTable("tblKhuyenmai");

            entity.Property(e => e.PkIKhuyenmaiId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iKhuyenmaiID");
            entity.Property(e => e.DThoigianbatdau)
                .HasColumnType("datetime")
                .HasColumnName("dThoigianbatdau");
            entity.Property(e => e.DThoigianketthuc)
                .HasColumnType("datetime")
                .HasColumnName("dThoigianketthuc");
            entity.Property(e => e.IsTrangthai).HasColumnName("isTrangthai");
        });

        modelBuilder.Entity<TblNhacungcap>(entity =>
        {
            entity.HasKey(e => e.PkSNccid).HasName("PK__tblNhacu__4E2C011E9784FD0A");

            entity.ToTable("tblNhacungcap");

            entity.Property(e => e.PkSNccid)
                .ValueGeneratedNever()
                .HasColumnName("PK_sNCCID");
            entity.Property(e => e.FkIXaId).HasColumnName("FK_iXaID");
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

            entity.HasOne(d => d.FkIXa).WithMany(p => p.TblNhacungcaps)
                .HasForeignKey(d => d.FkIXaId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblNhacun__FK_iX__2C3393D0");
        });

        modelBuilder.Entity<TblNhanvien>(entity =>
        {
            entity.HasKey(e => e.PkSNhanvienId).HasName("PK__tblNhanv__BD2DD5AA8C367BA5");

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
                .HasConstraintName("FK__tblNhanvi__FK_iT__3A81B327");
        });

        modelBuilder.Entity<TblPhanquyen>(entity =>
        {
            entity.HasKey(e => e.PkIQuyenId).HasName("PK__tblPhanq__517272A8C3261475");

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
            entity.HasKey(e => e.PkIPhieukiemkeId).HasName("PK__tblPhieu__00884954473EEB51");

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
            entity.HasKey(e => e.PkIPhieunhaphangId).HasName("PK__tblPhieu__D61B58151399EB78");

            entity.ToTable("tblPhieunhaphang");

            entity.Property(e => e.PkIPhieunhaphangId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iPhieunhaphangID");
            entity.Property(e => e.DThoigiantao)
                .HasColumnType("datetime")
                .HasColumnName("dThoigiantao");
            entity.Property(e => e.FChietkhau).HasColumnName("fChietkhau");
            entity.Property(e => e.FkSNccid).HasColumnName("FK_sNCCID");
            entity.Property(e => e.SGhichu).HasColumnName("sGhichu");

            entity.HasOne(d => d.FkSNcc).WithMany(p => p.TblPhieunhaphangs)
                .HasForeignKey(d => d.FkSNccid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblPhieun__FK_sN__44FF419A");
        });

        modelBuilder.Entity<TblSanpham>(entity =>
        {
            entity.HasKey(e => e.PkISanphamId).HasName("PK__tblSanph__29B32964A02CAD40");

            entity.ToTable("tblSanpham");

            entity.Property(e => e.PkISanphamId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iSanphamID");
            entity.Property(e => e.FGiaban).HasColumnName("fGiaban");
            entity.Property(e => e.FGiavon).HasColumnName("fGiavon");
            entity.Property(e => e.FTrongluong).HasColumnName("fTrongluong");
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
        });

        modelBuilder.Entity<TblTaikhoan>(entity =>
        {
            entity.HasKey(e => e.PkITaikhoanId).HasName("PK__tblTaikh__1E20CA9F93755935");

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
                .HasConstraintName("FK__tblTaikho__FK_iQ__30F848ED");
        });

        modelBuilder.Entity<TblTinh>(entity =>
        {
            entity.HasKey(e => e.PkITinhId).HasName("PK__tblTinh__F263F561D28B582A");

            entity.ToTable("tblTinh");

            entity.Property(e => e.PkITinhId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTinhID");
            entity.Property(e => e.STentinh)
                .HasMaxLength(255)
                .HasColumnName("sTentinh");
        });

        modelBuilder.Entity<TblTlsach>(entity =>
        {
            entity.HasKey(e => e.PkITlsachId).HasName("PK__tblTLsac__A12BA9DA9839AA20");

            entity.ToTable("tblTLsach");

            entity.Property(e => e.PkITlsachId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTLsachID");
            entity.Property(e => e.FkIDanhmuc).HasColumnName("FK_iDanhmuc");
            entity.Property(e => e.STenTlsach)
                .HasMaxLength(255)
                .HasColumnName("sTenTLsach");

            entity.HasOne(d => d.FkIDanhmucNavigation).WithMany(p => p.TblTlsaches)
                .HasForeignKey(d => d.FkIDanhmuc)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblTLsach__FK_iD__5812160E");
        });

        modelBuilder.Entity<TblTlvanphongpham>(entity =>
        {
            entity.HasKey(e => e.PkITlvanphongphamId).HasName("PK__tblTLvan__840720E2BB821BF1");

            entity.ToTable("tblTLvanphongpham");

            entity.Property(e => e.PkITlvanphongphamId)
                .ValueGeneratedNever()
                .HasColumnName("PK_iTLvanphongphamID");
            entity.Property(e => e.FkIDanhmucId).HasColumnName("FK_iDanhmucID");
            entity.Property(e => e.STenTlvanphongpham)
                .HasMaxLength(255)
                .HasColumnName("sTenTLvanphongpham");

            entity.HasOne(d => d.FkIDanhmuc).WithMany(p => p.TblTlvanphongphams)
                .HasForeignKey(d => d.FkIDanhmucId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblTLvanp__FK_iD__5535A963");
        });

        modelBuilder.Entity<TblXa>(entity =>
        {
            entity.HasKey(e => e.PkIXaId).HasName("PK__tblXa__9FE72B2479AACE15");

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
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tblXa__FK_iHuyen__29572725");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
