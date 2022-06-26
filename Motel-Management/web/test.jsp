<%-- 
    Document   : test
    Created on : Jun 10, 2022, 12:32:21 AM
    Author     : Bao
--%>

<%@page import="sample.room.RoomDTO"%>
<%@page import="sample.motel.MotelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <ul>
                        <div class="logo">
                            <a href="owner-index.html">
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
                        <li>
                            <a href="MainController?action=ShowOverview">
                                <span><i class='bx bx-tachometer'></i></span>
                                <span class="title">Tổng quan</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="MainController?action=ShowRoom&ownerID=<%=loginUser.getUserId()%>">
                                <span><i class='bx bx-home'></i></span>
                                <span class="title">Phòng</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-service.html">
                                <span><i class='bx bx-cloud-rain'></i></span>
                                <span class="title">Dịch vụ</span>
                            </a>
                        </li>
                        <li>
                            <a href="MainController?action=ShowHistory">
                                <span><i class='bx bx-history'></i></span>
                                <span class="title">Lịch sử thuê phòng</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-notification.html">
                                <span><i class='bx bx-bell'></i></span>
                                <span class="title">Thông báo</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-feedback.html">
                                <span><i class="bx bx-detail"></i></span>
                                <span class="title">Nhận xét</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-statistical.html">
                                <span><i class='bx bx-line-chart'></i></span>
                                <span class="title">Thống kê</span>
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
                    <div class="room-list">
                        <div class="page-header">
                            <div class="edit-home">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addHome">Thêm Nhà</button>
                                <button class="btn btn-success" data-toggle="modal" data-target="#editHome">Sửa Nhà</button>
                                <button class="btn btn-danger" data-toggle="modal" data-target="#deleteHome">Xóa Nhà</button>
                            </div>
                        </div>
                        <section>
                            <div class="card">
                                <div class="card-body">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs">
                                        <!-- dung vong for o day -->
                                        <%
                                            List<MotelDTO> listMotel = (ArrayList<MotelDTO>) request.getAttribute("LIST_MOTEL");
                                            if (listMotel != null) {
                                                if (listMotel.size() > 0) {
                                                    for (MotelDTO motel : listMotel) {

                                        %>
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#a<%= motel.getMotelID()%>">
                                                <i class='bx bx-home-alt-2'></i>
                                                <span><%= motel.getName()%></span>
                                            </a>
                                        </li>
                                        <%
                                                    }
                                                }
                                            }
                                        %> 


                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <!-- home1 -->
                                        <%
                                            if (listMotel != null) {
                                                if (listMotel.size() > 0) {
                                                    for (MotelDTO motel : listMotel) {
                                        %>
                                        <div class="tab-pane active" id="a<%= motel.getMotelID()%>" role="tabpanel">
                                            <div class="row search">
                                                <div class="col-sm-12 d-flex">
                                                    <div class="col-sm-6 d-flex address-home">
                                                        <span>Địa chỉ: </span>
                                                        <h5> 111a,Đình phong phú</h5>
                                                    </div>
                                                    <div class="col-sm-6 d-flex justify-content-end">
                                                        <form action="#">
                                                            <div>
                                                                <label>
                                                                    <input class="form-control" type="text" name="search" placeholder="Search...">
                                                                    <i class='bx bx-search-alt'></i>
                                                                </label>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-3 col-lg-6 col-sm-6 my-3">
                                                    <div class="card card-child">
                                                        <div class="card-body add-room">
                                                            <button class="border-0" data-toggle="modal"  data-target="#addRoom">
                                                                <span>Thêm Phòng</span>
                                                                <i class='bx bx-add-to-queue'></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- dung vong for o day -->
                                                <%
                                                    List<RoomDTO> listRoom = (ArrayList<RoomDTO>) request.getAttribute("LIST_ROOM");
                                                    for (RoomDTO room : listRoom) {
                                                        if (room.getMotelID().equals(motel.getMotelID())) {
                                                %>
                                                <div class="col-xl-3 col-lg-6 col-sm-6 my-3">
                                                    <div class="card card-child">
                                                        <div class="room-name">
                                                            <span><%= room.getName() %></span>
                                                            <div class="status">
                                                                <!-- dùng lệnh if -->
                                                                <span class="stt1">Trạng thái:<h6>Trống</h6></span>
                                                                <!-- <span class="stt2">Trạng thái:<h6>Đang thuê</h6></span>
                                                                <span class="stt3">Trạng thái:<h6>Đã cọc</h6></span> -->
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="room-title"  data-toggle="modal" data-target="#titleRoom">
                                                                <ul>
                                                                    <li>
                                                                        <h6>Người thuê:</h6>
                                                                        <span></span>
                                                                    </li>                                                        
                                                                    <li>
                                                                        <h6>Thông tin phòng:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h6>Dịch vụ sử dụng:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h6>Mô tả:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h5>Giá:</h5>
                                                                        <span>120,000&dstrok;</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mx-auto">
                                                            <button class="btn btn-primary" data-toggle="modal" data-target="#editRoom">
                                                                <span>Chỉnh Sửa</span> 
                                                            </button>

                                                            <!-- dùng if trạng thái phòng ở đây -->
                                                            <button class="btn btn-danger" data-toggle="modal" data-target="#deleteRoom">
                                                                <span>Xóa Phòng</span> 
                                                            </button>

                                                            <!-- nếu phòng đã được thuê hay đã cọc thì dùng câu dưới -->
                                                            <!-- <button class="btn btn-danger" data-toggle="modal" data-target="#deleteRoom">
                                                                <span>Hủy Phòng</span> 
                                                            </button> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }

                                                %>
                                            </div>
                                        </div>
                                        <%                                                    
                                                   }
                                                }
                                            }
                                        %>        
                                    </div>
                                    <!-- end tapnet -->
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <!-- add Home -->
        <div id="addHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm Nhà</h4>
                    </div>
                    <form action="#" >
                        <div class="modal-body container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-md-2 text-md-right"><span>Tỉnh:</span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name=" " class="form-control">
                                                    <option value="1">Sơn La</option>
                                                    <option value="2">Điện Biên</option>
                                                    <option value="3">Lai Châu</option>
                                                    <option value="4">Bắc Giang</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-md-right"><span>Huyện: </span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name=" " class="form-control">
                                                    <option value="1">Sơn La</option>
                                                    <option value="2">Điện Biên</option>
                                                    <option value="3">Lai Châu</option>
                                                    <option value="4">Bắc Giang</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>Địa chỉ: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Nhập địa chỉ..." required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="offset-md-2 col-md-8 upload-img">
                                            <div class="custom-file col-ms-4">
                                                <label for="file-input">
                                                    <i class="fas fa-upload"></i>&nbsp; Thêm ảnh phòng
                                                </label>
                                                <input type="file" id="file-input" accept="image/*" onchange="preview()" multiple>
                                                <p id="num-of-files">No file choose</p>
                                                <div id="images"></div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">Xác Nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- edit Home -->
        <div id="editHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Chỉnh sửa thông tin phòng</h4>
                    </div>
                    <form action="#" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12  ">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label text-sm-right">Mã Phòng</label>
                                        <div class="col-sm-6">
                                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="001">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nameRoom" class="col-sm-4 col-form-label text-sm-right">Tên Phòng</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" value="ABC" id="nameRoom" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="typeofRoom" class="col-sm-4 col-form-label text-sm-right">Kiểu Phòng</label>
                                        <div class="col-sm-6">
                                            <select name="#" id="typeofRoom" class="form-control">
                                                <option value="">Luxury</option>
                                                <option value="">Luxury</option>
                                                <option value="">Normal</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-4 col-form-label text-sm-right">Mô tả</label>
                                        <div class="col-sm-6">
                                            <textarea type="text" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">Xác nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- remove Home -->
        <div id="deleteHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xoá nhà</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="cancel" class="col-md-3 col-form-label text-md-right">Lý do xóa</label>
                                        <select class="form-control col-md-7" name="reason" id="">
                                            <option value="">Khách không nhận phòng</option>
                                            <option value="">Khách đổi phòng</option>
                                            <option value="">Khác</option>
                                        </select>
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Lý do khác</label>
                                        <textarea type="text" name="" placeholder="Viết lý do khác ở đây" 
                                                  required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" >Xác Nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- add new Room -->
        <div id="addRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm Phòng Mới</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Mã phòng</label>
                                        <input type="text" name="roomID" placeholder="Nhập Mã" required class="form-control col-md-7">
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Giá</label>
                                        <input type="text" name="price" placeholder="Giá" required class="form-control col-md-7">
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Mô tả</label>
                                        <textarea type="text" placeholder="Mô tả phòng..." required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button class="btn btn-success" type="submit" >Xác Nhận</button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- title   Room -->
        <div id="titleRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-xl" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Chi tiết Phòng</h4>
                    </div>
                    <div class="modal-body container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-5">
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Mã Phòng: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>004 </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Họ Tên Người Thuê: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>Lê Minh Quân</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Thời gian thuê: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>01/06/2022</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Hạn trả phòng: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>02/06/2022</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Dịch vụ: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <ul>
                                            <li>Ăn uống</li>
                                            <li>Cho thuê xe gắn máy</li>
                                            <li>Khác</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-7 text-lg-left">
                                <div id="lightgallery" class="row">
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>   
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>  
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#editRoom">Chỉnh sửa</button>
                        <button class="btn btn-danger" type="button" data-dismiss="modal">Thoát</button>
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
                    <form action="#" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-7">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label">Mã Phòng</label>
                                        <div class="col-sm-8">
                                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="001">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nameRoom" class="col-sm-4 col-form-label">Tên Phòng</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" value="ABC" id="nameRoom" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="typeofRoom" class="col-sm-4 col-form-label">Kiểu Phòng</label>
                                        <div class="col-sm-8">
                                            <select name="#" id="typeofRoom" class="form-control">
                                                <option value="">Luxury</option>
                                                <option value="">Normal</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-4 col-form-label">Mô tả</label>
                                        <div class="col-sm-8">
                                            <textarea type="text" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">Xác nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- remove Home -->
        <div id="deleteRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xoá Phòng</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="cancel" class="col-md-3 col-form-label text-md-right">Lý do xóa</label>
                                        <select class="form-control col-md-7" name="reason" id="">
                                            <option value="">Khách không nhận phòng</option>
                                            <option value="">Khách đổi phòng</option>
                                            <option value="">Khác</option>
                                        </select>
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Lý do khác</label>
                                        <textarea type="text" name="" placeholder="Viết lý do khác ở đây" required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" >Xác Nhận</button>
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
        <script src="https://unpkg.com/filepond-plugin-file-poster/dist/filepond-plugin-file-poster.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>
