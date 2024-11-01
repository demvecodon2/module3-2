package student.service;

import student.model.Student;
import student.repository.IStudentRepository;
import student.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> getAll() {
        return studentRepository.getAll();
    }

    @Override
    public void add(Student student) {
        studentRepository.add(student);
    }

    @Override
    public void remove(int id) {
    studentRepository.remove(id);
    }

    @Override
    public Student getById(int id) {
        return studentRepository.getById(id);
    }

    @Override
    public void update(int id, Student student) {
        studentRepository.update(id, student);

    }

    @Override
    public List<Student> searchByName(String name) {
        return studentRepository.searchByName(name);
    }



}
