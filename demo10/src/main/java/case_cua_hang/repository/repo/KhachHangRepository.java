package case_cua_hang.repository.repo;

import case_cua_hang.model.KhachHang;
import case_cua_hang.repository.IRepo.IKhachHangRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KhachHangRepository implements IKhachHangRepository {

    @Override
    public List<KhachHang> findAll() {
        List<KhachHang> khachHangs = new ArrayList<>();
        String query = "SELECT * FROM khach_hang";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int maKhachHang = resultSet.getInt("ma_khach_hang");
                String tenKhachHang = resultSet.getString("ten_khach_hang");
                String email = resultSet.getString("email");
                String sdt = resultSet.getString("sdt");
                String diaChi = resultSet.getString("dia_chi");
                String username = resultSet.getString("username");

                KhachHang khachHang = new KhachHang(maKhachHang, tenKhachHang, email, sdt, diaChi, username);
                khachHangs.add(khachHang);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving customers: " + e.getMessage(), e);
        }
        return khachHangs;
    }

    @Override
    public void deleteById(String maKhachHang) {
        String query = "DELETE FROM khach_hang WHERE ma_khach_hang  = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, maKhachHang);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQLState: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            throw new RuntimeException("Error deleting customer with ID " + maKhachHang + ": " + e.getMessage(), e);
        }

    }

}
