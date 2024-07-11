<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Post</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>

    <style>
        img {
            width: 200px;
            height: 120px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b> Products</b></h2>     
                        <form action="listproduct" method="post">
                            <div class="menu_box_2">
                                <input required name="txt" class="form_1" type="text" value="${txt}" placeholder="Search...">
                                <input type="submit" value="Ok">
                            </div>
                        </form>

                        <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
                        <a href="addproduct"><button type="button" class="btn btn-success">Add new Product</button>

                    </div>

                    <div class="col-sm-6">
                        <a href="#"   > </a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listP}" var="p">
                        <tr>
                            <td>${p.getId()}</td>
                            <td>${p.getName()}</td>
                            <td>
                                <img src="${p.getUrl_img()}">
                            </td>
                            <td>${p.getPrice()}</td>

                            <td>
                                <a href="detail?pid=${p.getId()}" class="edit" data-toggle="modal"><i class="material-icons"data-toggle="tooltip" title="detail">?</i></a>

                                <a href="editproduct?ID=${p.getId()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="javascript:void(0);" class="delete" data-toggle="modal" onclick="confirmDelete('${p.getId()}');"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Modal HTML -->

    <script src="js/manager.js" type="text/javascript"></script>

    <script>
        function confirmDelete(productID) {
            if (confirm("Are you sure you want to delete this product?")) {
                window.location.href = "deleteproduct?ID=" + productID;
            }
        }
    </script>
</body>
</html>
