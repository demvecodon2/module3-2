<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/27/2024
  Time: 7:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Khách Hàng</title>
</head>
<body>
<h1>Danh Sách Khách Hàng</h1>

<c:if test="${not empty error}">
    <div style="color: red;">${error}</div>
</c:if>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giới Tính</th>
        <th>Điểm</th>
        <th>Ảnh</th>
        <th>Hành Động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.gender ? 'Nam' : 'Nữ'}</td>
            <td>${customer.score}</td>
            <td><img src="${customer.anh}" alt="${customer.name}" width="50" /></td>
            <td>
                <a href="${pageContext.request.contextPath}/khach?action=delete&id=${customer.id}">Xoá</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/khach?action=purchased">Xem Khách Hàng Đã Mua</a>
</body>
</html>

