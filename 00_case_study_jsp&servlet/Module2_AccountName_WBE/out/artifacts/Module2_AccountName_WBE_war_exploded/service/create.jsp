<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/11/2020
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        .navbar {
            background-color: #dcdeff;
            padding: 0;
            margin: 0;
        }

        .navbar h3 {
            color: #3e3e3e;
            font-size: 350%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light">
    <a class="navbar-brand" href="/home">
        <img src="./image/logo.png" height="80" class="d-inline-block align-top" alt="" loading="lazy">
    </a>
</nav>

<div class="container mt-4">
    <h1 class="text-center">Create customer</h1>
    <form action="/services" method="post">
        <div class="form-group row">
            <label class="col-2">ID </label>
            <input class="form-control col-8" type="text" name="id" value="SV-">
        </div>
        <div class="form-group row">
            <label class="col-2">Name </label>
            <input class="form-control col-8" type="text" name="name">
        </div>
        <div class="form-group row">
            <label class="col-2">Service type</label>
            <select class="col-8 form-control" name="serviceType">
                <option value="1">Villa</option>
                <option value="2">House</option>
                <option value="3">Room</option>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-2">Area </label>
            <input class="form-control col-8" type="text" name="area">
        </div>
        <div class="form-group row">
            <label class="col-2">Cost </label>
            <input class="form-control col-8" type="text" name="cost">
        </div>
        <div class="form-group row">
            <label class="col-2">Rent type</label>
            <select class="col-8 form-control" name="rentType">
                <option value="1">Giờ</option>
                <option value="2">Ngày</option>
                <option value="3">Tuần</option>
                <option value="4">Tháng</option>
                <option value="5">Năm</option>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-2">Max people </label>
            <input class="form-control col-8" type="text" name="maxPeople">
        </div>
        <div class="form-group row">
            <label class="col-2">Standard room </label>
            <input class="form-control col-8" type="text" name="standardRoom">
        </div>
        <div class="form-group row">
            <label class="col-2">Description </label>
            <input class="form-control col-8" type="text" name="description">
        </div>
        <div class="form-group row">
            <label class="col-2">Number of floor </label>
            <input class="form-control col-8" type="text" name="numberOfFloor">
        </div>
        <div class="form-group row">
            <label class="col-2">Pool area </label>
            <input class="form-control col-8" type="text" name="poolArea">
        </div>

        <div class="float-right" style="margin-right: 174px">
            <button class="btn btn-success" name="action" value="create">Create</button>
            <a class="btn btn-danger" href="/services">Back</a>
        </div>
    </form>
    <p style="color: red; margin-left: 16%" ><c:if test="${message != null}">${message}</c:if></p>
</div>

</body>
</html>
