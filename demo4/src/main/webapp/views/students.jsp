<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách học viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Danh sách học viên</h1>
    <c:choose>
        <c:when test="${empty students}">
            <div class="alert alert-warning" role="alert">Danh sách rỗng</div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>Mã học viên</th>
                    <th>Tên học viên</th>
                    <th>Giới tính</th>
                    <th>Điểm số</th>
                    <th>Xếp loại</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>
                            <c:if test="${student.gender}">Nam</c:if>
                            <c:if test="${not student.gender}">Nữ</c:if>
                        </td>
                        <td>${student.score}</td>
                        <td>
                            <c:choose>
                                <c:when test="${student.score >= 8}">Giỏi</c:when>
                                <c:when test="${student.score >= 6}">Khá</c:when>
                                <c:when test="${student.score >= 4}">Trung bình</c:when>
                                <c:otherwise>Yếu</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

