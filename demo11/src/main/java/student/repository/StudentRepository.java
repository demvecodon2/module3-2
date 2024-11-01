package student.repository;

import student.model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    @Override
    public List<Student> getAll() {
        Connection connection = BaseRepository.getConnection();
        List<Student> students = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Student");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("Id");
                String name = resultSet.getString("Name");
                String address = resultSet.getString("Address");
                String email = resultSet.getString("Email");
                String phone = resultSet.getString("Phone");
                String classRoom = resultSet.getString("Class_room");
                students.add(new Student(id, name, address, email, phone, classRoom));
            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return students;
    }

    @Override
    public void add(Student student) {
        Connection connection = BaseRepository.getConnection();
        String sql = "INSERT INTO Student (Name, Address, Email, Phone, Class_room) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getAddress());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setString(4, student.getPhone());
            preparedStatement.setString(5, student.getClassRoom());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnection();
        String sql = "DELETE FROM Student WHERE Id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    @Override
    public Student getById(int id) {
        Connection connection = BaseRepository.getConnection();
        String sql = "SELECT * FROM Student WHERE Id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("Name");
                    String address = resultSet.getString("Address");
                    String email = resultSet.getString("Email");
                    String phone = resultSet.getString("Phone");
                    String classRoom = resultSet.getString("Class_room");
                    return new Student(id, name, address, email, phone, classRoom);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(int id, Student student) {
        Connection connection = BaseRepository.getConnection();
        String sql = "UPDATE Student SET Name = ?, Address = ?, Email = ?, Phone = ?, Class_room = ? WHERE Id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getAddress());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setString(4, student.getPhone());
            preparedStatement.setString(5, student.getClassRoom());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Student> searchByName(String name) {
        Connection connection = BaseRepository.getConnection();
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM Student WHERE Name LIKE ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + name + "%");
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("Id");
                    String studentName = resultSet.getString("Name");
                    String address = resultSet.getString("Address");
                    String email = resultSet.getString("Email");
                    String phone = resultSet.getString("Phone");
                    String classRoom = resultSet.getString("Class_room");
                    students.add(new Student(id, studentName, address, email, phone, classRoom));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return students;
    }
}

