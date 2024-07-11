<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <c:if test="${!sessionScope.acc.isIsAdmin()}">
                        <li><a href="orderlist"><i class="fa fa-user-o"></i> My Order</a></li>

                    </c:if>
                    <c:if test="${sessionScope.acc.isIsAdmin()}">
                        <li><a href="orderlist"><i class="fa fa-user-o"></i> View Order</a></li>
                        <li><a href="accountmanager"><i class="fa fa-user-o"></i> View Account</a></li>
                        <li><a href="listproduct"><i class="fa fa-user-o"></i> Product Management</a></li>
                    </c:if>
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
            <c:if test="${sessionScope.message != null}">
                <div id="message" class="notification">
                    ${sessionScope.message}
                </div>
                <script>
                    // Đợi 3 giây sau khi trang tải xong
                    setTimeout(function () {
                        var messageDiv = document.getElementById("message");
                        if (messageDiv) {
                            messageDiv.style.display = "none"; // Ẩn thông báo
                            // Xóa sessionScope.message
                    <%
                                session.removeAttribute("message");
                    %>
                        }
                    }, 3000); // 5000 milliseconds = 3 giây
                </script>
            </c:if>


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

                <c:if test="${!sessionScope.acc.isIsAdmin()}">
                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Wishlist -->
                            <div>
                                <a href="#">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Your Wishlist</span>
                                    <div class="qty">0</div>
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
                        </c:if>

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



