<%-- 
    Document   : admin-account
    Created on : Jun 6, 2022, 11:33:43 PM
    Author     : cao thi phuong thuy
--%>

<%@page import="sample.users.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin account</title>
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
                        <li>
                            <a href="AdminShowOverview">
                                <span><i class='bx bx-tachometer'></i></span>
                                <span class="title">T???ng quan</span>
                            </a>
                        </li> 
                        <li  class="active acc">
                            <a href="AdminListAccount">
                                <span><i class='bx bxs-user-rectangle'></i></span>
                                <span class="title">Qu???n l?? t??i kho???n</span>
                            </a>
                        </li>
                        <li >
                            <a href="MotelManager?action=all">
                                <span><i class='bx bx-home'></i></span>
                                <span class="title">Qu???n l?? Motel</span>
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
                                <span class="title">T??i kho???n</span>
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
                                Qu???n l?? t??i kho???n
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="btn-group me-1 mb-1">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${sessionScope.LOGIN_USER.fullName}
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="MainController?action=ShowProfile&userID=${sessionScope.LOGIN_USER.userId}&role=AD"><i class="bx bx-user"></i>T??i kho???n</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="MainController?action=Logout"><i class="bx bx-log-out-circle"></i>Tho??t</a>
                                    </div>
                                </div>  
                            </div>  
                        </div>   
                    </div>
                </div>
            </div>
        </div>
        <div class="main-content">
            <div class="main spacing">
                <div class="container-fluid">
                    <section>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="typeaccount"> 
                                            <form action="UserManager">
                                                <label for="seleaccount">Role:</label>
                                                <select id="seleaccount" name="role">
                                                    <option value="US">Ng?????i thu??</option>
                                                    <option value="OW">Ch??? tr???</option>
                                                    <option value="AD">Admin</option>
                                                </select>
                                                <button class="btn btn-info m-b-xs shadow btn-xs" type="submit" name="action" value="filter"><i
                                                        class='bx bx-search'></i>
                                                </button>
                                            </form>
                                        </div>
                                        <div class="table-responsive">
                                            <div id="myTable_wrapper" class="dataTables_wrapper no-footer">
                                                <table id="myTable" class="table table-hover table-bordered dataTable no-footer" aria-describedby="myTable_info">     
                                                    <thead>
                                                        <tr>
                                                            <th class="sorting sorting_asc" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="M?? ?????t Ph??ng: activate to sort column descending" style="width: 80.15px;">ID</th>

                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="M?? Motel: activate to sort column ascending" style="width: 100px;">H??nh ???nh</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="M?? Ph??ng: activate to sort column ascending" style="width: 100.3875px;">H??? & T??n</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Tr???ng Th??i: activate to sort column ascending" >SDT </th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="S??? D???ch V???: activate to sort column ascending"style="width: 50.3875px;">Gmail</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="PT Thanh To??n: activate to sort column ascending" style="width: 450.025px;">?????a ch???</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Ng??y Nh???n Ph??ng: activate to sort column ascending"style="width: 150.3875px;">Role</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="Ng??y Nh???n Ph??ng: activate to sort column ascending">Tr???ng th??i</th>
                                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1" aria-label="T???ng Ti???n: activate to sort column ascending" style="width: 90px;">Action</th>
                                                        </tr>
                                                    </thead>

                                                    <c:if test="${requestScope.LIST_ACC != null}">
                                                        <c:if test="${not empty requestScope.LIST_ACC}">
                                                            <tbody>
                                                                <c:forEach var="o" varStatus="counter" items="${requestScope.LIST_ACC}">
                                                                    <tr class="clickable-row odd" data-href="UserManager?action=detail&role=${o.role}&userId=${o.userId}" data-bs-toggle="tooltip" data-bs-placement="right" title="Nh???n ????? xem chi ti???t">
                                                                        <td class="sorting_1">${o.userId}</td>
                                                                        <td><img src="${o.image}"></td>
                                                                        <td>${o.fullName}</td>
                                                                        <td>${o.phone}</td>
                                                                        <td>${o.gmail}</td>
                                                                        <td>${o.address}</td>
                                                                        <td><span class="role fs-16 font-w500 text-end d-block">
                                                                                <c:if test="${o.role.equals('US')}">
                                                                                    Kh??ch
                                                                                </c:if> 
                                                                                <c:if test="${o.role.equals('OW')}">
                                                                                    Ch??? thu??
                                                                                </c:if> 
                                                                                <c:if test="${o.role.equals('AD')}">
                                                                                    Admin
                                                                                </c:if> 
                                                                            </span></td>
                                                                        <td><c:if test="${o.status == 0}">
                                                                                <span class="badge badge-danger">Extended</span>
                                                                            </c:if> 
                                                                            <c:if test="${o.status == 1}">
                                                                                <span class="badge badge-success">Activity</span>
                                                                            </c:if> </td>
                                                                        <td>
                                                                            <div class="d-flex">
                                                                                <a href="UserManager?action=detail&role=${o.role}&userId=${o.userId}" class="btn btn-info m-b-xs  shadow btn-xs sharp"><i class='bx bxs-user-detail'></i></a>

                                                                                <a href="UserManager?action=delete&role=${o.role}&userId=${o.userId}" class="btn btn-danger shadow btn-xs sharp me-1"><i class='bx bxs-trash'></i></a>
                                                                            </div>  

                                                                        </td>

                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </c:if>
                                                    </c:if>
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