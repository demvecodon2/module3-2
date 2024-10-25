package bai_tap10.controller;

import bai_tap10.model.Student;
import bai_tap10.sirvice.IStudentService;
import bai_tap10.sirvice.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentController extends HttpServlet {
    private final IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Student> students = studentService.findAll();
            req.setAttribute("students", students);
            req.getRequestDispatcher("/views/students.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đã xảy ra lỗi khi lấy danh sách học viên.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
    }
}
