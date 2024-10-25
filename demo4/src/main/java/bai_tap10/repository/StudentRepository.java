package bai_tap10.repository;

import bai_tap10.model.Student;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    List<Student> studentList = new ArrayList<>();
    public StudentRepository() {
        studentList.add(new Student(1, "Phan Văn An", true, 8));
        studentList.add(new Student(2, "Nguyễn Văn B", false, 9));
        studentList.add(new Student(3, "Lê Văn C", true, 7));
        studentList.add(new Student(4, "Đào Văn D", false, 6));
        studentList.add(new Student(5, "Trần Văn E", true, 5));
    }
    @Override
    public List<Student> findAll() {
        return new ArrayList<>(studentList);
    }
}
