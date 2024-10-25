package bai_tap9;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/dangki/login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (username.equals("admin") && password.equals("admin")) {
            String time = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
                    req.setAttribute("message","admin đã đăng nhập thành công vào lúc"+ time);
            req.getRequestDispatcher("/dangki/success.jsp").forward(req, resp);
        }else {
            req.setAttribute("errorMessage","đăng nhập thất bại sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/dangki/login.jsp").forward(req, resp);
        }
    }
}