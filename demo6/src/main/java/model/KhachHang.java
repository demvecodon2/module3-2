package model;

import java.util.ArrayList;
import java.util.List;

public class KhachHang {
    private String id;
    private String ten;
    private String email;
    private boolean gender;
    private boolean daMua;
    private int soLanMua;
//    private List<GioHang> gioHang;
    private List<HoaDon> hoaDon;


    public KhachHang(String id, String ten, String email,boolean gender,boolean daMua,int soLanMua) {
        this.id = id;
        this.ten = ten;
        this.email = email;
        this.gender = gender;
        this.daMua = daMua;
        this.soLanMua= soLanMua;
//        this.gioHang = new ArrayList<>();
        this.hoaDon = new ArrayList<>();
    }
    public int getSoLanMua() {
        return soLanMua;
    }
    public void setSoLanMua(int soLanMua) {
        this.soLanMua = soLanMua;
    }
    public boolean isGender() {
        return gender;
    }
    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDaMua() {
        return daMua;
    }

    public void setDaMua(boolean daMua) {
        this.daMua = daMua;
    }
//
//    public List<GioHang> getGioHang() {
//        return gioHang;
//    }
//
//    public void setGioHang(List<GioHang> gioHang) {
//        this.gioHang = gioHang;
//    }

    public List<HoaDon> getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(List<HoaDon> hoaDon) {
        this.hoaDon = hoaDon;
    }
}

