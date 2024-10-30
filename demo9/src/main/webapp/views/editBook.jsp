<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/29/2024
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Book</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Edit Book</h1>

    <form action="${pageContext.request.contextPath}/book" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="${book.id}"/>

        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" value="${book.title}" required/>
        </div>

        <div class="form-group">
            <label for="pageSize">Page Size:</label>
            <input type="number" class="form-control" id="pageSize" name="pageSize" value="${book.pageSize}" required/>
        </div>

        <div class="form-group">
            <label for="author">Author:</label>
            <input type="text" class="form-control" id="author" name="author" value="${book.author}" required/>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <input type="text" class="form-control" id="category" name="category" value="${book.category}" required/>
        </div>

        <div class="form-group">
            <label for="image">Image URL:</label>
            <input type="text" class="form-control" id="image" name="image" value="${book.image}" required/>
        </div>

        <c:if test="${not empty book.image}">
            <div class="mt-3">
                <h5>Current Book Image:</h5>
                <img src="${book.image}" alt="Book Image" class="img-fluid" style="max-height: 200px;"/>
            </div>
        </c:if>

        <button type="submit" class="btn btn-primary">Update Book</button>
    </form>

    <a href="${pageContext.request.contextPath}/book" class="btn btn-secondary mt-3">Back to List</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>