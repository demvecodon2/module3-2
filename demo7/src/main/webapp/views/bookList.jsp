<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/28/2024
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Book List</h1>

    <form action="${pageContext.request.contextPath}/book" method="post" class="form-inline mb-4">
        <input type="text" name="title" class="form-control mr-2" placeholder="Search by title" />
        <input type="hidden" name="action" value="search" />
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Page Size</th>
            <th>Category</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.pageSize}</td>
                <td>${book.category}</td>
                <td>
                    <c:if test="${not empty book.image}">
                        <img src="${book.image}" alt="Book Image" class="img-fluid" style="max-height: 100px;" />
                    </c:if>
                    <c:if test="${empty book.image}">
                        <p>No image available</p>
                    </c:if>
                </td>


                <td>
                    <a href="${pageContext.request.contextPath}/book?action=view&id=${book.id}" class="btn btn-info btn-sm">View</a>
                    <a href="${pageContext.request.contextPath}/book?action=edit&id=${book.id}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="${pageContext.request.contextPath}/book?action=delete&id=${book.id}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/book?action=create" class="btn btn-success">Create New Book</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
