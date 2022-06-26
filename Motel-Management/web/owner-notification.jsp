

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
                                <li data-toggle="tooltip"data-placement="right" title="Quản lý nhà">
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
                        <li class="active" data-toggle="tooltip"data-placement="right" title="Thông báo">
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
                                Thông báo
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

        <!-- Main Content -->
        <div class="main-content">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="email-left-box px-0 mb-3">
                                        <div class="p-0">
                                            <a href="#" class="btn btn-primary btn-block">Compose</a>     
                                        </div>
                                        <div class="mail-list mt-4">
                                            <a href="owner-notification.html" class="list-group-item active">
                                                <i class="fa fa-inbox font-18 align-middle mr-2"></i> Thông  
                                                <span class="badge badge-primary badge-sm float-right">198</span> 
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <i class="fa fa-star font-18 align-middle mr-2"></i>Important 
                                                <span class="badge badge-danger text-white badge-sm float-right">47</span>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
                                                Draft</a>
                                            <a href="#" class="list-group-item">
                                                <i class="fa fa-trash font-18 align-middle mr-2"></i>
                                                Trash</a>
                                        </div>

                                    </div>
                                    <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                        <div role="toolbar" class="toolbar ml-1 ml-sm-0">
                                            <div class="btn-group mb-1">
                                                <div class="custom-control custom-checkbox pl-2">
                                                    <input type="checkbox" class="custom-control-input" id="checkAll">
                                                    <label class="custom-control-label" for="checkAll"></label>
                                                </div>
                                            </div>
                                            <div class="btn-group mb-1">
                                                <button class="btn btn-primary light px-3" type="button"><i class="ti-reload"></i>
                                                </button>
                                            </div>
                                            <div class="btn-group mb-1">
                                                <button aria-expanded="false" data-toggle="dropdown" class="btn btn-primary px-3 light dropdown-toggle" type="button">More <span class="caret"></span>
                                                </button>
                                                <div class="dropdown-menu"> <a href="javascript: void(0);" class="dropdown-item">Mark as Unread</a> <a href="javascript: void(0);" class="dropdown-item">Add to Tasks</a>
                                                    <a href="javascript: void(0);" class="dropdown-item">Add Star</a> <a href="javascript: void(0);" class="dropdown-item">Mute</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="email-list mt-3">
                                            <div class="message">
                                                <div>
                                                    <div class="d-flex message-single">
                                                        <div class="pl-1 align-self-center">
                                                        </div>
                                                        <div class="ml-2">
                                                            <button class="border-0 bg-transparent align-middle p-0"><i class="fa fa-star" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <a href="email-read.html" class="col-mail col-mail-2">
                                                        <div class="subject">Ingredia Nutrisha, A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture</div>
                                                        <div class="date">11:49 am</div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="message">
                                                <div>
                                                    <div class="d-flex message-single">
                                                        <div class="pl-1 align-self-center">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="checkbox3">
                                                                <label class="custom-control-label" for="checkbox3"></label>
                                                            </div>
                                                        </div>
                                                        <div class="ml-2">
                                                            <button class="border-0 bg-transparent align-middle p-0"><i class="fa fa-star" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                    <a href="email-read.html" class="col-mail col-mail-2">
                                                        <div class="subject">Almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</div>
                                                        <div class="date">11:49 am</div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col-12 pl-3">
                                                <nav>
                                                    <ul class="pagination table table-striped table-bordered" id="myTable">
                                                        <li class="page-item page-indicator"><a class="page-link" href="javascript:void()"><i class="la la-angle-left"></i></a></li>
                                                        <li class="page-item "><a class="page-link" href="javascript:void()">1</a></li>
                                                        <li class="page-item active"><a class="page-link" href="javascript:void()">2</a></li>
                                                        <li class="page-item"><a class="page-link" href="javascript:void()">3</a></li>
                                                        <li class="page-item"><a class="page-link" href="javascript:void()">4</a></li>
                                                        <li class="page-item page-indicator"><a class="page-link" href="javascript:void()"><i class="la la-angle-right"></i></a></li>
                                                    </ul>
                                                </nav>
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
        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>