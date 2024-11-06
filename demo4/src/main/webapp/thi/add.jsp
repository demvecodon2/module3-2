<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm Sản Phẩm</title>
</head>
<body>
<h2>Thêm Sản Phẩm Mới</h2>
<form action="home" method="post">
    <label for="name">Tên Sản Phẩm:</label>
    <input type="text" id="name" name="name" required>
    <br>
    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" required>
    <br>
    <label for="discount">Giảm Giá:</label>
    <input type="text" id="discount" name="discount">
    <br>
    <label for="inventory">Tồn Kho:</label>
    <input type="text" id="inventory" name="inventory">
    <br>
    <input type="hidden" name="action" value="add"> <!-- Thêm action để xác định loại hành động -->
    <input type="submit" value="Thêm">
</form>
<a href="home?action=list">Quay lại danh sách sản phẩm</a>
</body>
</html>
