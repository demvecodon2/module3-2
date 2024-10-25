package bai_tap10.repository;

import bai_tap10.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    public List<Student> students = new ArrayList<>();

    public StudentRepository() {
        students.add(new Student("001", "Nguyễn Văn A", true, 90, "https://i.pinimg.com/236x/fd/29/5b/fd295b5eb656e405c01556fc6ff07660.jpg"));
        students.add(new Student("002", "Nguyễn Văn B", true, 80, "https://i.pinimg.com/236x/20/41/74/204174415a2c3860967a32272cdf2fa7.jpg"));
        students.add(new Student("003", "Nguyễn Văn C", true, 70, "https://i.pinimg.com/474x/42/e8/9f/42e89f1c31eb10b4607bceb18bd87363.jpg"));
        students.add(new Student("004", "Nguyễn Thị D", false, 60, "https://i.pinimg.com/474x/2d/28/05/2d280554b16e9113166e8575276c8ee2.jpg"));
        students.add(new Student("005", "Nguyễn Văn E", true, 50,"https://i.pinimg.com/474x/18/36/c8/1836c894f45979dd34971e8518c4d514.jpg"));
        students.add(new Student("006", "Nguyễn Thị F", false, 40, "https://i.pinimg.com/474x/3e/f2/7d/3ef27dca8b31713348e07e84dd6597a3.jpg"));
    }

    @Override
    public List<Student> findAll() {
        return new ArrayList<>(students);
    }

    @Override
    public void add(Student student) {
        students.add(student);
    }

    @Override
    public void delete(String id) {
        students.removeIf(student -> student.getId().equals(id));
    }

    @Override
    public Student findById(String id) {
        return students.stream()
                .filter(student -> student.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public void update(String id, Student student) {
        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getId().equals(id)) {
                students.set(i, student);
                return;
            }
        }
    }
}
