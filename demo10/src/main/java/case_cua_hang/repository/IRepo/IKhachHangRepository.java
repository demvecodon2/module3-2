package case_cua_hang.repository.IRepo;

import case_cua_hang.model.KhachHang;

import java.util.List;

public interface IKhachHangRepository {
    List<KhachHang> findAll() ;
    void deleteById(String maKhachHang) ;
}
