<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lỗi</title>
</head>
<body>
<h1>Đã xảy ra lỗi</h1>
<p>${error}</p>
<a href="${pageContext.request.contextPath}/views/studentlist.jsp">Trở về danh sách học viên</a>
</body>
</html>
