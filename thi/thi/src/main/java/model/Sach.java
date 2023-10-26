package model;

public class Sach {
    private  int ma;
    private String tenSach;
    private  String tacGia;
    private  String moTa;
    private int soLuong;

    public Sach() {
    }

    public Sach(int ma, String tenSach) {
        this.ma = ma;
        this.tenSach = tenSach;
    }

    public Sach(int ma, String tenSach, String tacGia, String moTa, int soLuong) {
        this.ma = ma;
        this.tenSach = tenSach;
        this.tacGia = tacGia;
        this.moTa = moTa;
        this.soLuong = soLuong;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
