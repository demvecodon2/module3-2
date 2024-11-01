<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/30/2024
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Khách Hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Danh Sách Khách Hàng</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <table class="table table-bordered table-striped mt-3">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>email</th>
            <th>sdt</th>
            <th>dia_chi</th>
            <th>username</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.maKhachHang}</td>
                <td>${customer.tenKhachHang}</td>
                <td>${customer.email}</td>
                <td>${customer.sdt}</td>
                <td>${customer.diaChi}</td>
                <td>${customer.username}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/khach?action=delete&id=${customer.maKhachHang}" class="btn btn-danger btn-sm">Xoá</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/khach?action=purchased" class="btn btn-primary">Xem khách Đã Mua</a>
        <a href="${pageContext.request.contextPath}/khach?action=topPurchasing" class="btn btn-secondary"> Danh sách khách hàng mua nhiều nhất</a>h
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


