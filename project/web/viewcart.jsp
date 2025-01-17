<%-- 
    Document   : viewCart
    Created on : 24-10-2023, 20:04:19
    Author     : PV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            .shopping-cart{
                padding-bottom: 50px;
                font-family: 'Montserrat', sans-serif;
            }

            .shopping-cart.dark{
                background-color: #f6f6f6;
            }

            .shopping-cart .content{
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
                background-color: white;
            }

            .shopping-cart .block-heading{
                padding-top: 50px;
                margin-bottom: 40px;
                text-align: center;
            }

            .shopping-cart .block-heading p{
                text-align: center;
                max-width: 420px;
                margin: auto;
                opacity:0.7;
            }

            .shopping-cart .dark .block-heading p{
                opacity:0.8;
            }

            .shopping-cart .block-heading h1,
            .shopping-cart .block-heading h2,
            .shopping-cart .block-heading h3 {
                margin-bottom:1.2rem;
                color: #3b99e0;
            }

            .shopping-cart .items{
                margin: auto;
            }

            .shopping-cart .items .product{
                margin-bottom: 20px;
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .shopping-cart .items .product .info{
                padding-top: 0px;
                text-align: center;
            }

            .shopping-cart .items .product .info .product-name{
                font-weight: 600;
            }

            .shopping-cart .items .product .info .product-name .product-info{
                font-size: 14px;
                margin-top: 15px;
            }

            .shopping-cart .items .product .info .product-name .product-info .value{
                font-weight: 400;
            }

            .shopping-cart .items .product .info .quantity .quantity-input{
                margin: auto;
                width: 80px;
            }

            .shopping-cart .items .product .info .price{
                margin-top: 15px;
                font-weight: bold;
                font-size: 22px;
            }

            .shopping-cart .summary{
                border-top: 2px solid #5ea4f3;
                background-color: #f7fbff;
                height: 100%;
                padding: 30px;
            }

            .shopping-cart .summary h3{
                text-align: center;
                font-size: 1.3em;
                font-weight: 600;
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .shopping-cart .summary .summary-item:not(:last-of-type){
                padding-bottom: 10px;
                padding-top: 10px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }

            .shopping-cart .summary .text{
                font-size: 1em;
                font-weight: 600;
            }

            .shopping-cart .summary .price{
                font-size: 1em;
                float: right;
            }

            .shopping-cart .summary button{
                margin-top: 20px;
            }

            @media (min-width: 768px) {
                .shopping-cart .items .product .info {
                    padding-top: 25px;
                    text-align: left;
                }

                .shopping-cart .items .product .info .price {
                    font-weight: bold;
                    font-size: 22px;
                    top: 17px;
                }

                .shopping-cart .items .product .info .quantity {
                    text-align: center;
                }
                .shopping-cart .items .product .info .quantity .quantity-input {
                    padding: 4px 10px;
                    text-align: center;
                }
            }

        </style>
    </head>
    <body>
        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Shopping Cart</h2>

                    </div>

                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-8">
                                <div class="items">

                                    <c:set value="${sessionScope.cart}" var="o"/>
                                    <c:forEach  items="${o.items}" var="i">
                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <img class="img-fluid mx-auto d-block image" src="${i.product.url_img}">
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-5 product-name">
                                                                <div class="product-name">
                                                                    <br>
                                                                    <a href="#">${i.product.name}</a>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 quantity">
                                                                <label for="quantity">Quantity:</label><br>
                                                                <button class="btn btn-sm decrease-qty"><a href="processcart?num=-1&id=${i.product.id}">-</a></button>
                                                                <span class="qty">x${i.quantity}</span>
                                                                <button class="btn btn-sm increase-qty"><a href="processcart?num=1&id=${i.product.id}">+</a></button>
                                                            </div>
                                                            <div class="col-md-2 price">
                                                                <span>${i.product.price}</span>

                                                            </div>
                                                            <div class="col-md-1 delete">
                                                                <br>
                                                                <form action="processcart" method="post">
                                                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                                                    <button type="submit" class="btn btn-danger">Remove </button>   
                                                                </form>


                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="summary">
                                    <h3>Summary</h3>
                                     <c:set value="${sessionScope.total}" var="total"/>
                                    <div class="summary-item"><span class="text">Subtotal</span><span class="price"> $${total}</span></div>
                                    <div class="summary-item"><span class="text">Discount</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Shipping</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Total</span><span class="price"> $${total}</span></div>
                                    <form action="order">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Checkout</button>    
                                    </form>
                                    
                                </div>
                            </div>
                        </div> 
                        <a href="home" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Continue Shopping</a>
                    </div>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
