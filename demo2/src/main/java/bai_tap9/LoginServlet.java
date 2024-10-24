import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "123abc".equals(password)) {
            // Đăng nhập thành công
            String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            request.setAttribute("message", "admin đăng nhập thành công vào lúc " + currentTime);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // Đăng nhập thất bại
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
