<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/8/2020
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>

    <style>
        /*body {*/
        /*    font-size: 14px;*/
        /*}*/

        .navbar {
            background-color: #dcdeff;
            padding: 0;
            margin: 0;
        }

        .navbar h3 {
            color: #3e3e3e;
            font-size: 350%;
        }

        .navbar a {
            margin-left: 10px;
            color: #3e3e3e !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light">
    <a class="navbar-brand" href="/home">
        <img src="./image/logo.png" height="80" class="d-inline-block align-top" alt="" loading="lazy">
    </a>
    <c:if test="${ username == '' || username == null }">
        <a href="login/login.jsp" class="btn btn-outline-primary mr-5" style="color: black">Đăng Nhập</a>
    </c:if>

    <c:if test="${username != '' && username != null}">
        <a href="#"><img src="./image/avatar.jpg" height="70px" class="mr-5"></a>
    </c:if>

</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light"
     style="font-size: 20px; padding-top: 5px; padding-bottom: 5px">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-link" href="/home">Home</a>
            <a class="nav-link" href="/employees">Employee</a>
            <a class="nav-link" href="/customers">Customer</a>
            <a class="nav-link" href="/services">Service</a>
            <a class="nav-link" href="/contracts">Contract</a>
            <a class="nav-link" href="/contract-details">Contract Detail</a>
        </div>
        <form class="form-inline my-lg-0 ml-auto">
            <button class="btn btn-outline-success my-2 my-sm-0 col-3" type="submit">Search</button>
            <input class="form-control mr-sm-2 col-8 ml-2" type="search" placeholder="Search" aria-label="Search">
        </form>

    </div>
</nav>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./image/img1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./image/img2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./image/img6.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./image/img7.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="footer">

</div>
</body>
</html>
