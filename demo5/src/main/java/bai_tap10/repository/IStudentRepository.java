package bai_tap10.repository;

import bai_tap10.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    void add(Student student);
    void delete(String id);
    Student findById(String id);
    void update(String id, Student student);

}
