package bai_tap10.service;

import bai_tap10.model.Student;
import bai_tap10.repository.IStudentRepository;
import bai_tap10.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    private final IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public void add(Student student) {
        studentRepository.add(student);
    }

    @Override
    public void delete(String id) {
        studentRepository.delete(id);
    }

    @Override
    public Student findById(String id) {
        return studentRepository.findById(id);
    }

    @Override
    public void update(String id, Student student) {
        studentRepository.update(id, student);
    }
}
