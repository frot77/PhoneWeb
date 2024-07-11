

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <style>

            .filter {
                background-color: #f7f7f7;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 20px;
                text-align: center;
                display: flex;
                justify-content: center;
                max-width: 800px; /* Điều chỉnh độ rộng của phần filter tùy theo ý muốn */
                margin: 0 auto; /* Để căn giữa phần filter */
            }

            .filter form {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .filter label {
                font-weight: bold;
            }

            .filter select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
            }

            .filter input[type="submit"] {
                background-color: #007BFF;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }

            .filter input[type="submit"]:hover {
                background-color: #0056b3;

            </style>

            <script type="text/javascript">
                function setCheck(obj) {

                    var fries = document.getElementsByName('cidd');
                    if ((obj.id == 'c0') && (fries[0].checked == true)) {
                        for (var i = 1; i < fries.length; i++) {
                            fries[i].checked = false;
                        }
                    } else {
                        for (var i = 1; i < fries.length; i++) {
                            if (fries[i].checked == true) {
                                fries[0].checked = false;
                                break;
                            }
                        }
                    }

                    document.getElementById('f1').submit();
                }

                function setCheck1(obj) {

                    var fries = document.getElementsByName('price');
                    if ((obj.id == 'p0') && (fries[0].checked == true)) {
                        for (var i = 1; i < fries.length; i++) {
                            fries[i].checked = false;
                        }
                    } else {
                        for (var i = 1; i < fries.length; i++) {
                            if (fries[i].checked == true) {
                                fries[0].checked = false;
                                break;
                            }
                        }
                    }

                    document.getElementById('f2').submit();
                }

            </script>

            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->


        </head>
        <body>
            <jsp:include page="header.jsp"></jsp:include>
                <!-- BREADCRUMB -->
                <div id="breadcrumb" class="section">
                    <!-- container -->
                    <div class="container">
                        <!-- row -->
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="breadcrumb-tree">


                                </ul>
                            </div>
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /container -->
                </div>
                <!-- /BREADCRUMB -->

                <!-- SECTION -->
                <div class="section">
                    <!-- container -->
                    <div class="container">
                        <!-- row -->
                        <div class="row">
                            <div class="filter">
                                <form action="store" method="post">
                                    <label><strong>Categories</strong></label>
                                <c:set value="${requestScope.key}" var="k"/>
                                <select name="key">
                                    <option value="0">All</option>
                                    <c:forEach items="${listC}" var="c">
                                        <option ${(c.cid==k)?"selected":""} value="${c.cid}">${c.cname}</option>
                                    </c:forEach>
                                </select>

                                <c:set value="${requestScope.price}" var="pr"/>
                                <label for="sort"> <strong>Price Range:</strong></label>
                                <select name="price">
                                    <option ${(pr==0)?"selected":""} value="0">All</option>
                                    <option ${(pr==1)?"selected":""} value="1">under 1000$</option>
                                    <option ${(pr==2)?"selected":""} value="2">1000$-2000$</option>
                                    <option ${(pr==3)?"selected":""} value="3">2000$-3000$</option>
                                    <option ${(pr==4)?"selected":""} value="4">over 3000$</option>
                                </select>

                                <c:set value="${requestScope.sort}" var="s"/>
                                <label for="sort"> <strong>Sort By</strong></label>
                                <select name="sort">
                                    <option ${(s==0)?"selected":""} value="0">None</option>
                                    <option ${(s==1)?"selected":""} value="1">Low to High Price</option>
                                    <option ${(s==2)?"selected":""} value="2">High to Low Price</option>
                                    <option ${(s==3)?"selected":""} value="3">Low to High Date</option>
                                    <option ${(s==4)?"selected":""} value="4">High to Low Date</option>
                                </select>


                                <input type="submit" value="Filter">
                            </form>
                        </div>

                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                <!-- /store top filter -->

                <!-- store products -->
                <div class="row">
                    <!-- product -->
                    <c:choose>
                        <c:when test="${empty listP}">
                            <div class="col-md-12 text-center">
                                <p style="font-size: 24px;
                                font-weight: bold;">Not found</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.listP}" var="p" >
                                <div class="col-md-4 col-xs-6">

                                    <div class="product">

                                        <div class="product-img">
                                            <img src="${p.url_img}" alt="">
                                            <div class="product-label">
                                                <span class="sale">-30%</span>
                                                <span class="new">NEW</span>
                                            </div>
                                        </div>
                                        <div class="product-body">

                                            <h3 class="product-name"><a href="detail?pid=${p.id}">${p.name}</a></h3>
                                            <h4 class="product-price">${p.price} <del class="product-old-price">${p.price*2}</del></h4>
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                <button class="quick-view" onclick="window.location.href = 'detail?pid=${p.id}'"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <form name="f" action="buy?id=${p.id}" method="post">
                                                <button type="submit" class="add-to-cart-btn">
                                                    <i class="fa fa-shopping-cart"></i> add to cart
                                                </button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <!-- /product -->

                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">

                    <c:set var="page" value="${requestScope.page}"/>
                    <ul class="store-pagination">

                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">   

                            <li><a class="${i==page?"active":""}" href="search?page=${i}&txt=${va}&key=${k}&price=${pr}">${i}</a> </li>    

                        </c:forEach>

                    </ul>
                </div>
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->



<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->


</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>

