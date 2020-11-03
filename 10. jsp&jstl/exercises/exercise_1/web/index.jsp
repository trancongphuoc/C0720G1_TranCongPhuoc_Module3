<%@ page import="java.util.List" %>
<%@ page import="models.Customer" %>
<%@ page import="controls.CreateCustomer" %><%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/3/2020
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <style>
    </style>
</head>
<body>
<%
    request.setAttribute("cus", CreateCustomer.getCustomerList());
%>

<table class="table table-dark">
    <thead>
    <tr>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Image avatar</th>
    </tr>
    </thead>
    <c:forEach items="${cus}" var="cusList">
    <tbody>
    <tr>
        <td><c:out value="${cusList.name}"/></td>
        <td><c:out value="${cusList.dateOfBirth}"/></td>
        <td><c:out value="${cusList.address}"/></td>
        <td><img src="<c:out value="${cusList.image}"/>" height="50px" alt=""></td>
    </tr>
    </tbody>
    </c:forEach>
</table>

</body>
</html>
