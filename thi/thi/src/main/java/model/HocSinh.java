package model;

public class HocSinh {
    private  int ma;
    private String hoTen;
    private  String lop;

    public HocSinh(int ma, String hoTen, String lop) {
        this.ma = ma;
        this.hoTen = hoTen;
        this.lop = lop;
    }

    public HocSinh(int ma, String hoTen) {
        this.ma = ma;
        this.hoTen = hoTen;
    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getLop() {
        return lop;
    }

    public void setLop(String lop) {
        this.lop = lop;
    }
}
