package com.example.thi_module3.model;

public class HinhThucThanhToan {
    private int id;
    private String tenHinhThuc;
    public HinhThucThanhToan(int id, String tenHinhThuc) {
        this.id = id;
        this.tenHinhThuc = tenHinhThuc;
    }
    public HinhThucThanhToan(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenHinhThuc() {
        return tenHinhThuc;
    }

    public void setTenHinhThuc(String tenHinhThuc) {
        this.tenHinhThuc = tenHinhThuc;
    }
}
