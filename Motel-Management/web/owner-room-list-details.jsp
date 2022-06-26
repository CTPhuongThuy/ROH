<%-- 
    Document   : owner-room-list-details
    Created on : Jun 15, 2022, 2:36:31 AM
    Author     : Bao
--%>
<%@page import="sample.room.RoomTypeDTO"%>
<%@page buffer="8192kb" autoFlush="true" %>
<%@page import="sample.service.ServiceDTO"%>
<%@page import="sample.motel.MotelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page import="sample.owner.RoomDetailDTO"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <!-- Other-->
        <link rel="stylesheet" href="https://unpkg.com/filepond-plugin-file-poster/dist/filepond-plugin-file-poster.css" >
    </head>
    <body>
        <!-- sidebar -->
        <div class="sidebar">
            <div class="container">
                <div class="navigation">  
                    <ul class="slide-menu">
                        <div class="logo">
                            <a href="owner-index.html">
                                <img class="logo" src="assets/img/logo2.png" alt="logo">
                            </a>
                        </div>
                        <li data-toggle="tooltip"data-placement="right" title="Tổng quan">
                            <a href="MainController?action=ShowOverview">
                                <span><i class='bx bx-tachometer'></i></span>
                                <span class="title">Tổng quan</span>
                            </a>
                        </li>
                        <%
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (loginUser == null || !loginUser.getRole().equals("OW")) {
                                response.sendRedirect("login.jsp");
                                return;
                            }
                        %>
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
                        <li data-toggle="tooltip"data-placement="right" title="Lịch sử">
                            <a href="MainController?action=ShowHistory">
                                <span><i class='bx bx-history'></i></span>
                                <span class="title">Lịch sử thuê phòng</span>
                            </a>
                        </li>
                        <li data-toggle="tooltip"data-placement="right" title="Thông báo">
                            <a href="MainController?action=ShowHistory">
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
                                Quản Lý Phòng
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
        <!-- End header -->

        <!-- List room -->
        <div class="main-content">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="offset-sm-6 col-sm-6  d-flex justify-content-sm-end p-md-0 mt-2 mt-sm-0 ">
                            <ol class="breadcrumb">
                                <li class="breadcrumd-item">
                                    <a href="#">Quản lý</a>
                                </li>
                                <li class="breadcrumd-item">
                                    <span>/</span>
                                </li>
                                <li class="breadcrumd-item">
                                    <a href="owner-room-list.html">Phòng</a>
                                </li>
                                <li class="breadcrumd-item">
                                    <span>/</span>
                                </li>
                                <li class="breadcrumd-item active">
                                    <a href="#">Chi tiết</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 customer-detail">
                            <div class="col-lg-8 customer-booking">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Thông tin đặt phòng</h4>
                                    </div>
                                    <%
                                        RoomDetailDTO roomDetail = (RoomDetailDTO) request.getAttribute("ROOM_DETAIL");
                                        if (roomDetail == null) {
                                            roomDetail = new RoomDetailDTO();
                                        }
                                        String status = "Trống";
                                        if (roomDetail.getStatus() == 1) {
                                            status = "Đang Thuê";
                                        }
                                    %>
                                    <div class="card-body">
                                        <div style="float: right; cursor: pointer;">
                                            <i class='bx bxs-edit-alt'data-toggle="modal" data-target="#editRoom"></i>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Trạng thái:</span>
                                            </div>
                                            <div class="col-sm-7">
                                                <span class="demise" style="float: left;"><%= status%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Mã đặt phòng:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getBookingID()%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Mã Phòng:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getRoomID()%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Loại Phòng:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getRoomType()%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Mã Motel:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getMotelID()%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Địa chỉ:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getAddress()%> - <%= roomDetail.getDistrict()%> - <%= roomDetail.getCity()%></span>
                                            </div>
                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Ngày thuê:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getBookingDate()%></span>
                                            </div>

                                        </div>
                                        <div class="row mb-sm-2">
                                            <div class="col-sm-5 text-sm-right">
                                                <span>Thời Gian Thuê:</span>
                                            </div>
                                            <div class="col-sm-7 text-sm-left">
                                                <span><%= roomDetail.getTime()%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    UserDTO userProfile = (UserDTO) request.getAttribute("USER_PROFILE");
                                    if (userProfile == null) {
                                        userProfile = new UserDTO();
                                    }
                                %>         
                                <div class="row">
                                    <div class="col-lg-12 cust-profile justify-content-between">
                                        <div class="col-lg-5 card profile">
                                            <div class="card-header">
                                                <h5>Thông tin người thuê</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-5 text-md-right">
                                                        <label for="customer-name">Họ và tên:</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span><%= userProfile.getFullName()%></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5 text-md-right">
                                                        <label for="customer-name">Số điện thoại:</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span><%= userProfile.getPhone()%></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5 text-md-right">
                                                        <label for="customer-name">CCCD/ CMND:</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span><%= userProfile.getCitizenNumber()%></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-5 text-md-right">
                                                        <label for="customer-name">Địa chỉ:</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <span><%= userProfile.getAddress()%></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 card rating">
                                            <div class="card-header">
                                                <h5>Dịch vụ sử dụng</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="table-responsive">
                                                        <table id="myTable" class="table table-hover table-borderless">
                                                            <thead>
                                                                <tr>
                                                                    <th>Mã Dịch vụ</th>
                                                                    <th>Tên Dịch vụ</th>
                                                                    <th>Số tiền</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    List<ServiceDTO> listService = (ArrayList<ServiceDTO>) request.getAttribute("SERVICE_LIST");
                                                                    int total = 0;
                                                                    if (listService != null) {
                                                                        if (listService.size() > 0) {
                                                                            for (ServiceDTO service : listService) {
                                                                                int price = service.getPrice() * service.getQuantity();
                                                                                total += price;
                                                                %>
                                                                <tr>
                                                                    <td><%= service.getServiceId()%></td>
                                                                    <td><%= service.getName()%></td>
                                                                    <td><%= price%>&#8363;</td>
                                                                </tr>
                                                                <%
                                                                            }
                                                                        }
                                                                    }
                                                                %> 
                                                            </tbody>
                                                            <tfoot style="color: #e74c3c; border-top: 1px solid #ccc;">
                                                                <tr>
                                                                    <th>Total</th>
                                                                    <th></th>
                                                                    <th><%= total%>&#8363;</th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 total-pay">
                                <div class="card">
                                    <div class="card-header">
                                        <h5>Tổng tiền</h5>
                                    </div>
                                    <div class="card-body flex-wrap">
                                        <div class="row">
                                            <div class="table-responsive">
                                                <table id="myTable" class="table table-hover table-borderless">
                                                    <thead>
                                                        <tr>
                                                            <th>STT</th>
                                                            <th>Nội dung thanh toán</th>
                                                            <th>Số tiền</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% int totalRoom = 0;
                                                            totalRoom = (int) request.getAttribute("TOTAL_ROOM");%>
                                                        <tr>
                                                            <td>01</td>
                                                            <td>Giá Phòng</td>
                                                            <td><%= totalRoom%>&#8363;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>02</td>
                                                            <td>Dịch vụ</td>
                                                            <td><%= total%>&#8363;</td>
                                                        </tr>
                                                    </tbody>
                                                    <tfoot style="color: #e74c3c; border-top: 1px solid #ccc;">
                                                        <tr>
                                                            <th>Total</th>
                                                            <th></th>
                                                            <th><%= total + totalRoom%>&#8363;</th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- edit Room -->
        <div id="editRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Chỉnh sửa thông tin phòng</h4>
                    </div>
                    <form action="MainController" method="post" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-7">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label">Mã Phòng</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="roomID" readonly class="form-control-plaintext" id="staticEmail" value="<%= roomDetail.getRoomID()%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nameRoom" class="col-sm-4 col-form-label">Tên Phòng</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="roomName" class="form-control" value="<%= roomDetail.getRoomName()%>" id="nameRoom" required>
                                        </div>
                                    </div>
                                    <input type="hidden" name="status" value="<%= roomDetail.getStatus()%>" >
                                    <div class="form-group row">
                                        <label for="typeofRoom" class="col-sm-4 col-form-label">Kiểu Phòng</label>
                                        <div class="col-sm-8">
                                            <select name="roomTypeID" id="typeofRoom" class="form-control">
                                                <% List<RoomTypeDTO> listRoomType = (ArrayList<RoomTypeDTO>) request.getAttribute("LIST_ROOMTYPE");
                                                    if (listRoomType != null) {
                                                        if (listRoomType.size() > 0) {
                                                            for (RoomTypeDTO roomType : listRoomType) {
                                                %>
                                                <option value="<%= roomType.getRoomTypeID()%>"><%= roomType.getTypeName()%></option>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                                <% %>
                                            </select>
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" name="action" value="updateRoom">Xác nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>


        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/2.5.0-beta.5/lightgallery.es5.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>
