<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Danh sách học viên</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Danh sách học viên</h1>
    <a href="${pageContext.request.contextPath}/students?action=create" class="btn btn-primary mb-3">Thêm học viên</a>
    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Giới tính</th>
            <th>Điểm số</th>
            <th>Xếp loại</th>
            <th>Ảnh</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.gender ? 'Nam' : 'Nữ'}</td>
                <td>${student.score}</td>
                <c:choose>
                    <c:when test="${student.score >= 85}">
                        <td>Giỏi</td>
                    </c:when>
                    <c:when test="${student.score >= 70}">
                        <td>Khá</td>
                    </c:when>
                    <c:when test="${student.score >= 50}">
                        <td>Trung bình</td>
                    </c:when>
                    <c:otherwise>
                        <td>Yếu</td>
                    </c:otherwise>
                </c:choose>
                <td><img src="${student.anh}" alt="Ảnh của ${student.name}" width="50" class="img-thumbnail"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/students?action=edit&id=${student.id}" class="btn btn-warning btn-sm">Chỉnh sửa</a>
                    <a href="${pageContext.request.contextPath}/students?action=delete&id=${student.id}" class="btn btn-danger btn-sm">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
