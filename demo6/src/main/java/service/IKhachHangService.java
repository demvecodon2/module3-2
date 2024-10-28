package service;

import model.KhachHang;

import java.util.List;

public interface IKhachHangService {
    List<KhachHang> findAll();
    void deleteById(String id);
    List<KhachHang> findPurchasedCustomers();

    List<KhachHang> findTopPurchasingCustomers();
}

