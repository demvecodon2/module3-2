<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/24/2024
  Time: 8:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Portfolio</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("https://png.pngtree.com/background/20211217/original/pngtree-realistic-water-bubbles-for-mobile-phone-background-picture-image_1597891.jpg");
            background-size: cover;
            color: #444;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-image: url("https://staticpokeheroes.com/css/header_img/4.png");
            text-align: center;
            border-radius: 10px;
            padding: 87px;
            color: white;
            margin: 17px 0;
        }

        h1 {
            margin: 0;
            font-size: 2.5em;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
        }

        h2 {
            margin: 10px 0 0;
            font-size: 1.5em;
            font-weight: normal;
            color: #FF6F61;
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #FF6F61;
            border-radius: 5px;
            margin: 20px auto;
            width: 100%;
            max-width: 300px;
            display: block;
        }

        .dropdown {
            position: relative;
            display: inline-block;
            margin-left: 20px;
        }

        .dropbtn {
            background-color: #FF8C00;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .dropbtn:hover {
            background-color: #FF6F61;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgba(255, 255, 255, 0.1);
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .horizontal-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .left-menu,
        .image-container {
            display: flex;
            align-items: center;
        }

        .image-container {
            margin-left: auto;
        }

        .circular-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .account-info {
            margin-left: 20px;
            font-size: 16px;
            color: #444;
        }

        .account-info a {
            color: #FF6F61;
            text-decoration: none;
            margin-left: 10px;
            transition: color 0.3s;
        }

        .account-info a:hover {
            color: black;
        }

        .text-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            list-style-type: none;
            padding: 0;
        }

        .text-list li {
            flex: 1 0 150px;
            margin: 10px;
            padding: 10px;
            background-color: rgba(155, 244, 1, 0.8);
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
        }

        .text-list li:hover {
            background-color: rgba(74, 144, 226, 1);
            transform: translateY(-5px);
        }

        .image-list li {
            display: inline-block;
            margin: 10px;
            width: calc(25% - 20px);
            box-sizing: border-box;
        }

        .image-list img {
            width: 160px;
            height: 200px;
            border-radius: 10px;
            object-fit: contain;
        }

        .fixed {
            position: fixed;
            top: 0;
            left: 50px;
            background: rgba(255, 255, 255, 0.8);
            padding: 0;
            border-radius: 70px;
            box-shadow: 0 40px 10px rgba(31, 231, 215, 0.1);
            z-index: 10;
            width: calc(100% - 100px);
        }



        .post-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        .post {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 10px;
            flex: 1 0 calc(25% - 20px);
            box-sizing: border-box;
            transition: transform 0.3s;
        }

        .post:hover {
            transform: translateY(-5px);
        }

        .post h3 {
            margin: 0 0 10px;
            font-size: 1.5em;
        }

        .post p {
            margin: 0;
        }

        .post-image {
            width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 15px;
        }
    </style>

</head>
<body>
<ul class="horizontal-list fixed">
    <div class="left-menu">
        <li><a href="http://localhost:8080/css_trang_chu/login.jsp">Login</a></li>
        <li class="dropdown">
            <button class="dropbtn">☰ Menu</button>
            <div class="dropdown-content">
                <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=o2m0v8o2cgtrbf2jb630kg86g6&_ij_reload=RELOAD_ON_SAVE">Đăng
                    nhập</a>
                <a href="http://localhost:8080/css_trang_chu/list.jsp">Tìm kiếm</a>
                <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=o2m0v8o2cgtrbf2jb630kg86g6&_ij_reload=RELOAD_ON_SAVE">Trang
                    chủ</a>
                <a href="https://pokeheroes.com/">Cộng đồng</a>
                <a href="/css_trang_chu/login.jsp">Đăng xuất</a>
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
        Don't have an account yet? <a href="http://localhost:8080/css_trang_chu/dangki.jsp">Đăng ký</a>
    </li>
