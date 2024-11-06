<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sản Phẩm Đã Mua</title>
</head>
<body>
<h2>Sản Phẩm Đã Mua</h2>

<form action="home?action=purchasedProducts" method="get">
    <label for="startDate">Ngày Bắt Đầu:</label>
    <input type="date" id="startDate" name="startDate" required>
    <br>
    <input type="submit" value="Xem Sản Phẩm Đã Mua">
</form>


<c:if test="${purchasedProducts != null}">
    <h3>Tổng Số Sản Phẩm Đã Mua: ${purchasedProducts}</h3>
</c:if>

<c:if test="${purchasedProducts == null}">
    <p>Không có sản phẩm nào được mua trong khoảng thời gian này.</p>
</c:if>

<a href="home?action=list">Quay lại danh sách sản phẩm</a>
</body>
</html>
