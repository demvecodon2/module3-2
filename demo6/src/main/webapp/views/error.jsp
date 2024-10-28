<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/27/2024
  Time: 7:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lỗi</title>
</head>
<body>
<h1>Có Lỗi Xảy Ra</h1>
<div style="color: red;">${error}</div>
<a href="${pageContext.request.contextPath}/khach?action=view">Quay lại</a>
</body>
</html>

