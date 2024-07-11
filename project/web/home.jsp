<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .notification {
                background-color: #f44336; /* Màu nền đỏ */
                color: white; /* Màu văn bản trắng */
                padding: 10px; /* Khoảng cách nội dung bên trong */
                text-align: center; /* Căn giữa văn bản */
                position: fixed; /* Hiển thị thông báo cố định */
                top: 0; /* Hiển thị ở đầu trang */
                left: 0; /* Hiển thị ở góc trái */
                right: 0; /* Hiển thị ở góc phải */
                z-index: 9999; /* Sắp xếp trên cùng */
            }

        </style>



    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <!-- section title -->
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">New Products</h3>
                                <div class="section-nav">
                                    <ul class="section-tab-nav tab-nav">
                                    <c:forEach items="${requestScope.listC}" var="c">
                                        <li class="${caid==c.cid?"active":""}"><a href="category?cid=${c.cid}">${c.cname}</a></li>
                                        </c:forEach>

                                </ul>

                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <c:forEach  items="${requestScope.listP}" var="p">
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
                                        </c:forEach>


                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 id="sell" class="title">Top selling</h3>
                            <div class="section-nav">

                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">


                                        <c:forEach  items="${requestScope.listB}" var="b">
                                            <div class="product">

                                                <div class="product-img">
                                                    <img src="${b.url_img}" alt="">
                                                    <div class="product-label">
                                                        <span class="sale">-30%</span>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">

                                                    <h3 class="product-name"><a href="detail?pid=${b.id}">${b.name}</a></h3>
                                                    <h4 class="product-price">${b.price} <del class="product-old-price">${b.price*1.2}</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="quick-view" onclick="window.location.href = 'detail?pid=${b.id}'"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <form name="f" action="buy?id=${b.id}" method="post">
                                                        <button type="submit" class="add-to-cart-btn">
                                                            <i class="fa fa-shopping-cart"></i> add to cart
                                                        </button>
                                                    </form>

                                                </div>
                                            </div>
                                        </c:forEach>


                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-6 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling Iphone</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">

                            <jsp:useBean id="d" class="dal.DAO"/>
                            <div>
                                <c:forEach items="${d.getBestProductByCid1(1)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- /product widget -->    

                            <div>
                                <c:forEach items="${d.getBestProductByCid2(1)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>

                                    <!-- /product widget -->    
                                </c:forEach>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling Macbook</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">

                            <div>
                                <c:forEach items="${d.getBestProductByCid1(2)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- /product widget -->    

                            <div>
                                <c:forEach items="${d.getBestProductByCid2(2)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>

                                    <!-- /product widget -->    
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-6 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling Ipad</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">

                            <div>
                                <c:forEach items="${d.getBestProductByCid1(3)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- /product widget -->    

                            <div>
                                <c:forEach items="${d.getBestProductByCid2(3)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>

                                    <!-- /product widget -->    
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling Apple watch</h4>
                            <div class="section-nav">
                                <div id="slick-nav-6" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-6">
                            <div>
                                <c:forEach items="${d.getBestProductByCid1(4)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- /product widget -->    

                            <div>
                                <c:forEach items="${d.getBestProductByCid2(4)}" var="bc">
                                    <!-- product widget -->

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="${bc.url_img}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${bc.id}">${bc.name}</a></h3>
                                            <h4 class="product-price">${bc.price} <del class="product-old-price">${bc.price*1.2}</del></h4>
                                        </div>
                                    </div>

                                    <!-- /product widget -->    
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        <jsp:include page="footer.jsp"></jsp:include>



       
        <!-- jQuery Plugins -->


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
