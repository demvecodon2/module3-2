<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sản Phẩm Bán Chạy Nhất</title>
</head>
<body>
<h2>Sản Phẩm Bán Chạy Nhất</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Giảm Giá</th>
        <th>Tồn Kho</th>
    </tr>
    <c:forEach var="product" items="${bestSellingProducts}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
            <td>${product.inventory}</td>
        </tr>
    </c:forEach>
</table>
<a href="home?action=list">Quay lại danh sách sản phẩm</a>
</body>
</html>
