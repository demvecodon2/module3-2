package student.controller;

import student.model.Student;
import student.service.IStudentService;
import student.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class StudentController extends HttpServlet {
    IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "remove":
                    deleteStudent(req, resp);
                    break;
                case "search":
                    searchStudent(req, resp);
                    break;
                default:
                    listStudent(req, resp);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đã xảy ra lỗi trong quá trình xử lý yêu cầu.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
    }

    private void searchStudent(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        req.setAttribute("students", studentService.searchByName(name));
        try {
            req.getRequestDispatcher("/views/listStudent.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    private void listStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = studentService.getAll();
        req.setAttribute("students", students);
        req.getRequestDispatcher("/views/listStudent.jsp").forward(req, resp);

    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            studentService.remove(id);
        } else {
            req.setAttribute("error", "Không tìm thấy thông tin sinh viên.");
        }
        listStudent(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            req.setAttribute("student", studentService.getById(id));
            try {
                req.getRequestDispatcher("/views/editStudent.jsp").forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        } else {
           req.setAttribute("error", "Không tìm thấy thông tin sinh viên.");
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/createStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createStudent(req, resp);
                    break;
                case "edit":
                    updateStudent(req, resp);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đã xảy ra lỗi trong quá trình xử lý yêu cầu.");
            req.getRequestDispatcher("/views/error.jsp").forward(req, resp);
        }
    }

    private void updateStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("Id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            String name = req.getParameter("Name");
            String email = req.getParameter("Email");
            String address = req.getParameter("Address");
            String phone = req.getParameter("Phone");
            String classroom = req.getParameter("Class_room");
            studentService.update(id, new Student(id, name, email, address, phone, classroom));
            listStudent(req, resp);
        } else {
            req.setAttribute("error", "ID không hợp lệ.");
        }
    }

    private void createStudent(HttpServletRequest req, HttpServletResponse resp) {
try {
    int id = Integer.parseInt(req.getParameter("Id"));
    String name = req.getParameter("Name");
    String email = req.getParameter("Email");
    String address = req.getParameter("Address");
    String phone = req.getParameter("Phone");
    String classroom = req.getParameter("Class_room");
    studentService.add(new Student(id, name, email, address, phone, classroom));
    listStudent(req, resp);
    req.setAttribute("message", "Thêm mới thành công.");
    req.getRequestDispatcher("/views/createStudent.jsp").forward(req, resp);
}catch (NumberFormatException e) {
    req.setAttribute("error", "ID không hợp lệ.");
} catch (ServletException | IOException e) {
    throw new RuntimeException(e);
}
    }
}
