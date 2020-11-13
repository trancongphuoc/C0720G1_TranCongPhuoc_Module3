<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/11/2020
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
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

<table class="table table-striped" id="tableStudent" style="width:100%">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>ID Card</th>
        <th>Phone number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Gender</th>
        <th>Customer type</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>${customer.gender}</td>
            <td>${customer.customerType}</td>
            <td><a href="#" class="btn btn-warning"  data-toggle="modal" data-target="#modalUpdate"
                   onclick="onUpdate('${customer.id}','${customer.name}','${customer.birthday}','${customer.gender}','${customer.idCard}',
                           '${customer.phone}','${customer.email}','${customer.address}',
                           '${customer.customerType}')">Update</a>
            </td>
            <td><a href="#" class="btn btn-danger"  data-toggle="modal" data-target="#modalDelete"
                   onclick="onDelete('${customer.id}')">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a class="btn btn-success" href="/customers">Back</a>
</body>
</html>
