<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa học viên</title>
</head>
<body>
<h1>Chỉnh sửa học viên</h1>
<form action="${pageContext.request.contextPath}/students?action=edit" method="post">
    <%--@declare id="gender"--%><input type="hidden" name="id" value="${student.id}">
    <label for="name">Tên học viên:</label>
    <input type="text" id="name" name="name" value="${student.name}" required>
    <br>
    <label for="gender">Giới tính:</label>
    <input type="radio" name="gender" value="true" <c:if test="${student.gender}">checked</c:if> required>Nam
    <input type="radio" name="gender" value="false" <c:if test="${!student.gender}">checked</c:if> required>Nữ
    <br>
    <label for="score">Điểm số:</label>
    <input type="number" id="score" name="score" value="${student.score}" required>
    <br>
    <label for="anh">Ảnh:</label>
    <input type="text" id="anh" name="anh" value="${student.anh}">
    <br>
    <input type="submit" value="Cập nhật học viên">
</form>
</body>
</html>
