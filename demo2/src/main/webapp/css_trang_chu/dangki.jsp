<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/22/2024
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Portfolio</title>
    <link rel="stylesheet" type="text/css" href="css_pokemon.css">

</head>
<body>
<ul class="horizontal-list fixed">
    <li class="dropdown">
        <button class="dropbtn" onclick="toggleDropdown()">☰ Menu</button>
        <div class="dropdown-content" id="dropdownMenu">
            <a href="http://localhost:8080/css_trang_chu/login.jsp">Đăng nhập</a>
            <a href="http://localhost:8080/css_trang_chu/list.jsp">Tìm kiếm</a>
            <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=ilge8f97qsuaqvlc0rg8m42p27&_ij_reload=RELOAD_ON_SAVE">Trang chủ</a>
            <a href="#">Cộng đồng</a>
            <a href="#">Đăng xuất</a>
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
        Don't have an account yet? <a href="http://localhost:8080/dangki.jsp">Đăng ký</a>
    </li>
</ul>

<div class="container">
    <div class="header">
        <h1>Danh Sách Portfolio</h1>
        <h2>Danh Sách Tìm Kiếm</h2>
    </div>
    <ul class="text-list">
        <li><a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=ilge8f97qsuaqvlc0rg8m42p27&_ij_reload=RELOAD_ON_SAVE">trang chủ </a></li>
        <li><a href="https://pokeheroes.com/">Event</a></li>
        <li><a href="https://pokeheroes.com/">Store</a></li>
        <li><a href="https://pokeheroes.com/">Từ điển pokemon</a></li>
        <li><a href="https://pokeheroes.com/login">Tải game</a></li>
        <li><a href="https://pokeheroes.com/registration">Mua Bán</a></li>
        <li><a href="https://pokeheroes.com/forum">Cộng Đồng </a></li>
    </ul>

    <div class="login-container">
        <h2>Đăng Ký Tài Khoản</h2>
        <form class="registration-form" role="form" action="yourRegistrationEndpoint" method="post">
            <div class="form-group">
                <label for="username">Tên Đăng Ký</label>
                <input type="text" class="form-control" id="username" placeholder="Nhập tên đăng ký" required>
            </div>
            <div class="form-group">
                <label for="password">Mật Khẩu</label>
                <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Nhập Lại Mật Khẩu</label>
                <input type="password" class="form-control" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
            </div>
            <div class="form-group">
                <label for="email">Nhập Email</label>
                <input type="email" class="form-control" id="email" placeholder="Nhập email" required>
            </div>
            <div class="form-group">
                <label for="birthday">Nhập Ngày Tháng Năm Sinh</label>
                <input type="date" class="form-control" id="birthday" required>
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                    <label class="form-check-label" for="agreeTerms">Tôi đồng ý với điều khoản và điều kiện</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Đăng Ký</button>
            </div>
        </form>
        <div id="message" class="mt-3"></div>
    </div>

</div>
</body>
</html>

