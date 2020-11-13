<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/11/2020
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div class="container-fluid">
    <h1 class="text-center mt-4 mb-5">List Service</h1>
    <div class="row">
        <div class="col-4">
        <a href="services?action=create" class="btn btn-success">Create new Service</a>
        </div>
        <div class="col-8 form-group">
        <form class="row" action="/services" method="get">
            <button style="margin-left: 350px" class="btn btn-primary col-2" name="action" value="search">Search</button>
            <input type="text" name="name" class="form-control col-5">
        </form>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Area</th>
            <th>Cost</th>
            <th>Rent type</th>
            <th>Max people</th>
            <th>Standard room</th>
            <th>Description</th>
            <th>Number of floor</th>
            <th>Pool area</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${serviceList}" var="service">
        <tr>
            <td>${service.id}</td>
            <td>${service.name}</td>
            <td>${service.serviceType}</td>
            <td>${service.area}</td>
            <td>${service.cost}</td>
            <td>${service.rentType}</td>
            <td>${service.serviceMaxPeople}</td>
            <td>${service.standardRoom}</td>
            <td>${service.description}</td>
            <td>${service.numberOfFloor}</td>
            <td>${service.poolArea}</td>
            <td><a href="#" class="btn btn-primary">Update</a></td>
            <td> <a href="#" class="btn btn-danger">Delete</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
