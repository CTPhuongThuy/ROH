

<%@page import="sample.room.RoomTypeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- main CSS -->
        <link rel="stylesheet" href="./assets/css/main.css">
    </head>

    <body>
        <!-- HEADER -->
        <%@include file="header.jsp" %>
        <div class="header__breadcrumb container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="ShowMotelController"
                                                   class="text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item"><a href="ShowAllMotelController"
                                                   class="text-decoration-none">Danh sách motel</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Đặt phòng</li>
                </ol>
            </nav>
        </div>
        <hr>
    </header>

    <!-- CONTENT -->
    <section class="confirm-booking mb-5">
        <div class="container">
            <div class="row">
                <div class="col-5">
                    <div class="infor-booking">
                        <h3 class="heading"><i class="fa fa-money-check-alt"></i> Chi tiết đặt phòng của bạn</h3>
                        <div class="box">
                            <c:forEach var="o" varStatus="counter"
                                       items="${requestScope.DETAIL_MOTEL}">
                                <%                                                                           
                                    double total = 0;
                                    double sum = 0;
                                %>
                                <p class="d-flex"><i class="fa fa-hand-point-right"></i> <label><span class="label">Tên nhà
                                            nghỉ:</span> <span><input type="hidden" name="name" value="${o.name}" />${o.name}</span></label>
                                </p>
                                <p class="d-flex"><i class="fa fa-hand-point-right"></i> <label><span class="label">Địa
                                            chỉ:</span><input type="hidden" name="address" value="${o.address},${o.district},${o.city}" /> ${o.address},${o.district},${o.city}
                                    </label></p>
                                <p class="d-flex"><i class="fa fa-hand-point-right"></i> <label><span class="label">Số phòng
                                            đặt:</span> <span><input type="hidden" name="countroom" value="<%= request.getParameter("countroom")%>" /><%= request.getParameter("countroom")%></span>
                                        phòng</label></p>
                                <p class="d-flex"><i class="fa fa-hand-point-right"></i>
                                    <label><span class="label">Số giờ đặt:</span> <span><input type="hidden" name="counttime" value="<%= request.getParameter("counttime")%>" /><%= request.getParameter("counttime")%></span> giờ</label>
                                </p>
                                <div class="d-flex">
                                    <p><i class="fa fa-hand-point-right"></i><span class="label">Đơn giá:</span></p>
                                    <ul class="ml-3">
                                        <li>- <span><%= request.getParameter("countroom")%></span> <input type="hidden" name="typename" value="<%= request.getParameter("typename")%>" /><%= request.getParameter("typename")%> <i class="fa fa-arrow-right"></i>
                                            <span>149000</span> VNĐ
                                        </li>

                                        <hr>
                                        <li>- Tổng tiền: <span>149000</span> VNĐ</li>
                                    </ul>
                                </div>
                                <%
                                    total += sum;
                                %>  
                            </c:forEach>
                        </div>
                    </div>
                    <hr>
                    <div class="infor-owner">
                        
                        <h3 class="heading"><i class="fas fa-id-card-alt"></i> Chủ nhà nghỉ</h3>
                        <c:forEach var="i" varStatus="counter"
                                   items="${requestScope.DETAIL_MOTEL}">
                        <div class="box d-flex">
                            <span><img src="https://hfr.vn/Images/poster.png" alt="profile"></span>
                            <span class="infor-owner-detail">
                                <p class="m-0"><span class="label">Họ tên:</span> ${i.ownerName}</p>
                                <p class="m-0"><span class="label">SĐT:</span> ${i.phone}</p>
                                <p class="m-0"><span class="label">Địa chỉ:</span> ${i.address},${i.district},${i.city}
                                </p>
                            </span>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-7">
                    <h3 class="heading"><i class="fa fa-address-card"></i> Xác nhận thông tin</h3>
                    <div class="warning">
                        <span><i class="fas fa-exclamation-circle"></i> Yêu cầu nhập thông tin chính
                            xác, trung thực</span>
                    </div>
                    <form id="form-3" action="" method="POST" class="form row">
                        <div class="form-item col-6">
                            <label for="fullName">Họ và Tên</label>
                            <input type="text" name="fullname" id="fullName" />
                            <span id="error_message" class="helper-text text-danger"></span>
                        </div>
                        <div class="form-item col-6">
                            <label for="email">Địa chỉ email</label>
                            <input type="email" name="gmail" id="gmail">
                            <span id="error_message" class="helper-text text-danger"></span>
                        </div>
                        <div class="form-item col-6">
                            <label for="telephone">Số điện thoại</label>
                            <input type="tel" name="phone" id="telephone">
                            <span id="error_message" class="helper-text text-danger"></span>
                        </div>
                        <div class="form-item col-6">
                            <label for="password">Phương thức thanh toán</label>
                            <select class="custom-select" name="payment" id="inputGroupSelect01">
                                <option value="1" selected>Tiền mặt</option>
                                <option value="2">Chuyển khoản</option>
                            </select>
                        </div>
                        <div class="form-item col-12">
                            <label for="requestMore"><img src="assets/img/bell-concierge-solid.svg" alt="bell"> Yêu cầu
                                thêm</label>
                            <p class="request-note">- Yêu cầu của quý khách sẽ được thực hiện phụ thuộc vào đối tác -
                            </p>
                            <textarea id="requestMore" name="" id="" cols="30" rows="10"
                                      placeholder="VD: Tôi cần đồ dịch vụ massage khi đến nhận phòng,... (Không bắt buộc)"></textarea>
                        </div>
                        <div class="form-checkbox col-12">
                            <input type="checkbox" aria-label="Điều khoản và chính sách" required>
                            <span>Tôi đồng ý <a href="#">Điều khoản và chính sách</a></span>
                        </div>
                        <button type="submit" value="submit" class="button--primary btn btn-danger" action="Booking">Xác nhận
                            đặt
                            phòng</button>
                        <!-- sau khi gửi form thành công  -->
                        <span class="check-success"><i class="fa fa-check-circle"></i> Bạn đã xác nhận đặt phòng thành
                            công</span>
                    </form>
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
    <!-- main js -->
    <script src="assets/js/user-script.js"></script><script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    referrerpolicy="no-referrer"></script>
    <!-- BS4 JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
    <!-- owl Carousels -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script>
        $('.rating-carousel').owlCarousel({
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
                    items: 3
                }
            }
        });
    </script>
    <!-- lightbox -->
    <script src="vendor/lightbox/js/lightbox.min.js"></script>
    <script src="assets/js/user-script.js"></script>
    <script>
        Validator({
            form: '#form-3',
            errorSelector: '#error_message',
            rules: [
                Validator.isNotEmpty('#fullName'),
                Validator.isTextOnly('#fullName', 'Vui lòng nhập đúng cú pháp'),
                Validator.isNotEmpty('#email'),
                Validator.isEmail('#email', 'Vui lòng nhập đúng cú pháp'),
                Validator.isNotEmpty('#telephone'),
                Validator.isNumberOnly('#telephone', 'Vui lòng nhập đúng cú pháp'),
            ]
        });
    </script>
</body>