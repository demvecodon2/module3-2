<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Sản Phẩm</title>
</head>
<body>
<h2>Danh Sách Sản Phẩm</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Giảm Giá</th>
        <th>Tồn Kho</th>
        <th>Thao Tác</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
            <td>${product.inventory}</td>
            <td>
                <a href="home?action=view&id=${product.id}">Xem</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="home?action=add">Thêm Sản Phẩm Mới</a>
</body>
</html>

