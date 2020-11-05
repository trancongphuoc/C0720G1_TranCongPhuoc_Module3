<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/4/2020
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Print List Product</title>


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

</head>
<body>
<h1>List Product</h1>

<div class="ml-5 mt-3 mr-5">
    <div class="row">
        <div class="ml-auto row form-group col-6">
            <form method="get" class="row" style="margin-left: 300px">
                <input type="submit" class="btn btn-info" value="Search" name="action">
                <input type="text" class="form-control col-8" name="name">
            </form>
        </div>
    </div>
    <table class="table table-striped mt-3">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Producer</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="productList">
            <tr>
                <td>${productList.getIdProduct()}</td>
                <td><a href="products?action=see&id=${productList.getIdProduct()}">${productList.getNameProduct()}</a>
                </td>
                <td>${productList.getPriceProduct()}</td>
                <td>${productList.getDescriptionProduct()}</td>
                <td>${productList.getProducerProduct()}</td>
                <td><a href="products?action=update&id=${productList.getIdProduct()}" class="btn btn-primary">Update</a>
                </td>
                <td><a href="products?action=delete&id=${productList.getIdProduct()}" class="btn btn-danger"
                       methods="post">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="products" class="btn btn-primary">Back to menu</a>
</div>
</body>
</html>
