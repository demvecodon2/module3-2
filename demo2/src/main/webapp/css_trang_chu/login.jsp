<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Portfolio</title>
    <link rel="stylesheet" type="text/css" href="/css_trang_chu/css_pokemon.css">
</head>
<body>
<ul class="horizontal-list fixed">
    <div class="left-menu">
        <li class="dropdown">
            <button class="dropbtn" onclick="toggleDropdown()">☰ Menu</button>
            <div class="dropdown-content" id="dropdownMenu">
                <a href="http://localhost:8080/css_trang_chu/login.jsp">Đăng nhập</a>
                <a href="http://localhost:8080/css_trang_chu/list.jsp">Tìm kiếm</a>
                <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html">Trang chủ</a>
                <a href="https://pokeheroes.com/">Cộng đồng</a>
                <a href="/webapp/WEB-INF/login.jsp">Đăng xuất</a>
            </div>
        </li>
    </div>

    <div class="image-container">
        <li>
            <img src="https://st.gamevui.vn/images/image/2016/8/11/pokemon-go-600.jpg" alt="Pokemon Go" class="circular-image">
        </li>
        <li>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT95vObKKGp-doDd3q3PPrUHHwyBO9Mdck4JQ&s" alt="Image 2" class="circular-image">
        </li>
    </div>

    <li class="account-info">
        Don't have an account yet? <a href="http://localhost:8080/css_trang_chu/dangki.jsp">Đăng ký</a>
    </li>
</ul>

<div class="container">
    <div class="header">
        <h1>Danh Sách Portfolio</h1>
        <h2>Danh Sách Tìm Kiếm</h2>
    </div>
    <ul class="text-list">
        <li><a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html">trang chủ</a></li>
        <li><a href="https://pokeheroes.com/">Event</a></li>
        <li><a href="https://pokeheroes.com/">Store</a></li>
        <li><a href="https://pokeheroes.com/">Từ điển pokemon</a></li>
        <li><a href="https://pokeheroes.com/login">Tải game</a></li>
        <li><a href="https://pokeheroes.com/registration">Mua Bán</a></li>
        <li><a href="https://pokeheroes.com/forum">Cộng Đồng</a></li>
    </ul>

    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form class="row" action="/loginsever" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <div class="form-group">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Xác nhận đăng nhập</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Đăng Nhập</button>
            </div>

            <div class="form-group">
                Bạn chưa có tài khoản? <a href="/css_trang_chu/dangki.jsp" class="link-primary">Đăng ký</a>
            </div>
        </form>

        <c:if test="${not empty error}">
            <p style="color:red">${error}</p>
        </c:if>
        <c:if test="${not empty message}">
            <p style="color:green">${message}</p>
        </c:if>
    </div>
</div>
</body>
</html>
