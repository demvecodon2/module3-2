<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách học viên</title>
</head>
<body>
<h1>Danh sách học viên</h1>
<a href="${pageContext.request.contextPath}/students?action=create">Thêm học viên</a>
<table border="1">
    <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm số</th>
        <th>Ảnh</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.gender ? 'Nam' : 'Nữ'}</td>
            <td>${student.score}</td>
            <td><img src="${student.anh}" alt="Ảnh của ${student.name}" width="50"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/students?action=edit&id=${student.id}">Chỉnh sửa</a>
                <a href="${pageContext.request.contextPath}/students?action=delete&id=${student.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
