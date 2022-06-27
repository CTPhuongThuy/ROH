
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
        <title>Home</title>
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
        <!-- INFOR -->
        <section class="infor">
            <div class="background-infor">
                <div id="carouselBanner" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./assets/img/cover-1.jpg" class="d-block w-100" alt="cover-1">
                        </div>
                        <div class="carousel-item">
                            <img src="./assets/img/cover-2.jpg" class="d-block w-100" alt="cover-2">
                        </div>
                        <div class="carousel-item">
                            <img src="./assets/img/cover-3.jpg" class="d-block w-100" alt="cover-3">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselBanner" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselBanner" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="infor__content container">
                <div class="row">
                    <div class="col-12 col-md-4  d-flex my-5">
                        <div class="image">
                            <img src="./assets/img/best-choice.jpg" alt="best-choice">
                        </div>
                        <div class="content">
                            <h4>Lựa chọn tốt nhất</h4>
                            <p>HORD đưa cho bạn những lựa chọn phù hợp về nhà trọ để bạn có một cuộc sống vui vẻ.</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 d-flex my-5">
                        <div class="image">
                            <img src="./assets/img/security.jpg" alt="security">
                        </div>
                        <div class="content">
                            <h4>An toàn & bảo mật</h4>
                            <p>Thông tin minh bạch, bảo mật cao cùng với những dịch vụ uy tín đem lại trải nghiệm tốt nhất
                                cho bạn</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 d-flex  my-5">
                        <div class="image">
                            <img src="./assets/img/support.jpg" alt="img3">
                        </div>
                        <div class="content">
                            <h4>Hỗ trợ 24/7</h4>
                            <p>Luôn luôn lắng nghe, luôn luôn hỗ trợ bạn về tất cả dịch vụ tại HORD.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="motel container spacing">
            <div class="d-flex justify-content-between align-items-center">
                <h3 class="heading"><i class="fa fa-newspaper"></i> TIN CHO THUÊ</h3>
                <a href="MainController?action=ShowAllMotel" class="view-motel-list">Xem tất cả <i class="fa fa-angle-right"></i></a>
            </div>
            <div class="motel__content">
                <h5><i class="fa fa-heart"></i> Yêu thích </h5>
                <div class="famousList-carousel owl-carousel owl-theme">
                    <c:if test="${requestScope.LIST_MOTEL_HOT != null}">
                        <c:if test="${not empty requestScope.LIST_MOTEL_HOT}">

                            <c:forEach var="o" varStatus="counter" items="${requestScope.LIST_MOTEL_HOT}">
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
                                        <p style="font-size: 1rem"><i class="fas fa-money-bill-wave"></i> Chỉ từ: <span class="price-format" data-price="${o.motelprice}"></span></p>
                                        <button class="button--primary"><a class="text-decoration-none text-white"
                                                                           href="MainController?action=ShowMotelDetail&motelID=${o.motelID}">Xem ngay</a></button> 
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
                <h5><i class="fa fa-sort-amount-down"></i> Phổ biến</h5>
                <div class="ratingList-carousel owl-carousel owl-theme">
                    <c:if test="${requestScope.LIST_MOTEL != null}">
                        <c:if test="${not empty requestScope.LIST_MOTEL}">

                            <c:forEach var="o" varStatus="counter" items="${requestScope.LIST_MOTEL}">
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
                                        <p><i class="fas fa-address-book"></i> Hotline</p>
                                        <p>${o.phone}</p>
                                    </div>
                                    <div class="motel-price d-flex justify-content-between">
                                        <p style="font-size: 1rem"><i class="fas fa-money-bill-wave"></i> Chỉ từ: <span class="price-format" data-price="${o.motelprice}"></span></p>
                                        <button class="button--primary"><a class="text-decoration-none text-white"
                                                                           href="MainController?action=ShowMotelDetail&motelID=${o.motelID}">Xem ngay</a></button> 
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
            </div>  
        </section>  


        <!-- CONTACT -->
        <section class="contact"></section>


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
            $('.famousList-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                dots: false,
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
            $('.ratingList-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                dots: false,
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
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
        <script src="assets/js/user-script.js"></script>

    </body>

</html>