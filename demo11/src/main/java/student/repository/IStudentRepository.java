package student.repository;

import student.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> getAll();
    void add(Student student);
    void remove(int id);
    Student getById(int id);
    void update(int id, Student student);
    List<Student> searchByName(String name);
}
