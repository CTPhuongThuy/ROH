<%-- 
    Document   : owner-motel
    Created on : Jun 15, 2022, 2:30:12 AM
    Author     : Bao
--%>

<%@page import="sample.users.UserDTO"%>
<%@page import="sample.address.districtDTO"%>
<%@page import="sample.address.cityDTO"%>
<%@page import="sample.motel.MotelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
                                <li class="active" data-toggle="tooltip"data-placement="right" title="Quản lý nhà">
                                    <a href="MainController?action=ownerShowMotel" li class="dropdown-item">
                                        <i class='bx bx-home-alt-2'></i>
                                        <span class="title">Nhà nghỉ</span>
                                    </a> 
                                </li>
                                <li data-toggle="tooltip"data-placement="right" title="Quản lý phòng">
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
                                Quản Lý Nhà
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
                        <div class="offset-sm-6 col-sm-6 d-flex justify-content-sm-end p-md-0 mt-sm-0">
                            <ol class="breadcrumb">
                                <li class="breadcrumd-item">
                                    <a href="#">Quản lý</a>
                                </li>
                                <li class="breadcrumd-item">
                                    <span>/</span>
                                </li>
                                <li class="breadcrumd-item active">
                                    <a href="owner-motel.html">Nhà</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="origation">
                        <div class="project-nav">
                            <div class="card-action card-tabs mr-auto">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addHome"><i class='bx bx-plus-medical mr-2'></i>Thêm Nhà</button>
                            </div>
                            <% String message = (String) request.getAttribute("MESSAGE");
                                if (message == null) {
                                    message = "";
                                }
                            %>
                            <%= message%>
                        </div>
                        <div class="row">
                            <!-- vòng lặp in home -->                          
                            <%
                                List<MotelDTO> listMotel = (ArrayList<MotelDTO>) request.getAttribute("LIST_MOTEL");
                                if (listMotel != null) {
                                    if (listMotel.size() > 0) {
                                        for (MotelDTO motel : listMotel) {

                            %>
                            <div class="col-xl-6 col-lg-12">
                                <div class="card home-card">
                                    <div class="card-body">
                                        <div class="d-flex mb-4 align-items-start">
                                            <div class="home-img mr-3">
                                                <img src="<%= motel.getImage()%>" alt class="img-fluid">
                                            </div>
                                            <div class="mr-auto">
                                                <p class="text mb-1">home ID: <%= motel.getMotelID()%></p>
                                                <h5 class="title mb-2"><%= motel.getName()%></h5>
                                                <span class="address-home">Địa chỉ: <%= motel.getAddress()%>, <%= motel.getDistrict()%>, <%= motel.getCity()%></span>
                                            </div>
                                            <span class="badge badge-success d-sm-inline-block d-none mr-2">Trạng thái</span>
                                            <div class="d-flex ml-2 p-1">
                                                <div class="dropdown">
                                                    <button class="btn" type="button" id="edit-dele" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class='bx bx-dots-vertical-rounded'></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="edit-dele">
                                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#editHome<%= motel.getMotelID() %>"><i class='bx bx-edit'></i>Chỉnh sửa</a>


                                                        <!-- remove Home -->
                                                        <form action="MainController" method="POST">
                                                            <input type="hidden" name="motelID" value="<%= motel.getMotelID()%>"> 
                                                            <button name="action" value="deleteMotel" type="submit" class="dropdown-item" onclick="if (!confirm('Are you sure?')) {
                                                                        return false
                                                                    }">
                                                                <a><i class='bx bx-recycle'></i>Xóa nhà</a>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="mb-4 decp">
                                            <%= motel.getDesct()%>
                                        </p>
                                        <div class="d-flex flex-wrap align-items-center">
                                            <div class="mr-auto mb-4">
                                                <p class="mb-2 text-black"><i class='bx bx-book-alt'></i>Thông tin</p>
                                                <div class="info-title ml-3">
                                                    SĐT:
                                                    <span class="ml-2"><%= motel.getPhone()%></span>
                                                </div>
                                                <div class="info-title ml-3">
                                                    Tổng Loại Phòng: 
                                                    <span class="ml-2"><%= motel.getNumberRoomType()%></span>
                                                </div>
                                                <div class="info-title ml-3">
                                                    Tổng Phòng:
                                                    <span class="ml-2"><%= motel.getNumberRoom()%></span>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center mb-4">
                                                <div class="text-center mr-3 turnover">
                                                    <span>Tổng doanh thu</span>
                                                    <p class="mb-0 pt-1 text-black">$<%= motel.getMotelprice()%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%            }
                                    }
                                }
                            %> 
                        </div>  
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
                    <form action="MainController" method="post" enctype="multipart/form-data" >
                        <div class="modal-body container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-md-2 text-md-right"><span>Tỉnh:</span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name="cityID" class="form-control" id="sel1" onchange="giveSelection(this.value)">
                                                    <%
                                                        List<cityDTO> listCity = (ArrayList<cityDTO>) request.getAttribute("LIST_CITY");
                                                        if (listCity != null) {
                                                            if (listCity.size() > 0) {
                                                                for (cityDTO city : listCity) {

                                                    %>
                                                    <option value="<%= city.getCityID()%>"><%= city.getCityName()%></option>
                                                    <% <%            }
                                                            }
                                                        }
                                                    %>            }
                                                            }
                                                        }
                                                    %> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-md-right"><span>Huyện: </span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name="districtID" class="form-control" id="sel2">
                                                    <%
                                                        List<districtDTO> listDistrict = (ArrayList<districtDTO>) request.getAttribute("LIST_DISTRICT");
                                                        if (listDistrict != null) {
                                                            if (listDistrict.size() > 0) {
                                                                for (districtDTO district : listDistrict) {

                                                    %> 
                                                    <option value="<%= district.getDistrictID()%>"><%= district.getDistrictName()%></option>
                                                    <%            }
                                                            }
                                                        }
                                                    %> 
                                                </select>
                                            </div>
                                        </div>
                                    </div>                              
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>Tên Phòng Motel: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input name="motelName" type="tel" class="form-control" placeholder="Nhập tên..." required>
                                                <input name="ownerID" value="<%= loginUser.getUserId()%>" type="hidden" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>Điện thoại: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input name="phone" type="tel" class="form-control" placeholder="Nhập số điện thoại..." required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>Địa chỉ: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input name="address" type="text" class="form-control" placeholder="Nhập địa chỉ..." required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>Mô Tả: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input name="desct" type="text" class="form-control" placeholder="Nhập mô tả..." >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="offset-md-2 col-md-8 upload-img">
                                            <div class="custom-file col-ms-4">
                                                <label for="file-input">
                                                    <i class="fas fa-upload"></i>&nbsp; Thêm ảnh phòng
                                                </label>
                                                <input name="photo" type="file" id="file-input" style="display: none" accept="image/*" onchange="preview()" multiple>
                                                <p id="num-of-files">No file choose</p>
                                                <div id="images"></div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" name="action" value="createMotel" type="submit">Xác Nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (listMotel != null) {
                if (listMotel.size() > 0) {
                    for (MotelDTO motel : listMotel) {

        %>      
        <!-- edit Home -->
        <div id="editHome<%= motel.getMotelID() %>" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Chỉnh sửa thông tin Nhà</h4>
                    </div>
                    <form action="MainController" method="post" enctype="multipart/form-data" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="idhome" class="col-md-3 col-form-label text-md-right">Mã nhà:</label>
                                        <input type="text" name="motelID" id="idhome" value="<%= motel.getMotelID()%>" class="form-control col-md-6" readonly/>
                                    </div>
                                    <div class="row form-group">
                                        <label for="namehome" class="col-md-3 col-form-label text-md-right">Tên Nhà:</label>
                                        <input class="form-control col-md-6" name="motelName" value="<%= motel.getName()%>" required>       
                                    </div>
                                    <div class="row form-group">
                                        <label for="phone" class="col-md-3 col-form-label text-md-right">Số điện thoại:</label>
                                        <input class="form-control col-md-6" name="phone" value="<%= motel.getPhone()%>" required>       
                                    </div>
                                    <div class="row form-group">
                                        <label for="namehome" class="col-md-3 col-form-label text-md-right">địa chỉ:</label>
                                        <input class="form-control col-md-6" name="address" value="<%= motel.getAddress()%>" required>       
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3 col-form-label text-md-right"><span>Tỉnh:</span></div>
                                        <select name="cityID" class="form-control col-md-6" id="sel1" onchange="giveSelection(this.value)">
                                            <%
                                                if (listCity != null) {
                                                    if (listCity.size() > 0) {
                                                        for (cityDTO city : listCity) {

                                            %>
                                            <option value="<%= city.getCityID()%>"><%= city.getCityName()%></option>
                                            <%            }
                                                    }
                                                }
                                            %> 
                                        </select>                       
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3 col-form-label text-md-right"><span>Huyện:</span></div>
                                        <select name="districtID" class="form-control col-md-6" id="sel2">

                                            <%
                                                if (listDistrict != null) {
                                                    if (listDistrict.size() > 0) {
                                                        for (districtDTO district : listDistrict) {
                                                            if (motel.getDistrict().equals(district.getDistrictName())) {
                                            %> 
                                            <option value="<%= district.getDistrictID()%>" selected="selected"><%= district.getDistrictName()%></option>
                                            <%} else {%>
                                            <option value="<%= district.getDistrictID()%>"><%= district.getDistrictName()%></option>
                                            <%            }
                                                        }
                                                    }
                                                }
                                            %>  
                                        </select>                       
                                    </div>
                                    <div class="row form-group">
                                        <label for="namehome" class="col-md-3 col-form-label text-md-right">Mô Tả:</label>
                                        <input class="form-control col-md-6" name="desct" value="<%= motel.getDesct()%>" required>       
                                    </div>
                                    <input type="file" name="photo" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" name="action" value="updateMotel" >Xác nhận</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%            }
                }
            }
        %>                             



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
