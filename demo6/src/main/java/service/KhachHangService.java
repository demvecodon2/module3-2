package service;

import model.KhachHang;
import repository.IKhachHangRepository;
import repository.KhachHangRepository;

import java.util.Collections;
import java.util.List;

import java.util.Collections;
import java.util.List;

public class KhachHangService implements IKhachHangService {
    private final IKhachHangRepository khachHangRepository = new KhachHangRepository();

    @Override
    public List<KhachHang> findAll() {
        return khachHangRepository.findAll();
    }

    @Override
    public void deleteById(String id) {
        khachHangRepository.deleteById(id);
    }

    @Override
    public List<KhachHang> findPurchasedCustomers() {
        return khachHangRepository.findPurchasedCustomers();
    }

    @Override
    public List<KhachHang> findTopPurchasingCustomers() {
        return khachHangRepository.findTopPurchasingCustomers();
    }
}
