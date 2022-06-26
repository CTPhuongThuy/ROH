

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link rel="shortcut icon" href="assets/img/logo2.png">
        <!-- CSS -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <!-- Data-Table -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="assets/css/owner-style.css">

        <link rel="stylesheet" href="assets/css/admin.css">
    </head>
    <body>
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
                        <li>
                            <a href="AdminListAccount">
                                <span><i class='bx bxs-user-rectangle'></i></span>
                                <span class="title">Quản lý tài khoản</span>
                            </a>
                        </li>
                        <li class="active">
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
                                Quản lý motel
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
                <div class="container-fluid">
                    <section>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div id="myTable_wrapper" class="dataTables_wrapper no-footer">
                                                <table id="myTable" class="table table-hover table-bordered dataTable no-footer" aria-describedby="myTable_info">
                                                    <thead>
                                                        <tr>
                                                            <th  class="sorting sorting_asc" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Mã motel: activate to sort column descending" style="width: 100.15px;">Mã motel</th>
                                                            <th  class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Hình ảnh: activate to sort column ascending" style="width: 100px;">Hình ảnh</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Tên: activate to sort column ascending" style="width: 150.3875px;">Tên motel</th>
                                                            <th>Hotline</th>
                                                            <th>Địa chỉ</th>
                                                            <th>Rating</th>
                                                            <th>Chủ trọ </th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Trạng thái: activate to sort column ascending" style="width: 90px;">Trạng thái</th>
                                                            <th  class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 90px;">Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:if test="${requestScope.ADMIN_LIST_MOTEL != null}">
                                                            <c:if test="${not empty requestScope.ADMIN_LIST_MOTEL}">
                                                                <c:forEach var="motel" varStatus="counter" items="${requestScope.ADMIN_LIST_MOTEL}">

                                                                <form action="MainController">
                                                                    <tr class="clickable-row odd" data-href="MotelManager?action=detail&motelID=${motel.motelID}" data-bs-toggle="tooltip" data-bs-placement="right" title="Nhấn để xem chi tiết">
                                                                        <td>${motel.motelID}</td>
                                                                        <td>
                                                                            <img src="${motel.image}">
                                                                        </td>
                                                                        <td>${motel.name}</td>
                                                                        <td>${motel.phone}</td>
                                                                        <td>${motel.address},${motel.district},${motel.city}</td>
                                                                        <td>${motel.rating}</td>
                                                                        <td>${motel.ownerName}</td>
                                                                        <td>
                                                                            <c:if test="${motel.status == 0}">
                                                                                <span class="badge badge-danger">Extended</span>
                                                                            </c:if> 
                                                                            <c:if test="${motel.status == 1}">
                                                                                <span class="badge badge-success">Activity</span>
                                                                            </c:if> 
                                                                        </td>
                                                                        <td>
                                                                            <div class="d-flex">
                                                                                <a href="MotelManager?action=detail&motelID=${motel.motelID}" class="btn btn-info m-b-xs shadow btn-xs sharp me-1 "><i class='bx bxs-pencil'></i></a>
                                                                                <a href="MotelManager?action=delete&motelID=${motel.motelID}" class="btn btn-danger shadow btn-xs sharp"><i class='bx bxs-trash-alt' ></i></a>
                                                                            </div>    
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach> 
                                                            </c:if>
                                                        </c:if>
                                                    </form>
                                                    </tbody>
                                                </table>
                                                ${requestScope.ERROR_MESSAGE}

                                            </div>
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
            <c:if test="${requestScope.MESSAGE != null}">
                <c:if test="${not empty requestScope.MESSAGE}">
                    <div class="alert alert-success alert-dismissible fade show" id="notif">
                        <i class='bx bx-message-alt-check p-1'></i>
                        <strong class="mr-1">${requestScope.MESSAGE}!</strong>

                        <button type="button" class="close h-100" data-dismiss="alert" aria-label="Close">
                            <span><i class='bx bx-x'></i></span>
                        </button>
                    </div>
                </c:if>
            </c:if>
        </div>

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>