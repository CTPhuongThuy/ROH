
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.room.RoomDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.motel.MotelDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Room List</title>
        <link rel="shortcut icon" href="./assets/img/logo2.png">
        <!-- BS4 CSS -->
        <link rel="stylesheet" href="vendor/bootstrap-4.5.3-dist/css/bootstrap.min.css">
        <!-- FONT -->
        <link
            href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;0,900;1,100&family=Roboto+Condensed:wght@400;700&display=swap"
            rel="stylesheet">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="fonts/fontawesome-free-5.15.4-web/css/all.min.css">
        <!-- owl carousels -->
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./assets/css/owl.theme.default.min.css">

        <!-- main CSS -->
        <link rel="stylesheet" href="./assets/css/main.css">
    </head>
    <body>

        <%@include file="header.jsp" %> 
        <!-- HEADER -->
        <hr>
        <div class="header__breadcrumb container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="ShowMotelController" class="text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh sách motel</li>
                </ol>
            </nav>
        </div>
        <hr>
        <!-- CONTENT -->
        <section class="content__list-room container">
            <div class="row">
                <div class="content__filter col-3">
                    <div class="content__filter-tabs-left">
                        <div class="tabs-left-title">
                            <h3 class="heading">Tin đăng</h3>
                        </div>
                        <form class="tabs-left-filter" action="MotelManager" >
                            <div class="input-group mb-3">
                                <select class="custom-select" name="price"  id="inputGroupSelect02">
                                    <option value="0--10000000"> Mức giá </option>
                                    <option value="0--300000">Dưới 300.000</option>
                                    <option value="300000--500000">Từ 300.000 - 500.000</option>
                                    <option value="500000--10000000">Trên 500.000</option>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <select class="custom-select" name="district"  id="inputGroupSelect02">
                                    <option value=""> Chọn Quận </option>
                                    <c:if test="${requestScope.LIST_DISTRICT != null}">
                                        <c:if test="${not empty requestScope.LIST_DISTRICT}">
                                            <c:forEach var="d" varStatus="counter" items="${requestScope.LIST_DISTRICT}">
                                                <option value="${d.districtID}"> ${d.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                </select>
                            </div>
                            <div class="filter-search text-center">
                                <button class="button--primary" type="submit" name="action" value="filter"><i class="fa fa-filter"></i> Lọc</button>
                            </div>
                        </form>
                        <div class="col-bg">
                            <div class="bg-1"></div>
                            <div class="bg-2"></div>
                        </div>
                    </div>
                </div>
                <div class="content__list col-9">
                    <div class="row">
                        <c:if test="${requestScope.LIST_MOTEL != null}">
                            <c:if test="${not empty requestScope.LIST_MOTEL}">

                                <c:forEach var="o" varStatus="counter" items="${requestScope.LIST_MOTEL}">
                                    <div class="col-4 p-0">
                                        <div class="room-item ">
                                            <a href="MainController?action=ShowMotelDetail&motelID=${o.motelID}" class="motel-image">
                                                <img class="img-fluid" src="${o.image}" alt="nt1">
                                            </a>
                                            <div class="motel-title my-2">
                                                <a href="MainController?action=ShowMotelDetail&motelID=${o.motelID}" class="text-decoration-none">${o.name} <span style="color: black">${o.rating} <span style="color: yellow"> <i class="fa fa-star"></i></span></span> </a>
                                            </div>
                                            <div class="motel-address ">
                                                <p class="address truncate"><i class="fas fa-map-marker-alt"></i> ${o.address},${o.district},${o.city}</p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <p><i class="fa fa-star"></i> Loại:</p><p> ${o.typename}</p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <p><i class="fas fa-address-book"></i> Hotline</p><p> ${o.phone}</p>
                                            </div>
                                            <div class="motel-price d-flex justify-content-between">
                                                <p style="font-size: 1rem"><i class="fas fa-money-bill-wave"></i> Chỉ từ: ${o.motelprice}</p>
                                                <button class="button--primary"><a class="text-decoration-none text-white"
                                                                                   href="MainController?action=ShowMotelDetail&motelID=${o.motelID}">Xem ngay</a></button> 
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${requestScope.MESSAGE != null}">
                            <c:if test="${not empty requestScope.MESSAGE}">
                                <div class="reviews-title alert alert-info col-12">
                                    ${requestScope.MESSAGE}
                                </div>
                            </c:if>
                        </c:if>

                    </div>
                    <div class="pagination mb-3">
                        <button class="btn">
                            <i class="fa fa-angle-left"></i>
                        </button>
                        <div class="pages">
                            <a class="page active">1</a>
                            <a class="page">2</a>
                            <a class="page">3</a>
                            <a class="page">4</a>
                            <a class="page">...</a>
                            <a class="page">10</a>
                        </div>
                        <button class="btn">
                            <i class="fa fa-angle-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </section>
        <!-- FOOTER -->

        <%@include file="footer.jsp" %> 
        <!-- thư viện hỗ trợ -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        referrerpolicy="no-referrer"></script>
        <!-- Jquery Waypoint -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
        <!-- BS4 JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.5/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- BS4 carousels -->
        <script>
            $('.carousel').carousel({
                interval: 3000
            });
        </script>
        <!-- owl carousels -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script>
            $('.motelList-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: false,
                responsive: {
                    0: {
                        items: 1
                    },
                    576: {
                        items: 2
                    },
                    1200: {
                        items: 4
                    }
                }
            });
        </script>
        <!-- main js -->
        <script src="assets/js/user-script.js"></script>
    </body>