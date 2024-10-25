package bai_tap10.sirvice;

import bai_tap10.model.Student;
import bai_tap10.repository.IStudentRepository;
import bai_tap10.repository.StudentRepository;

import java.util.Collections;
import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository repository = new StudentRepository() ;
    @Override
    public List<Student> findAll() {
        return repository.findAll();
    }
}
