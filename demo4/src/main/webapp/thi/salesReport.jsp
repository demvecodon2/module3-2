<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo Doanh Thu</title>
    <!-- Liên kết đến Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Báo Cáo Doanh Thu</h2>
    <div class="alert alert-info text-center" role="alert">
        Tổng Doanh Thu: <strong>${totalSales} VNĐ</strong>
    </div>
    <div class="text-center">
        <a class="btn btn-primary" href="home?action=list">Quay lại danh sách sản phẩm</a>
    </div>
</div>

<!-- Liên kết đến Bootstrap JS (tùy chọn) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
