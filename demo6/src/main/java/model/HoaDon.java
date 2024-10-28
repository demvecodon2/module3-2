package model;

import java.util.Date;

public class HoaDon {
    private String id;
    private Date ngayLap;

    private double tongTien;
    private KhachHang khachHang;

    public HoaDon(String id, Date ngayLap , double tongTien, KhachHang khachHang) {
        this.id = id;
        this.ngayLap = ngayLap;
        this.tongTien = tongTien;
        this.khachHang = khachHang;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getNgayLap() {
        return ngayLap;
    }

    public void setNgayLap(Date ngayLap) {
        this.ngayLap = ngayLap;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }
}
