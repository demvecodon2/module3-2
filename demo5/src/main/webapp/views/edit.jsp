<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Chỉnh sửa học viên</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Chỉnh sửa học viên</h1>
    <form action="${pageContext.request.contextPath}/students?action=edit" method="post">
        <input type="hidden" name="id" value="${student.id}">

        <div class="form-group">
            <label for="name">Tên học viên:</label>
            <input type="text" id="name" name="name" class="form-control" value="${student.name}" required>
        </div>

        <div class="form-group">
            <label>Giới tính:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" name="gender" value="true" class="form-check-input" <c:if test="${student.gender}">checked</c:if> required>
                <label class="form-check-label" for="gender">Nam</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" name="gender" value="false" class="form-check-input" <c:if test="${!student.gender}">checked</c:if> required>
                <label class="form-check-label" for="gender">Nữ</label>
            </div>
        </div>

        <div class="form-group">
            <label for="score">Điểm số:</label>
            <input type="number" id="score" name="score" class="form-control" value="${student.score}" required>
        </div>

        <div class="form-group">
            <label for="anh">Ảnh:</label>
            <input type="text" id="anh" name="anh" class="form-control" value="${student.anh}">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật học viên</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
