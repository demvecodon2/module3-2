<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/23/2024
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="LoginServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <input type="submit" value="Login">
</form>
<c:if test="${not empty param.error}">
    <p style="color:red;">Tên đăng nhập hoặc mật khẩu không đúng.</p>
</c:if>
</body>
</html>
