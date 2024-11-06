<!-- edit.jsp -->
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<h1>Chỉnh sửa sản phẩm</h1>
<form action="${pageContext.request.contextPath}/home" method="POST">
    <%--@declare id="category"--%><%--@declare id="price"--%><%--@declare id="unit"--%><%--@declare id="name"--%><input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${product.id}">

    <label for="name">Tên sản phẩm: </label>
    <input type="text" name="name" value="${product.name}" required><br>

    <label for="unit">Đơn vị: </label>
    <input type="text" name="unit" value="${product.unit}" required><br>

    <label for="price">Giá: </label>
    <input type="number" name="price" value="${product.price}" required><br>

    <label for="category">Loại sản phẩm: </label>
    <input type="text" name="category" value="${product.category}" required><br>

    <input type="submit" value="Cập nhật sản phẩm">
</form>
</body>
</html>