</ul>
<div class="container">
    <div class="header">
    </div>
    <ul class="text-list">
        <li>
            <a href="http://localhost:63342/demo2/demo2/src/main/java/ban_test/scratch_1.html?_ijt=o2m0v8o2cgtrbf2jb630kg86g6&_ij_reload=RELOAD_ON_SAVE">Trang
                Chủ</a></li>
        <li><a href="https://pokeheroes.com/">Sự Kiện</a></li>
        <li><a href="https://pokeheroes.com/">Cửa Hàng</a></li>
        <li><a href="https://pokeheroes.com/">Từ Điển Pokemon</a></li>
        <li><a href="https://pokeheroes.com/login">Tải Game</a></li>
        <li><a href="https://pokeheroes.com/registration">Mua Bán</a></li>
        <li><a href="https://pokeheroes.com/forum">Cộng Đồng</a></li>
    </ul>
    <div class="post-container">
        <div class="post-container">
            <div class="post">
                <img src="https://staticpokeheroes.com/img/artworks/eggs/129s.png" alt="Hình ảnh bài viết 1"
                     class="post-image">
                <h3>Event trứng </h3>
                <p>
                    Trainers, dark storm clouds have been swirling above Emera Town's coastline, bringing flashes of
                    lightning and a mysterious sighting. Fishermen claim they've seen golden scales shimmering beneath
                    the waves right after a bolt struck the sea!

                    Rumor has it that a certain Pokémon, normally underestimated, has been imbued with shocking new
                    power. Locals say it’s an ill omen, but seasoned trainers know better—this is an incredible
                    opportunity!

                    A new Event Pokémon is now available until October 13th, 4PM. This Event Pokémon was created by our
                    member Koishi in our recent spriting contest. Congratulations!</p>
            </div>
            <div class="post">
                <img src="https://staticpokeheroes.com/img/news/turo-cropped.png" alt="Hình ảnh bài viết 2"
                     class="post-image">
                <h3>cập nhật nhân vật</h3>
                <p>Professor Sada and Professor Turo are back with a new Paldean Research Task: For a limited time, you
                    can get the past Pokémon Brute Bonnet and/or the future Pokémon Iron Hands by helping them with
                    their studies. As always, they have a great interest in Pokemon eggs obtained from Rowan's Lab. They
                    claim there's something awfully... paradox about them.
                    These quests are available to trainers of level 35 or higher who have completed either the Koraidon
                    Quest or Miraidon Quest (or both). Both quests can be repeated as often as you want until November
                    30th, and both Pokémon come with a 10% shiny chance. Good luck!</p>
            </div>
            <div class="post">
                <img src="https://staticpokeheroes.com/img/news/chimchar.png" alt="Hình ảnh bài viết 3"
                     class="post-image">
                <h3>cập nhật pokemon</h3>
                <p>Emera Town is in chaos, and it's all thanks to the latest outbreak of Monkey Pokémon! As part of the
                    ongoing Zarude event, things are about to get even wilder with the arrival of Monkey Mondeys. Every
                    Monday during the event, Zarude's chance of appearing is doubled, making it the perfect time for
                    Trainers to go hunting for this elusive Mythical Pokémon.

                    But that’s not all. On Monkey Mondeys, every Monkey Pokémon has a strongly increased chance of
                    hatching as a shiny from eggs. Trainers will have the opportunity to hatch shiny versions of Mankey,
                    Aipom, Grookey, Chimchar, Panpour, Pansear, Pansage, Passimian, Oranguru, and even Slakoth.

                    With the trees in Emera Town practically bursting with monkeys and Trainers scrambling to hatch as
                    many eggs as possible, Monkey Mondeys are sure to bring plenty of excitement. Be sure to collect
                    your Zarude eggs and get ready for the shinies to roll in!</p>
            </div>
            <div class="post">
                <img src="https://staticpokeheroes.com/img/news/zarude.png" alt="Hình ảnh bài viết 4"
                     class="post-image">
                <h3>new pokemon</h3>
                <p>The first hints of autumn are starting to show—the air is crisp, and the trees are just beginning to
                    trade their green for vibrant shades of gold and orange. Though summer is behind us, it’s not quite
                    time to retreat indoors just yet! What’s that sound coming from outside? Could it be... a Monkey?

                    Yes, the long-awaited return is here: the mythical Pokémon Zarude has arrived in Emera Town for the
                    month of September! This elusive creature is eager to meet daring trainers and is known to offer
                    special gifts to those who manage to impress it. How do you catch its eye? Word has it that
                    interacting with a variety of Pokémon might just do the trick!</p>
            </div>
        </div>
        <div class="post">
            <img src="https://staticpokeheroes.com/img/news/zarude.png" alt="Hình ảnh bài viết 4"
                 class="post-image">
            <h3>new pokemon</h3>
            <p>The first hints of autumn are starting to show—the air is crisp, and the trees are just beginning to
                trade their green for vibrant shades of gold and orange. Though summer is behind us, it’s not quite
                time to retreat indoors just yet! What’s that sound coming from outside? Could it be... a Monkey?

                Yes, the long-awaited return is here: the mythical Pokémon Zarude has arrived in Emera Town for the
                month of September! This elusive creature is eager to meet daring trainers and is known to offer
                special gifts to those who manage to impress it. How do you catch its eye? Word has it that
                interacting with a variety of Pokémon might just do the trick!</p>
        </div>
    </div>


</div>

</div>
</body>
</html>

