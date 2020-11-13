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
    <title>Contract</title>
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
    <h1 class="text-center">Create Contract</h1>
    <form action="/contracts" method="post">
        <div class="form-group row">
            <label class="col-2">ID</label>
            <input class="form-control col-8" type="text" name="id" value="${id}">
        </div>
        <div class="form-group row">
            <label class="col-2">Start Date</label>
            <input class="form-control col-8" type="date" name="startDate" value="${startDate}">
        </div>
        <div class="form-group row">
            <label class="col-2">End Date</label>
            <input class="form-control col-8" type="date" name="endDate" value="${endDate}">
        </div>
        <div class="form-group row">
            <label class="col-2">Deposit</label>
            <input class="form-control col-8" type="text" name="deposit" value="${deposit}">
        </div>
        <div class="form-group row">
            <label class="col-2">Total Money</label>
            <input class="form-control col-8" type="text" name="totalMoney" value="${totalMoney}">
        </div>
        <div class="form-group row">
            <label class="col-2">Customer</label>
            <select class="col-8 form-control" name="customer">
                <c:forEach items="${customerList}" var="customer">
                    <option value="${customer.id.substring(3)}">${customer.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-2">Employee</label>
            <select class="col-8 form-control" name="employee">
                <c:forEach items="${employeeList}" var="employee">
                    <option value="${employee.id.substring(3)}">${employee.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-2">Service</label>
            <select class="col-8 form-control" name="service">
                <c:forEach items="${serviceList}" var="service">
                    <option value="${service.id.substring(3)}">${service.name}</option>
                </c:forEach>
            </select>
        </div>


        <div class="float-right" style="margin-right: 174px">
            <button class="btn btn-success" name="action" value="create">Create</button>
            <a class="btn btn-danger" href="contracts">Back</a>
        </div>
<%--        <input type="checkbox" name="box" value="karaoke">--%>
<%--        <input type="checkbox" name="box" value="car">--%>
<%--        <input type="checkbox" name="box" value="food">--%>
    </form>
    <p style="color: red; margin-left: 16%"><c:if test="${message != null}">${message}</c:if></p>
</div>

</body>
</html>
