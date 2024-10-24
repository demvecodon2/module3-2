package bai_tap9;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/login")

public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/dang_ki/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals("admin") && password.equals("admin")){
            String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            request.setAttribute("time","admin đã đăng nhập thành công vào lúc" + time);
            request.getRequestDispatcher("/dang_ki/thanh-cong.jsp").forward(request, response);
        }else {
            request.setAttribute("mess","đăng nhập thất baij sai tài khoa hoặc mật khẩu");
            request.getRequestDispatcher("/dang_ki/login.jsp").forward(request, response);
        }
    }
}
