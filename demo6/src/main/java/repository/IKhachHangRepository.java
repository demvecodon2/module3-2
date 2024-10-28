package repository;

import model.KhachHang;

import java.util.List;

public interface IKhachHangRepository {
    List<KhachHang> findAll();
    void deleteById(String id);
    List<KhachHang> findTopPurchasingCustomers();

    List<KhachHang> findPurchasedCustomers();
}

