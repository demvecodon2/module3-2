package ban_test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/loginsever")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("css_trang_chu/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if ("admin".equals(username) && "admin".equals(password)) {
            String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            req.setAttribute("message", "admin đã đăng nhập thành công vào lúc " + time);
            req.getRequestDispatcher("css_trang_chu/success.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "username or password incorrect");
            req.getRequestDispatcher("css_trang_chu/login.jsp").forward(req, resp);
        }
    }
}
