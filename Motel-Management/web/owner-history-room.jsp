

<%@page import="sample.owner.HistoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sun.java2d.marlin.stats.Histogram"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home On Road</title>
        <link rel="shortcut icon" href="assets/img/logo2.png">
        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/owner-style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <!-- Data-Table -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    </head>
    <body>
        <!-- loading -->
        <!-- <div id="preloader">
            <img class="loadbackground" src="assets/img/loading.jpg" alt="background">
            <img class="car" src="assets/img/car.gif" alt="loading...">
        </div> -->

        <div id="main-wrapper">
            <!-- sidebar -->
            <div class="sidebar">
                <div class="container">
                    <div class="navigation">
                        <ul class="slide-menu">
                            <div class="logo">
                                <a href="owner-index.jsp">
                                    <img class="logo" src="assets/img/logo2.png" alt="logo">
                                </a>
                            </div>
                            <%
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser == null || !loginUser.getRole().equals("OW")) {
                                    response.sendRedirect("login.jsp");
                                    return;
                                }
                            %>
                            <li data-toggle="tooltip"data-placement="right" title="Tổng quan">
                                <a href="MainController?action=ShowOverview">
                                    <span><i class='bx bx-tachometer'></i></span>
                                    <span class="title">Tổng quan</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <i class='bx bx-bookmarks'></i>
                                    <span class="title">Quản lý</span>
                                    <i class='bx bxs-chevron-down drop'></i>
                                </a>
                                <ul class="collapse sub-menu" id="collapseOne">
                                    <li data-toggle="tooltip"data-placement="right" title="Quản lý nhà">
                                        <a href="MainController?action=ownerShowMotel" li class="dropdown-item">
                                            <i class='bx bx-home-alt-2'></i>
                                            <span class="title">Nhà nghỉ</span>
                                        </a> 
                                    </li>
                                    <li class="active" data-toggle="tooltip"data-placement="right" title="Quản lý phòng">
                                        <a href="MainController?action=ShowRoom&ownerID=<%=loginUser.getUserId()%>" li class="dropdown-item">
                                            <i class='bx bx-calendar-edit'></i>
                                            <span class="title">Phòng</span>
                                        </a>
                                    </li> 
                                    <li data-toggle="tooltip"data-placement="right" title="Quản lý dịch vụ">
                                        <a href="owner-service.jsp" li class="dropdown-item">
                                            <i class='bx bx-cloud-rain'></i>
                                            <span class="title">Dịch vụ</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="active" data-toggle="tooltip"data-placement="right" title="Lịch sử">
                                <a href="MainController?action=ShowHistory">
                                    <span><i class='bx bx-history'></i></span>
                                    <span class="title">Lịch sử thuê phòng</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Thông báo">
                                <a href="owner-notification.jsp">
                                    <span><i class='bx bx-bell'></i></span>
                                    <span class="title">Thông báo</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Nhận xét">
                                <a href="onwer-feedback.jsp">
                                    <span><i class="bx bx-detail"></i></span>
                                    <span class="title">Nhận xét</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Thống kê">
                                <a href="owner-statistical.jsp">
                                    <span><i class='bx bx-line-chart'></i></span>
                                    <span class="title">Thống kê</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Tài khoản">
                                <a href="MainController?action=ShowProfile&userID=<%=loginUser.getUserId()%>&role=<%=loginUser.getRole()%>">
                                    <span><i class='bx bx-user'></i></span>
                                    <span class="title">Tài khoản</span>
                                </a>
                            </li> 
                        </ul>
                    </div>  
                </div>
            </div>
            <!-- End sidebar -->

            <!-- Header -->
            <div class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="toggle float-left">
                                <i class='bx bx-menu'></i>
                            </div>
                            <div class="float-left">
                                <div class="dashboard_bar d-flex">
                                    Lịch Sử Thuê Phòng
                                </div>
                            </div>
                            <div class="float-right">
                                <div class="btn-group me-1 mb-1">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Lê Minh Quân
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="owner-profile.html"><i class='bx bx-user'></i>Tài khoản</a>
                                            <a class="dropdown-item" href="owner-notification.html"><i class='bx bx-bell'></i>Thông báo</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#"><i class='bx bx-log-out-circle'></i>Thoát</a>
                                        </div>
                                    </div>  
                                </div>  
                            </div>   
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="main">
                    <div class="container-fluid">
                        <section>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="myTable" class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã Đặt Phòng</th>
                                                            <th>Mã Motel</th>
                                                            <th>Mã Phòng</th>
                                                            <th>Tên Người Thuê</th>
                                                            <th>Trạng Thái</th>
                                                            <th>Số Dịch Vụ</th>
                                                            <th>PT Thanh Toán</th>
                                                            <th>Ngày Nhận Phòng</th>
                                                            <th>Tổng Tiền</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            List<HistoryDTO> listHistory = (ArrayList<HistoryDTO>) request.getAttribute("LIST_HISTORY");
                                                            for (HistoryDTO history : listHistory) {
                                                                String status = "Đã Hủy";
                                                                if (history.getStatus().equals("2")) {
                                                                    status = "Đã Cọc";
                                                                }
                                                                if (history.getStatus().equals("0")) {
                                                                    status = "Chưa Thanh Toán";
                                                                }
                                                                if (history.getStatus().equals("1")) {
                                                                    status = "Đã Thanh Toán";
                                                                }
                                                        %>
                                                        <tr class='clickable-row' data-href="MainController?action=showHistoryDetail&bookingID=<%=history.getBookingID()%>&roomID=<%= history.getRoomID() %>" 
                                                            data-bs-toggle="tooltip"data-bs-placement="right" title="Nhấn để xem chi tiết">
                                                            <td><%= history.getBookingID()%></td>
                                                            <td><%= history.getMotelID()%></td>
                                                            <td><%= history.getRoomID()%></td>
                                                            <td><%= history.getUserName()%></td>
                                                            <td><%= status %></td>
                                                            <td><%= history.getNumberService()%></td>
                                                            <td><%= history.getPayType()%></td>
                                                            <td><%= history.getDate()%></td>
                                                            <td><%= history.getTotal()%>&#8363;</td>

                                                        </tr>
                                                        <% }%>                                                    
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /# card -->
                                </div>
                                <!-- /# column -->
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>