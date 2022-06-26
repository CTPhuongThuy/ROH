<%-- 
    Document   : admin-owner-info
    Created on : Jun 9, 2022, 8:28:16 PM
    Author     : cao thi phuong thuy
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/owner-style.css">

        <link rel="stylesheet" href="assets/css/admin.css">
    </head>
    <body>
        <!-- sidebar -->
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRole().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }

        %>
        <!-- sidebar -->
        <div class="sidebar">
            <div class="container">
                <div class="navigation">

                    <ul class="slide-menu">
                        <div class="logo">
                            <a href="AdminShowOverview">
                                <img class="logo" src="assets/img/logo2.png" alt="logo">
                            </a>
                        </div>
                        <li >
                            <a href="AdminShowOverview">
                                <span><i class='bx bx-tachometer'></i></span>
                                <span class="title">Tổng quan</span>
                            </a>
                        </li> 
                        <li class="active">
                            <a href="AdminListAccount">
                                <span><i class='bx bxs-user-rectangle'></i></span>
                                <span class="title">Quản lý tài khoản</span>
                            </a>
                        </li>
                        <li >
                            <a href="MotelManager?action=all">
                                <span><i class='bx bx-home'></i></span>
                                <span class="title">Quản lý Motel</span>
                            </a>
                        </li>
                        <li>
                            <a href="AdminReportManager">
                                <span><i class='bx bx-bell'></i></span>
                                <span class="title">Report</span>
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

        <div class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="toggle float-left">
                            <i class="bx bx-menu"></i>
                        </div>
                        <div class="float-left">
                            <div class="dashboard_bar d-flex">
                                Thông tin chi tiết
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="btn-group me-1 mb-1">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.LOGIN_USER.fullName}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="MainController?action=ShowProfile&userId=<%=loginUser.getUserId()%>&role=<%=loginUser.getRole()%>"><i class="bx bx-user"></i>Tài khoản</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="MainController?action=Logout"><i class="bx bx-log-out-circle"></i>Thoát</a>
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

                <div class="container row justify-content-md-center">
                    <div class="col-12 ">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Thông tin chi tiết</h5>
                                <div class="alert alert-info" role="alert">
                                    Mọi thông tin đều được bảo mật 100%.
                                </div>
                                <c:if test="${requestScope.INFO != null}">
                                    <c:if test="${not empty requestScope.INFO}">

                                        <c:forEach var="o" varStatus="counter" items="${requestScope.INFO}">
                                            <div class="row">
                                            <div class="row col-4">
                                                <div class="mb-3 col-md-12 form-group mx-auto">
                                                    <img name="image" src="${o.image}" style="width:300px; height: auto ; text-align: center">
                                                </div>
                                            </div>
                                            <div class="row col-8">
                                                
                                                <div class="mb-3 col-md-6">
                                                    <label for="userId" class="form-label">Tên đăng nhập</label>
                                                    <input type="text" class="form-control" name="userId" value="${o.userId}" readonly=""  style="display: none">
                                                    <p>${o.userId}</p>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="fullName" class="form-label">Họ và Tên  <span class="text-danger">*</span></label>
                                                    <p>${o.fullName}</p>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="birthDay" class="form-label">Ngày sinh <span class="text-danger">*</span></label>
                                                    <p>${o.dateOfBirth}</p>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="gender" class="form-label">Giới tính <span class="text-danger">*</span></label>

                                                    <c:if test="${o.gender == 0}">
                                                       <p> <span class="badge badge-info">Male</span></p>
                                                    </c:if> 
                                                    <c:if test="${o.gender == 1}">
                                                        <p><span class="badge badge-info">Female</span></p>
                                                    </c:if> 
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="phone" class="form-label">SDT  <span class="text-danger">*</span></label>
                                                    <p>${o.phone}</p>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="citizenNumber" class="form-label">CMND/CCCD <span class="text-danger">*</span></label>
                                                    <p>${o.citizenNumber}</p>

                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="gmail" class="form-label">Email <span class="text-danger">*</span></label>
                                                    <p>${o.gmail}</p>
                                                </div>

                                                <div class="mb-3 col-md-6">
                                                    <label for="address" class="form-label">Địa chỉ</label>
                                                    <p>${o.address}</p>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="role" class="form-label">Quyền <span class="text-danger">*</span></label>

                                                    <c:if test="${o.role.equals('US')}">
                                                        <p><span class="badge badge-danger">Người thuê</span></p>
                                                    </c:if> 
                                                    <c:if test="${o.role.equals('OW')}">
                                                       <p> <span class="badge badge-success">Chủ thuê</span></p>
                                                    </c:if> 
                                                    <c:if test="${o.role.equals('AD')}">
                                                        <p><span class="badge badge-success">Admin</span></p>
                                                    </c:if> 
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="status" class="form-label">Trạng thái <span class="text-danger">*</span></label>
                                                    <c:if test="${o.status == 0}">
                                                       <p> <span class="badge badge-danger">Extended</span></p>
                                                    </c:if> 
                                                    <c:if test="${o.status == 1}">
                                                        <p><span class="badge badge-success">Activity</span></p>
                                                    </c:if> 
                                                </div>
                                                <div class="form-group mx-auto">
                                                    <button class="btn btn-danger" data-toggle="modal" data-target="#removeRoom">
                                                        <span>Xóa tài khoản</span> 
                                                    </button> 
                                                    
                                                </div>
                                                <div id="removeRoom" class="modal fade" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered" role="content">

                                                        <form action="UserManager">
                                                            <div class="modal-content">
                                                                <div class="card-body">
                                                                    <div class="del-title">
                                                                        <i class='bx bx-error-circle'></i>
                                                                        <h2>Bạn muốn xóa tài khoản?</h2> 
                                                                        <input type="text" class="form-control" name="userId" value="${o.userId}" readonly=""  style="display: none">
                                                                    </div>
                                                                    <div class="del-submit d-flex justify-content-center">
                                                                        <button class="btn btn-success"  type="submit" value="delete" name="action">Xác Nhận</button>
                                                                        <button class="btn btn-danger" type="button" data-dismiss="modal">Hủy</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </c:if>

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
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>
