<!-- list.jsp -->
<html>
<head>
    <title>Danh sách Sản phẩm</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<form action="${pageContext.request.contextPath}/home" method="GET">
    <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm">
    <input type="submit" value="Tìm kiếm">
    <input type="hidden" name="action" value="search">
</form>
<table border="1">
    <thead>
    <tr>
        <th>Product Code</th>
        <th>Name</th>
        <th>Unit</th>
        <th>Price</th>
        <th>Category</th>
        <th>Created At</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productsList}">
        <tr>
            <td>${product.productCode}</td>
            <td>${product.name}</td>
            <td>${product.unit}</td>
            <td>${product.price}</td>
            <td>${product.category}</td>
            <td>${product.createdAt}</td>
            <td>
                <a href="${pageContext.request.contextPath}/home?action=edit&id=${product.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/home?action=delete&id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h2>Thêm Sản phẩm</h2>
<form action="${pageContext.request.contextPath}/home" method="POST">
    <%--@declare id="productcode"--%><%--@declare id="name"--%><%--@declare id="unit"--%><%--@declare id="price"--%><%--@declare id="category"--%><input type="hidden" name="action" value="add">
    <label for="productCode">Mã sản phẩm: </label>
    <input type="text" name="productCode" required><br>

    <label for="name">Tên sản phẩm: </label>
    <input type="text" name="name" required><br>

    <label for="unit">Đơn vị: </label>
    <input type="text" name="unit" required><br>

    <label for="price">Giá: </label>
    <input type="number" name="price" required><br>

    <label for="category">Loại sản phẩm: </label>
    <input type="text" name="category" required><br>

    <input type="submit" value="Thêm sản phẩm">
</form>
</body>
</html>
