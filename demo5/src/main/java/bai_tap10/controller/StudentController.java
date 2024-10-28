package bai_tap10.controller;

import bai_tap10.model.Student;
import bai_tap10.service.IStudentService;
import bai_tap10.service.StudentService;

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
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            try {
                switch (action) {
                    case "create":
                        showCreateForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteStudent(request, response);
                        break;
                    default:
                        listStudents(request, response);
                        break;
                }
            } catch (Exception e) {
                handleException(request, response, e);
            }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter("action");

            if (action != null) {
                try {
                    switch (action) {
                        case "create":
                            createStudent(request, response);
                            break;
                        case "edit":
                            editStudent(request, response);
                            break;
                        default:
                            handleInvalidAction(request, response);
                            break;
                    }
                } catch (Exception e) {
                    handleException(request, response, e);
                }
            } else {
                handleUndefinedAction(request, response);
            }
        }

        private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/views/create.jsp").forward(request, response);
        }

        private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id");
            Student student = studentService.findById(id);
            if (student != null) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("/views/edit.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Học viên không tồn tại.");
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            }
        }

        private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String idToDelete = request.getParameter("id");
            studentService.delete(idToDelete);
            response.sendRedirect(request.getContextPath() + "/students");
        }

        private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Student> students = studentService.findAll();
            request.setAttribute("students", students);
            request.getRequestDispatcher("/views/students.jsp").forward(request, response);
        }

        private void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            int score = Integer.parseInt(request.getParameter("score"));
            String anh = request.getParameter("anh");
            Student newStudent = new Student(id, name, gender, score, anh);
            studentService.add(newStudent);
            response.sendRedirect(request.getContextPath() + "/students");
        }

        private void editStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String idToUpdate = request.getParameter("id");
            String nameToUpdate = request.getParameter("name");
            boolean genderToUpdate = Boolean.parseBoolean(request.getParameter("gender"));
            int scoreToUpdate = Integer.parseInt(request.getParameter("score"));
            String anhToUpdate = request.getParameter("anh");
            Student updatedStudent = new Student(idToUpdate, nameToUpdate, genderToUpdate, scoreToUpdate, anhToUpdate);
            studentService.update(idToUpdate, updatedStudent);
            response.sendRedirect(request.getContextPath() + "/students ");
        }

        private void handleInvalidAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setAttribute("error", "Hành động không hợp lệ.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }

        private void handleException(HttpServletRequest request, HttpServletResponse response, Exception e) throws ServletException, IOException {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }

        private void handleUndefinedAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setAttribute("error", "Hành động không xác định.");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }
