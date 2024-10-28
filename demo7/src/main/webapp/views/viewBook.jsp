<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/28/2024
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Book</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h1>Book Details</h1>

  <div class="card">
    <div class="card-body">
      <p><strong>ID:</strong> ${book.id}</p>
      <p><strong>Title:</strong> ${book.title}</p>
      <p><strong>Author:</strong> ${book.author}</p>
      <p><strong>Page Size:</strong> ${book.pageSize}</p>
      <p><strong>Category:</strong> ${book.category}</p>
    </div>
  </div>

  <a href="${pageContext.request.contextPath}/book" class="btn btn-secondary mt-3">Back to List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
