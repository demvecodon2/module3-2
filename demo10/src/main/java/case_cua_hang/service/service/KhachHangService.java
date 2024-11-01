package case_cua_hang.service;

import case_cua_hang.model.KhachHang;
import case_cua_hang.repository.IRepo.IKhachHangRepository;
import case_cua_hang.repository.repo.KhachHangRepository;

import java.util.List;

public class KhachHangService implements IKhachHangService {
    private final IKhachHangRepository khachHangRepository = new KhachHangRepository();

    @Override
    public List<KhachHang> findAll() {
        return khachHangRepository.findAll();
    }

    @Override
    public void deleteById(String maKhachHang) {
        khachHangRepository.deleteById(maKhachHang);
    }


}
