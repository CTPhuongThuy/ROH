

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.users.UserError"%>
<%@page import="sample.users.UserDTO"%>
<%@page import="sample.admin.DashboardDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Admin</title>
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
        <div class="sidebar">
            <div class="container">
                <div class="navigation">

                    <ul class="slide-menu">
                        <div class="logo">
                            <a href="AdminShowOverview">
                                <img class="logo" src="assets/img/logo2.png" alt="logo">
                            </a>
                        </div>
                        <li class="active">
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

        <!-- Main Content -->
        <%
            DashboardDTO dashboard = (DashboardDTO) request.getAttribute("DASHBOARD");
            if (dashboard == null) {
                dashboard = new DashboardDTO();
            }
        %>

        <div class="main-content">
            <div class="cardBox">
                <div class="card room">
                    <div class="inconBx">
                        <i class='bx bx-home-heart'></i>
                    </div>
                    <div>
                        <div class="number"><%= dashboard.getMotelNumber()%></div>
                        <div class="cardName">Số lượng motel</div>
                    </div>
                </div>
                <div class="card service">
                    <div class="inconBx">
                        <i class='bx bxs-user-rectangle'></i>
                    </div>
                    <div>
                        <div class="number"><%= dashboard.getUserNumber()%></div>
                        <div class="cardName">Tài khoản</div>
                    </div>
                </div>
                <div class="card feedback">
                    <div class="inconBx">
                        <i class='bx bx-user-circle'></i>
                    </div>
                    <div>
                        <div class="number"><%= dashboard.getOwnerNumber()%></div>
                        <div class="cardName">Chủ trọ</div>
                    </div>
                </div>
                <div class="card turnover">
                    <div class="inconBx">
                        <i class='bx bx-bell'></i>
                    </div>
                    <div>
                        <div class="number"><%= dashboard.getReportNumber()%></div>
                        <div class="cardName">Report</div>
                    </div>
                </div>
            </div>
<!-- chart -->
                        <section class="chartBox">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
<!--                                        <div class="card-header d-flex justify-content-between p-4">
                                            <h4>Doanh thu tuần</h4>
                                        </div>-->
                                        <div class="card-body" id="chart" >
                                           
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </section>
            <!-- order detail list -->
            <section class="chartBox">
                <div class="row">
                    <div class="col-lg-12 admin">
                        <div class="card border-0 d-flex">
                            <div class="card-header">
                                <h4>Top owner</h4>
                                <a href="#" class="btn-title">Xem tất cả</a>
                            </div>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr><th>STT</th>
                                            <th>Mã người dùng</th>
                                            <th>Hình ảnh</th>
                                            <th>Họ và tên</th>
                                            <th>SDT</th>
                                            <th>Income</th>
                                        </tr>
                                    </thead>

                                    <c:if test="${requestScope.TOP_INCOME != null}">
                                        <c:if test="${not empty requestScope.TOP_INCOME}">
                                            <tbody> 
                                                <c:forEach var="t" varStatus="counter" items="${requestScope.TOP_INCOME}">
                                                    <tr>
                                                        <th>${counter.count}</th>
                                                        <td>${t.userID}</td>
                                                        <td>
                                                            <img src="${t.status}">
                                                        </td>
                                                        <td>${t.userName}</td>
                                                        <td>${t.payType}</td>
                                                        <td>
                                                            <span class="price-format" data-price="${t.total}"></span>
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
            </section>

        </div>


 <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>


        <script>

            var options = {
                series: [{
                        name: "Desktops",
                        data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
                    }],
                chart: {
                    height: 350,
                    type: 'line',
                    zoom: {
                        enabled: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'straight'
                },
                title: {
                    text: 'Lượng truy cập tuần',
                    align: 'left'
                },
                grid: {
                    row: {
                        colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                        opacity: 0.5
                    },
                },
                xaxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
                }
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();

        </script>
        <!--        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script> -->
         <script src="assets/js/admin.js"></script>
        <script src="assets/js/owner-script.js"></script>
       
    </body>

</html>
