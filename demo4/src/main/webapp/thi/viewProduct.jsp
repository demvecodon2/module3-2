<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
</head>
<body>
<h2>Chi Tiết Sản Phẩm</h2>
<% Product product = (Product) request.getAttribute("product"); %>
<p>ID: ${product.id}</p>
<p>Tên: ${product.name}</p>
<p>Giá: ${product.price}</p>
<p>Giảm Giá: ${product.discount}</p>
<p>Tồn Kho: ${product.inventory}</p>
<a href="home?action=list">Quay lại danh sách sản phẩm</a>
</body>
</html>
