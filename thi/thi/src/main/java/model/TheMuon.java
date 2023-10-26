package model;

public class TheMuon {
    private int ma;
    private int maSach;
    private int maHocSinh;
    private  String trangThai;
    private String ngayMuon;
    private String ngayTra;

    public TheMuon() {
    }

    public TheMuon(int ma, int maSach, int maHocSinh, String trangThai, String ngayMuon, String ngayTra) {
        this.ma = ma;
        this.maSach = maSach;
        this.maHocSinh = maHocSinh;
        this.trangThai = trangThai;
        this.ngayMuon = ngayMuon;
        this.ngayTra = ngayTra;
    }

    public TheMuon(int maSach, int maHocSinh, String trangThai, String ngayMuon, String ngayTra) {
        this.maSach = maSach;
        this.maHocSinh = maHocSinh;
        this.trangThai = trangThai;
        this.ngayMuon = ngayMuon;
        this.ngayTra = ngayTra;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public int getMaHocSinh() {
        return maHocSinh;
    }

    public void setMaHocSinh(int maHocSinh) {
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
