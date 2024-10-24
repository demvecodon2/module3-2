<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/24/2024
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h2>Login Form</h2>
<form action="/login" method="post">
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Login">
</form>
<c:if test="${not empty mess}">
    <p style="color:red">${mess}</p>
</c:if>
</body>
</html>

