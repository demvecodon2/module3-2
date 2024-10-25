<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/22/2024
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css_pokemon.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<ul class="horizontal-list fixed">
    <div class="left-menu">
        <li class="dropdown">
            <button class="dropbtn" onclick="toggleDropdown()">☰ Menu</button>
            <div class="dropdown-content" id="dropdownMenu">
                <a href="http://localhost:8080/login.jsp">Đăng nhập</a>
                <a href="http://localhost:8080/list.jsp">Tìm kiếm</a>
                <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=ilge8f97qsuaqvlc0rg8m42p27&_ij_reload=RELOAD_ON_SAVE">Trang chủ</a>
                <a href="https://pokeheroes.com/">Cộng đồng</a>
                <a href="/webapp/WEB-INF/login.jsp">Đăng xuất</a>
            </div>
        </li>
    </div>
    <div class="image-container">
        <li>
            <img src="https://st.gamevui.vn/images/image/2016/8/11/pokemon-go-600.jpg" alt="Pokemon Go"
                 class="circular-image">
        </li>
        <li>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT95vObKKGp-doDd3q3PPrUHHwyBO9Mdck4JQ&s"
                 alt="Image 2" class="circular-image">
        </li>
    </div>
    <li class="account-info">
        Don't have an account yet? <a href="http://localhost:8080/dangki.jsp">Đăng ký</a>
    </li>
</ul>
<div class="container">
    <div class="header text-center mb-4">
        <h1>Danh Sách Portfolio</h1>
        <h2>Danh Sách Tìm Kiếm</h2>
    </div>
    <ul class="text-list">
        <li><a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=ilge8f97qsuaqvlc0rg8m42p27&_ij_reload=RELOAD_ON_SAVE">trang chủ</a></li>
        <li><a href="https://pokeheroes.com/">Event</a></li>
        <li><a href="https://pokeheroes.com/">Store</a></li>
        <li><a href="https://pokeheroes.com/">Từ điển pokemon</a></li>
        <li><a href="https://pokeheroes.com/login">Tải game</a></li>
        <li><a href="https://pokeheroes.com/registration">Mua Bán</a></li>
        <li><a href="https://pokeheroes.com/forum">Cộng Đồng</a></li>
    </ul>
    <input type="text" id="filterInput" placeholder="Filter items..." oninput="filterImages()">

    <div class="row">
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm" data-name="Fushigidane">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/cf47f9fac4ed3037ff2a8ea83204e32aff8fb5f3.png" class="card-img-top" alt="Mô tả hình 1">
                <div class="card-body">
                    <h5 class="card-title">Fushigidane</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm" data-name="Hitokage">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/d0ee81f16175c97770192fb691fdda8da1f4f349.png" class="card-img-top" alt="Mô tả hình 2">
                <div class="card-body">
                    <h5 class="card-title">Hitokage</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm" data-name="Zenigame">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/5794f0251b1180998d72d1f8568239620ff5279c.png" class="card-img-top" alt="Mô tả hình 3">
                <div class="card-body">
                    <h5 class="card-title">Zenigame</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm" data-name="Caterpie">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/68f0cec6bcba20a0c53db3d8cfce81bd319d2c82.png" class="card-img-top" alt="Mô tả hình 4">
                <div class="card-body">
                    <h5 class="card-title">Caterpie</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/5794f0251b1180998d72d1f8568239620ff5279c.png"
                     class="card-img-top" alt="Mô tả hình 3">
                <div class="card-body">
                    <h5 class="card-title">Zenigame</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/68f0cec6bcba20a0c53db3d8cfce81bd319d2c82.png"
                     class="card-img-top" alt="Mô tả hình 4">
                <div class="card-body">
                    <h5 class="card-title">Caterpie</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/5ae74d403ec682eaf13e066850afd4b0c20d85f7.png"
                     class="card-img-top" alt="Mô tả hình 5">
                <div class="card-body">
                    <h5 class="card-title">Beedle</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/6ac7e6e8ff9ac9fbcd55647f90973822caba43fd.png"
                     class="card-img-top" alt="Mô tả hình 5">
                <div class="card-body">
                    <h5 class="card-title">Beedle</h5>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card mb-4 shadow-sm">
                <img src="https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/0e7c6e616404c683f00701b591eeab56e465641a.png"
                     class="card-img-top" alt="Mô tả hình 6">
                <div class="card-body">
                    <h5 class="card-title">Poppo</h5>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</div>
</body>
</html>
