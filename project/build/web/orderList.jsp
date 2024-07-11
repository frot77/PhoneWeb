<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Order </title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            /* Custom CSS */

            /* Table Styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th,
            td {
                text-align: left;
                padding: 10px;
            }

            th {
                background-color: #f2f2f2;
            }

            /* Button Styling */
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #218838;
                color: white;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                font-size: 12px;
                margin-bottom: 5%;
                font-weight: bold;
            }

            input[type="submit"]:hover {
                background-color: #1e7e34;
            }

            /* Back to Homepage Button Styling */
            .back-to-homepage {
                display: flex;
                justify-content: center;
                margin-bottom: 3%;
            }

            .back-to-homepage a {
                padding: 10px 20px;
                background-color: #004085;
                color: white;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                text-decoration: none;
            }

            .back-to-homepage a:hover {
                background-color: #003164;
            }

            /* End of Custom CSS */
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div>
                <table>
                    <thead>
                        <tr>
                            <th>ODID</th>
                            <th>UserName</th>
                            <th>Order Date</th>
                            <th>totalMoney</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listO}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.user_name}</td>
                            <td>${o.date}</td>
                            <td>${o.totalMoney}</td>
                            <td>
                                <a href="orderdetail?odid=${o.id}">
                                    <input type="submit" value="Detail">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="back-to-homepage">
            <a href="home">
                Back to Homepage
            </a>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>

</html>
