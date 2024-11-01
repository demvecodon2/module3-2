package case_cua_hang.service;

import case_cua_hang.model.KhachHang;

import java.util.List;

public interface IKhachHangService {
    List<KhachHang> findAll() ;

    void deleteById(String maKhachHang) ;

}
