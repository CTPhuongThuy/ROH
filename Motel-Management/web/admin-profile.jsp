

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.users.UserError"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
    </head>

    <body>
        <!-- sidebar -->
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRole().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }

            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
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
                        <li>
                            <a href="AdminListAccount">
                                <span><i class='bx bxs-user-rectangle'></i></span>
                                <span class="title">Quản lý Tai Khoan</span>
                            </a>
                        </li>
                        <li>
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
                        <li class="active">
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
                                Tài khoản
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="btn-group me-1 mb-1">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.LOGIN_USER.fullName}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="MainController?action=ShowProfile&userID=${sessionScope.LOGIN_USER.userId}&role=AD"><i class="bx bx-user"></i>Tài khoản</a>
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

        <!-- End header -->

        <div class="main-content">
            <div id="accordion">
                <!-- Thông tin cá nhân -->
                <div class="card mx-5 mb-2">
                    <div class="card-header card-setting" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                    aria-expanded="true" aria-controls="collapseOne">
                                Hồ sơ của tôi <i class='bx bx-chevron-right'></i>
                            </button>
                        </h5>
                    </div>
                    <%
                        UserDTO userProfile = (UserDTO) request.getAttribute("USER_PROFILE");
                        if (userProfile == null) {
                            userProfile = new UserDTO();
                        }
                        String gender = "";
                        if (userProfile.getGender() == 1) {
                            gender = "Nữ";
                        } else {
                            gender = "Nam";
                        }
                    %>
                    <div class="collapse show" id="collapseOne" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <div class="user-profile">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="profile-pic">
                                            <img src="<%= userProfile.getImage()%>" width="200"/>
                                            <div class="upload">
                                                <button class="btn btn-warning" data-toggle="modal" data-target="#uploadImg">Chi Tiết</button>                                                   
                                                <i class='bx bxs-camera-plus'></i>
                                            </div>
                                        </div>
                                        <div class="profile-name"> ${sessionScope.LOGIN_USER.fullName}</div>
                                    </div>
                                    <div class="col-lg-8">                                
                                        <div class="profile-content">
                                            <div class="contact-infor">
                                                <div class="info-title">
                                                    <h4>Thông tin cá nhân</h4>
                                                </div>
                                                <%
                                                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                                    if (userError == null) {
                                                        userError = new UserError();
                                                    }
                                                %>
                                                <div class="info-content">
                                                    <form action="MainController" method="post" class="form-check">
                                                        <div class="row phone-content">
                                                            <input type="hidden" name="role" value="<%= loginUser.getRole()%>" />
                                                        </div>
                                                        <div class="row phone-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">UserID:</label>
                                                            <input type="text" name="userID" value="<%= userProfile.getUserId()%>" class="form-control col-md-6 col-sm-8 mt-2" readonly="">                                 
                                                        </div>
                                                        <div class="row phone-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Họ và Tên:</label>
                                                            <input type="text" name="name" value="<%= userProfile.getFullName()%>" class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getFullNameError()%></span>
                                                        </div>
                                                        <div class="row phone-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">CMND/CCCD:</label>
                                                            <input type="text" name="citizenNumber" value="<%= userProfile.getCitizenNumber()%>" class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getCitizenNumberError()%></span>
                                                        </div>
                                                        <div class="row phone-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Số điện thoại:</label>
                                                            <input type="tel" name="phone" value="<%= userProfile.getPhone()%>" class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getPhoneError()%></span>
                                                        </div>
                                                        <div class="row address-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Địa chỉ nhà:</label>
                                                            <input type="text" name="address" value="<%= userProfile.getAddress()%>" class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getAddressError()%></span>
                                                        </div>
                                                        <div class="row email-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Email:</label>
                                                            <input type="email" name="gmail" value="<%= userProfile.getGmail()%>"  class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getGmailError()%></span>
                                                        </div>
                                                        <div class="row birthday-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Ngày/Tháng/Năm:</label>
                                                            <input type="date" max="2022-01-01" min="1940-01-01" name="birthDay" value="<%= userProfile.getDateOfBirth()%>" class="form-control col-md-6 col-sm-8 mt-2">
                                                            <span class="error-message col-md-2 mt-3"><%= userError.getBirthDayError()%></span>
                                                        </div>
                                                        <div class="row gender-content">
                                                            <label class="contact-title col-md-4 col-sm-4 mt-3">Giới tính:</label>
                                                            <select name="gender" class="form-control col-md-6 col-sm-8 mt-2">
                                                                <option value="<%=userProfile.getGender()%>"><%= gender%></option>
                                                                <option value="0">Nam</option>
                                                                <option value="1">Nữ</option>

                                                            </select>
                                                        </div>
                                                        <div class="row pt-3 d-flex">
                                                            <button type="submit" name="action" value="updateOwner" class="offset-3 btn btn-success">Xác nhận</button>
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
                <!--Change password -->
                <div class="card mx-5 mb-2">
                    <div class="card-header card-setting" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo">
                                Thay đổi mật khẩu <i class='bx bx-chevron-right'></i>
                            </button>
                        </h5>
                    </div>
                    <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            <div class="card-group d-block">
                                <form action="MainController" method="post">
                                    <div class="row form-group">
                                        <input class="col-md-3 col-sm-5 form-control" type="hidden" name="userID" value="<%= loginUser.getUserId()%>" required>
                                        <input class="col-md-3 col-sm-5 form-control" type="hidden" name="role" value="<%= loginUser.getRole()%>" required>
                                    </div>
                                    <div class="row form-group">
                                        <label class="offset-md-3 col-md-2 col-sm-3 col-form-label">Mật khẩu cũ:</label> 
                                        <input class="col-md-3 col-sm-5 form-control" type="password" name="oldpassword" required>
                                        <span class="error-message col-sm-3 mt-2"><%= userError.getPasswordError()%></span>
                                    </div>
                                    <div class="row form-group">
                                        <label class="offset-md-3 col-md-2 col-sm-3 col-form-label">Mật khẩu mới:</label>
                                        <input class="col-md-3 col-sm-5 form-control" type="password" name="newpassword" id="password" required>
                                        <span class="error-message col-sm-3 mt-2"><%= error%></span>
                                    </div>
                                    <div class="row form-group">
                                        <label class="offset-md-3 col-md-2 col-sm-3 col-form-label">Xác nhận:</label>
                                        <input class="col-md-3 col-sm-5 form-control" type="password" name="confirmpassword" id="confirm" required>
                                        <span class="error-message col-sm-3 mt-2"><%= userError.getConfirmpasswordError()%></span>
                                    </div>
                                    <div class="row form-group justify-content-center">
                                        <button type="submit" name="action" value="ChangePassword" class="btn btn-success">Thay đổi</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                        <c:if test="${requestScope.SUCCESS != null}">
                <c:if test="${not empty requestScope.SUCCESS}">
                    <div class="alert alert-success alert-dismissible fade show" id="notif">
                        <i class='bx bx-message-alt-check p-1'></i>
                        <strong class="mr-1">${requestScope.SUCCESS}!</strong>

                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close">
                            <span><i class='bx bx-x'></i></span>
                        </button>
                    </div>
                </c:if>
            </c:if>
        </div>

        <!-- edit Home -->
        <div id="uploadImg" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Thay ảnh</h4>
                    </div>
                    <form action="MainController" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <label class="custom-control-label d-flex">
                                <input type="hidden" name="action" value="ChangeImage">
                                <input type="hidden" name="userID" value=<%= loginUser.getUserId()%>>
                                <input type="hidden" name="role" value="<%= loginUser.getRole()%>">
                                <input type="file" name="photo" class="custom-file" accept=".jpg, .png">   
                            </label>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">Xác nhận</button>
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
        <script src="assets/js/owner-script.js"></script>
    </body>

</html>