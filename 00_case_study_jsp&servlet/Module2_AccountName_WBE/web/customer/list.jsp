<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/10/2020
  Time: 10:15 AM
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
    <h1 class="text-center mt-4 mb-5">List Customer</h1>
    <div class="row">
        <div class="col-4">
            <a href="customers?action=create" class="btn btn-success">Create new Product</a>
        </div>
        <div class="form-group col-8">
            <form class="row" action="/customers" method="get">
                <button style="margin-left: 350px" type="submit" class="btn btn-primary col-2" name="action"
                        value="find">Search
                </button>
                <input type="text" class="form-control col-5" placeholder="Name" name="name">
            </form>
        </div>
    </div>


    <table class="table table-striped">
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
                <td><a href="#" class="btn btn-warning" data-toggle="modal" data-target="#modalUpdate"
                       onclick="onUpdate('${customer.id}','${customer.name}','${customer.birthday}','${customer.gender}','${customer.idCard}',
                               '${customer.phone}','${customer.email}','${customer.address}',
                               '${customer.customerType}')">Update</a>
                </td>
                <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete"
                       onclick="onDelete('${customer.id}')">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination">
        <c:forEach begin="1" end="${totalPage}" var="i">
            <li class="page-item"><a id="${i}" class="page-link active" href="customers?page=${i}">${i}</a></li>
        </c:forEach>
    </ul>
</div>


<!-- Modal Update -->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal update</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/customers" method="post">
                    <input type="hidden" name="id" id="updateId">
                    <div class="form-group row">
                        <label class="col-4">Name </label>
                        <input class="form-control col-8" type="text" name="name" id="updateName">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Birthday </label>
                        <input class="form-control col-8" type="date" name="birthday" id="updateBirthday">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Customer Type</label>
                        <select class="col-8 form-control" name="gender" id="updateGender">
                            <option value="0">Nam</option>
                            <option value="1">Nữ</option>
                        </select>
                    </div>
                    <div class="form-group row">
                        <label class="col-4">ID Card </label>
                        <input class="form-control col-8" type="text" name="idCard" id="updateIdCard">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Phone Number </label>
                        <input class="form-control col-8" type="text" name="phone" id="updatePhone">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Email </label>
                        <input class="form-control col-8" type="text" name="email" id="updateEmail">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Address </label>
                        <input class="form-control col-8" type="text" name="address" id="updateAddress">
                    </div>
                    <div class="form-group row">
                        <label class="col-4">Customer Type</label>
                        <select class="col-8 form-control" name="customerType" id="updateCustomerType">
                            <c:forEach items="${customerTypeList}" var="customerType">
                                <option value="${customerType.id}" >${customerType.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="update">Save</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>


<!-- Modal DELETE -->
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h2>Are you sure ?</h2>
                <form action="/customers" method="post">
                    <input type="hidden" name="id" id="deleteId">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Delete</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
<script>
    function onUpdate(id, name, birthday, gender, idCard, phone, email, address, customerType) {
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updateBirthday").value = birthday;
        if (gender === "Nam") {
            gender = 0;
        } else {
            gender = 1;
        }
        document.getElementById("updateGender").value = gender;
        document.getElementById("updateIdCard").value = idCard;
        document.getElementById("updatePhone").value = phone;
        document.getElementById("updateEmail").value = email;
        document.getElementById("updateAddress").value = address;
        switch (customerType) {
            case "Member":
                customerType = 1;
                break;
            case "Sliver":
                customerType = 2;
                break;
            case "Gold":
                customerType = 3;
                break;
            case "Platinum":
                customerType = 4;
                break;
            case "Diamond":
                customerType = 5;
                break;
        }

        document.getElementById("updateCustomerType").value = customerType;
    }

    function onDelete(id) {
        document.getElementById("deleteId").value = id;
    }
</script>
</html>
