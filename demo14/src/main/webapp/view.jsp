<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 11/1/2024
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <div class="mb-3">
                <strong>Image:</strong>
                <c:if test="${not empty book.image}">
                    <img src="${book.image}" alt="Book Image" class="img-fluid mt-2" style="max-height: 300px;"/>
                </c:if>
                <c:if test="${empty book.image}">
                    <p>No image available</p>
                </c:if>
            </div>
        </div>
    </div>


    <a href="${pageContext.request.contextPath}/book" class="btn btn-secondary mt-3">Back to List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
