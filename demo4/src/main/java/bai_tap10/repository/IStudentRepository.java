package bai_tap10.repository;

import bai_tap10.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
}
