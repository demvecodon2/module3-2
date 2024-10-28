<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/28/2024
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.KhachHang" %>
<%
    List<KhachHang> topCustomers = (List<KhachHang>) request.getAttribute("topCustomers");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Khách Hàng Mua Nhiều Nhất</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Khách Hàng Mua Nhiều Nhất</h1>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID Khách Hàng</th>
            <th>Tên Khách Hàng</th>
            <th>Số Lần Mua Hàng</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (topCustomers != null && !topCustomers.isEmpty()) {
                for (KhachHang kh : topCustomers) {
        %>
        <tr>
            <td><%= kh.getId() %></td>
            <td><%= kh.getTen() %></td>
            <td><%= kh.getSoLanMua() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="text-center">Không có khách hàng nào được tìm thấy.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="<%= request.getContextPath() %>/khach?action=view" class="btn btn-primary">Trở về danh sách khách hàng</a>
</div>
</body>
</html>
