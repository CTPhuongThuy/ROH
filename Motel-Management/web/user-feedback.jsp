<%-- 
    Document   : user-feedback
    Created on : Jun 16, 2022, 9:25:07 PM
    Author     : cao thi phuong thuy
--%>

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

        <!-- sidebar -->
        <div class="sidebar">
            <div class="container">
                <div class="navigation">
                    <ul class="slide-menu">
                        <div class="logo">
                            <a href="ShowMotelController">
                                <img class="logo" src="assets/img/logo2.png" alt="logo">
                            </a>
                        </div>
                        <%
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (loginUser == null || !loginUser.getRole().equals("US")) {
                                response.sendRedirect("login.jsp");
                                return;
                            }
                        %>
                        
                        <li data-toggle="tooltip"data-placement="right" title="Lịch sử" class="active">
                                <a href="userhistorybooking">
                                <span><i class='bx bx-history'></i></span>
                                <span class="title">Lịch sử đặt phòng</span>
                            </a>
                        </li>
                        <li data-toggle="tooltip"data-placement="right" title="Thông báo">
                            <a href="#">
                                <span><i class='bx bx-bell'></i></span>
                                <span class="title">Thông báo</span>
                            </a>
                        </li>
                        <li>
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
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
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
                                Đánh giá
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="btn-group me-1 mb-1">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                       ${sessionScope.LOGIN_USER.fullName}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#"><i class='bx bx-user'></i>Tài khoản</a>
                                        <a class="dropdown-item" href="#"><i class='bx bx-bell'></i>Thông báo</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="MainController?action=Logout"><i class='bx bx-log-out-circle'></i>Thoát</a>
                                    </div>
                                </div>  
                            </div>  
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <!-- End header -->

         <div class="main-content">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="offset-sm-6 col-sm-6  d-flex justify-content-sm-end p-md-0 mt-2 mt-sm-0 ">
                            <ol class="breadcrumb">
                                <li class="breadcrumd-item">
                                    <a href="userhistorybooking">Lịch sử đặt phòng</a>
                                </li>
                                <li class="breadcrumd-item">
                                    <span>/</span>
                                </li>
                                <li class="breadcrumd-item active">
                                    <a href="javascript:void(0)">Đánh giá</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 customer-detail">
                            <div class="col-lg-6 customer-profile">
                                <div class="card profile">
                                    <div class="card-header">
                                        <h5>Thông tin đơn hàng</h5>
                                    </div>
                                    <div class="card-body flex-wrap">
                                        <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name">Mã đơn hàng:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>Trần Ngọc Hải</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name">Tên motel:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>0971520977</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name" style="display: block;">Mã phòng:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>000000000000</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name">Ngày đặt phòng:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>Q9, Hồ Chí Minh</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name">Tổng tiền:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>Q9, Hồ Chí Minh</span>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-5 text-md-right">
                                                <label for="customer-name">Trạng thái:</label>
                                            </div>
                                            <div class="col-md-7">
                                                <span>Q9, Hồ Chí Minh</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 customer-booking">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Đánh giá</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-4 text-sm-right">
                                                <span>Trạng thái:</span>
                                            </div>
                                            <div class="col-sm-3 text-sm-left">
                                                <span class="outcome">Đã Thanh Toán</span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class=" col-sm-4 text-sm-right">
                                                <span>Mã đặt phòng:</span>
                                            </div>
                                            <div class="col-sm-3 text-sm-left">
                                                <span>A1</span>
                                            </div>
                                        </div>
                                        
                                        <form class="row" action="MotelManager" style="flex-wrap: wrap !important">
                                                <div class="mb-3 col-md-12">
                                                    <label for="ratings" class="form-label">Ratings</label>
                                                    <input type="text" class="form-control" name="ratings" value="ratings" >
                                                </div>
                                                <div class="mb-3 col-md-12">
                                                    <label for="desct" class="form-label">Nội dung <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" name="desct" value="desct" required="">
                                                </div>
                                                                                            <div class="d-grid">
                                                    <button type="submit" value="feedback" name="action" class="btn btn-info m-b-xs">Đánh giá</button>
                                                </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
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