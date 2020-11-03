<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/2/2020
  Time: 6:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<form method="post" action="display-discount">
    <div class="container ml-0">
        <div class="form-group row">
            <label class="col-2 col-form-label">Product Description</label>
            <input class="form-control col-10" type="text" placeholder="Product Description" name="description">
        </div>
        <div class="form-group row">
            <label class="col-2 col-form-label">List Price</label>
            <input class="form-control col-10" type="text" placeholder="List Price" name="price">
        </div>
        <div class="form-group row">
            <label class="col-2 col-form-label">Discount Percent</label>
            <input class="form-control col-10" type="text" placeholder="Discount Percent" name="percent">
        </div>
        <input type="submit" value="Enter" class="btn btn-primary">
    </div>
</form>
</body>
</html>
