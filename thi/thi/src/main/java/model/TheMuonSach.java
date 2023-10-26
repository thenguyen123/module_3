package model;

public class TheMuonSach {
    private int ma;
    private Sach maSach;
    private HocSinh maHocSinh;
    private  String trangThai;
    private String ngayMuon;
    private String ngayTra;

    public TheMuonSach(int ma, Sach maSach, HocSinh maHocSinh, String trangThai, String ngayMuon, String ngayTra) {
        this.ma = ma;
        this.maSach = maSach;
        this.maHocSinh = maHocSinh;
        this.trangThai = trangThai;
        this.ngayMuon = ngayMuon;
        this.ngayTra = ngayTra;
    }

    public TheMuonSach(int ma) {
        this.ma = ma;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public Sach getMaSach() {
        return maSach;
    }

    public void setMaSach(Sach maSach) {
        this.maSach = maSach;
    }

    public HocSinh getMaHocSinh() {
        return maHocSinh;
    }

    public void setMaHocSinh(HocSinh maHocSinh) {
        this.maHocSinh = maHocSinh;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getNgayMuon() {
        return ngayMuon;
    }

    public void setNgayMuon(String ngayMuon) {
        this.ngayMuon = ngayMuon;
    }

    public String getNgayTra() {
        return ngayTra;
    }

    public void setNgayTra(String ngayTra) {
        this.ngayTra = ngayTra;
    }
}
