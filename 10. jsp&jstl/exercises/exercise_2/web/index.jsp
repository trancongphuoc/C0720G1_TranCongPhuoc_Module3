<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/3/2020
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
<form method="get" action="calculate">
    <div class="col-6 border">
        <div class="row form-group">
            <label class="col-3 col-form-label">First operand</label>
            <div class="col-9">
                <input class="form-control" type="number" name="number1" value="Enter number">
            </div>
        </div>
<%--        <div class="row">--%>
<%--            <label class="col-3 col-form-label">Operator</label>--%>
<%--            <select id="cars" class="btn btn-outline-info ml-3 mt-2 mb-2">--%>
<%--                <option value="addition">Addition</option>--%>
<%--                <option value="minus">Minus</option>--%>
<%--                <option value="multiple">Multiple</option>--%>
<%--                <option value="divine" selected>Divine</option>--%>
<%--            </select>--%>
<%--        </div>--%>
        <div class="row form-group">
            <label class="col-3 col-form-label">Second operand</label>
            <div class="col-9">
                <input class="form-control" type="number" name="number2" value="Enter number">
            </div>
        </div>

        <div class="row form-group">
            <div class="col-3"></div>
            <div class="col-2">
                <input type="submit" class="btn btn-outline-info form-control" value="+" name="operator">
            </div>
            <div  class="col-2">
                <input type="submit"  class="btn btn-outline-info form-control" value="-" name="operator">
            </div>
            <div  class="col-2">
                <input type="submit"  class="btn btn-outline-info form-control" value="x" name="operator">
            </div>
            <div  class="col-2">
                <input type="submit"  class="btn btn-outline-info form-control" value="/" name="operator">
            </div>
        </div>
    </div>
</form>
</body>
</html>
