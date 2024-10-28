<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/27/2024
  Time: 7:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Khách Hàng Đã Mua</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center">Danh Sách Khách Hàng Đã Mua</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Giới Tính</th>
            <th>Đã Mua Sản Phẩm</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${purchasedCustomers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.ten}</td>
                <td>${customer.gender ? 'Nam' : 'Nữ'}</td>
                <td>${customer.daMua ? 'đã mua' : 'chưa mua'}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/khach?action=view" class="btn btn-primary">Trở Về Danh Sách Khách Hàng</a>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
