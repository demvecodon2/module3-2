<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tạo học viên</title>
</head>
<body>
<h1>Tạo học viên mới</h1>
<form action="${pageContext.request.contextPath}/students?action=create" method="post">
    <%--@declare id="gender"--%><label for="id">Mã học viên:</label>
    <input type="text" id="id" name="id" required>
    <br>
    <label for="name">Tên học viên:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="gender">Giới tính:</label>
    <input type="radio" id="male" name="gender" value="true" required>Nam
    <input type="radio" id="female" name="gender" value="false" required>Nữ
    <br>
    <label for="score">Điểm số:</label>
    <input type="number" id="score" name="score" required>
    <br>
    <label for="anh">Ảnh:</label>
    <input type="text" id="anh" name="anh">
    <br>
    <input type="submit" value="Tạo học viên">
</form>
</body>
</html>
