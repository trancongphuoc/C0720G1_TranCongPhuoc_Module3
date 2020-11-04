<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/4/2020
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
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
        .row {
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<h1>Create new product</h1>
<form method="post">
    <div class="form-group col-8 mt-5">
        <div class="row">
            <label class="col-3 col-form-label">Enter name product</label>
            <input type="text" class="form-control col-5" name="name" placeholder="Name product">
        </div>
        <div class="row">
            <label class="col-3">Enter price product</label>
            <input type="number" class="form-control col-5" name="price" placeholder="Price product">
        </div>
        <div class="row">
            <label class="col-3">Description</label>
            <input type="text" class="form-control col-5" name="description" placeholder="Description">
        </div>
        <div class="row">
            <label class="col-3">Enter producer</label>
            <input type="text" class="form-control col-5" name="producer" placeholder="Producer">
        </div>
        <input type="submit" class="btn btn-primary" value="Create">
    </div>
</form>
</body>
</html>
