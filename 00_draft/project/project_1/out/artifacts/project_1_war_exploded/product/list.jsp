<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/7/2020
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>

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
<div class="container">
    <h1 class="text-center mt-5 mb-5">List Product</h1>
    <div class="row">
        <div class="col-4">
            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalCreate" onclick="onCreate(${currentPage})">Create new Product</a>
        </div>
        <div class="form-group col-8">
            <form class="row" action="/products" method="get">
                <button style="margin-left: 250px" type="submit" class="btn btn-primary col-2" name="action"
                        value="find">Search
                </button>
                <input type="text" class="form-control col-5" placeholder="Name" name="name">
            </form>
        </div>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Producer</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.id}</td>
                <td><a href="products?action=see&id=${product.id}">${product.name}</a></td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.producer}</td>
                <td><a href="#" class="btn btn-warning" data-toggle="modal" data-target="#modalUpdate"
                       onclick="onUpdate(${product.id},'${product.name}',${product.price},'${product.description}','${product.producer}')">Update</a>
                </td>
                <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete"
                       onclick="onDelete(${product.id})">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:if test="${currentPage != 1}">
                <li class="page-item"><a class="page-link" href="products?page=${currentPage-1}">Previous</a></li>
            </c:if>
<%--            <c:forEach begin="1" end="${noOfPage}" var="i">--%>
<%--                <li class="page-item"><a id="${i}" class="page-link active" href="products?page=${i}">${i}</a></li>--%>
<%--            </c:forEach>--%>
            <c:if test="${currentPage == 1}">
                <li class="page-item active"><a id="${i}" class="page-link active" href="products?page=${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage + 1}">${currentPage + 1}</a></li>
                <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage + 2}">${currentPage + 2}</a></li>
            </c:if>

            <c:if test="${currentPage > 1 && currentPage < noOfPage}">
            <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage - 1}">${currentPage - 1}</a></li>
            <li class="page-item active"><a id="${i}" class="page-link active" href="products?page=${currentPage}">${currentPage}</a></li>
            <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage + 1}">${currentPage +1}</a></li>
            </c:if>

            <c:if test="${currentPage == noOfPage}">
                <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage - 2}">${currentPage - 2}</a></li>
                <li class="page-item"><a id="${i}" class="page-link" href="products?page=${currentPage - 1}">${currentPage - 1}</a></li>
                <li class="page-item active"><a id="${i}" class="page-link active" href="products?page=${currentPage}">${currentPage}</a></li>
            </c:if>

            <c:if test="${currentPage != noOfPage}">
                <li class="page-item"><a class="page-link" href="products?page=${currentPage + 1}">Next</a></li>
            </c:if>

        </ul>
    </nav>

</div>


<!-- Modal Create -->
<div class="modal fade" id="ModalCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Create new Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/products" method="post">
                    <input type="hidden" id="createPage" name="page">
                    <div class="form-group row">
                        <label class="col-form-label col-3">Name</label>
                        <input type="text" class="form-control col-9" name="name" placeholder="Name">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Price</label>
                        <input type="number" class="form-control col-9" name="price" placeholder="Price">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Description</label>
                        <input type="text" class="form-control col-9" name="description" placeholder="Description">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Producer</label>
                        <input type="text" class="form-control col-9" name="producer" placeholder="Producer">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-success" name="action" value="create">Create</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal Update -->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/products" method="post">
                    <input type="hidden" id="updateId" name="id">
                    <div class="form-group row">
                        <label class="col-form-label col-3">Name</label>
                        <input id="updateName" value="" type="text" class="form-control col-9" name="name"
                               placeholder="Name">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Price</label>
                        <input id="updatePrice" type="number" class="form-control col-9" name="price"
                               placeholder="Price">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Description</label>
                        <input id="updateDescription" type="text" class="form-control col-9" name="description"
                               placeholder="Description">
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-3">Producer</label>
                        <input id="updateProducer" type="text" class="form-control col-9" name="producer"
                               placeholder="Producer">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-success" name="action" value="update">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Delete -->
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
                <p>Are you sure?</p>
                <form method="post" action="/products">
                    <input type="hidden" name="id" id="deleteId">
                    <div style="float: right">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="delete">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function onCreate(currentPage) {
        document.getElementById("createPage").value = currentPage;
    }
    function onUpdate(id, name, price, description, producer) {
        console.log(id, name, price, description, producer);
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updatePrice").value = price;
        document.getElementById("updateDescription").value = description;
        document.getElementById("updateProducer").value = producer;
    }

    function onDelete(id) {
        document.getElementById("deleteId").value = id;
    }

    $(function () {
        window.pagObj = $('#pagination').twbsPagination()
    })
</script>
</html>
