

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">

                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope.acc==null}">
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i> Login</a></li>    
                            </c:if>
                            <c:if test="${sessionScope.acc!=null}">
                            <li><a href="logout"><i class="fa fa-user-o"></i> Logout</a></li>
                            <li><a href="profile"><i class="fa fa-user-o"></i> view profile</a></li>
                            <li><a href="home"><i class="fa fa-user-o"></i> Hello ${sessionScope.acc.user}</a></li>
                            </c:if>


                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="#" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="search">
                                    <input  class="input" placeholder="Search here" name="txt" value="${value}">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="#">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Your Wishlist</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <c:set value="${sessionScope.size}" var="size"/>
                                        <c:if test="${size==null}">
                                            <div class="qty">0</div>
                                        </c:if>
                                        <c:if test="${size!=null}">
                                            <div class="qty">${size}</div>
                                        </c:if>

                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <c:set value="${sessionScope.cart}" var="o"/>
                                            <c:forEach  items="${o.items}" var="i">

                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="${i.product.url_img}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="#">${i.product.name}</a></h3>
                                                        <button class="btn btn-sm decrease-qty"><a href="process?num=-1&id=${i.product.id}">-</a></button>
                                                        <span class="qty">x${i.quantity}</span>
                                                        <button class="btn btn-sm increase-qty"><a href="process?num=1&id=${i.product.id}">+</a></button>
                                                        <h4 class="product-price">${i.product.price}</h4>
                                                    </div>
                                                    <form action="process" method="post">
                                                        <input type="hidden" name="id" value="${i.product.id}"/>
                                                        <button type="submit" class="delete"><i class="fa fa-close"></i></button>    
                                                    </form>
                                                    <c:set var="totalQuantity" value="${totalQuantity + i.quantity}" />
                                                </div>    

                                            </c:forEach>

                                        </div>
                                        <div class="cart-summary">
                                            <c:set value="${sessionScope.total}" var="total"/>
                                            <small>${totalQuantity} Item(s) selected</small>
                                            <h5>SUBTOTAL: $${total}</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="viewcart">View Cart</a>
                                            <a href="order" >Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">

                        <li class="active"><a href="home">Home</a></li>
                        <li><a href="#sell">Hot Deals</a></li>
                        <li><a href="store">Store</a></li>
                            <c:forEach items="${requestScope.listC}" var="c">
                            <li class="${tag==c.cid?"active":""}"><a href="search?key=${c.cid}">${c.cname}</a></li>
                            </c:forEach>
                        <li><a href="#footer">Contact</a></li>

                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->



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
