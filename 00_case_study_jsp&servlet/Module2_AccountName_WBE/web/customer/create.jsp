<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/10/2020
  Time: 3:00 PM
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
    <form action="/customers" method="post">
        <small style="margin-left: 16%; font-size: 100%; color: red">
            <c:if test="${messageId != null}">${messageId}</c:if>
        </small>
        <div class="form-group row">
            <label class="col-2">ID </label>
            <input class="form-control col-8" type="text" name="id" value="KH-${id}">
        </div>
        <div class="form-group row">
            <label class="col-2">Name </label>
            <input class="form-control col-8" type="text" name="name" value="${name}">
        </div>
        <small style="margin-left: 16%; font-size: 100%; color: red"><c:if
                test="${messageBirthday != null}">${messageBirthday}</c:if></small>
        <div class="form-group row">
            <label class="col-2">Birthday </label>
            <input class="form-control col-8" type="date" name="birthday" value="${birthday}">
        </div>

        <div class="form-group row">
            <label class="col-2">Gender</label>
            <select class="col-8 form-control" name="gender">
                <option value="0">Nam</option>
                <option value="1">Nữ</option>
            </select>
        </div>
        <small style="margin-left: 16%; font-size: 100%; color: red"><c:if
                test="${messageIdCard != null}">${messageIdCard}</c:if></small>
        <div class="form-group row">
            <label class="col-2">ID Card </label>
            <input class="form-control col-8" type="text" name="idCard" value="${idCard}">
        </div>
        <small style="margin-left: 16%; font-size: 100%; color: red"><c:if
                test="${messagePhone != null}">${messagePhone}</c:if></small>
        <div class="form-group row">
            <label class="col-2">Phone Number </label>
            <input value="(84)+" class="form-control col-8" type="text" name="phone">
        </div>
        <small style="margin-left: 16%; font-size: 100%; color: red"><c:if
                test="${messageEmail != null}">${messageEmail}</c:if></small>
        <div class="form-group row">
            <label class="col-2">Email </label>
            <input class="form-control col-8" type="text" name="email" value="${email}">
        </div>

        <div class="form-group row">
            <label class="col-2">Address </label>
            <input class="form-control col-8" type="text" name="address" value="${address}">
        </div>
        <div class="form-group row">

            <label class="col-2">Customer Type</label>
            <select class="col-8 form-control" name="customerType">
                <c:forEach items="${customerTypeList}" var="customerType">
                    <option value="${customerType.id}">${customerType.name}</option>
                </c:forEach>
            </select>

        </div>
        <div class="float-right" style="margin-right: 174px">
            <button class="btn btn-success" name="action" value="create">Create</button>
            <a class="btn btn-danger" href="/customers">Back</a>
        </div>
    </form>
</div>
</body>

</html>
