<%-- 
    Document   : owner-index
    Created on : Jun 2, 2022, 11:43:38 PM
    Author     : Bao
--%>

<%@page import="sample.owner.FeedbackDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.owner.NewsDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.owner.OverviewDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Home On Road</title>
        <link rel="shortcut icon" href="assets/img/logo2.png">
        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/owner-style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
    </head>
    <body>
        <!-- sidebar -->
        <div class="sidebar">
            <div class="container">
                <div class="navigation">  
                    <ul class="slide-menu">
                        <div class="logo">
                            <a href="owner-index.jsp">
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
                        <li class="active" class="active" data-toggle="tooltip"data-placement="right" title="Tổng quan">
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
                                    <a href="MainController?action=showService" li class="dropdown-item">
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
                                Trang Chủ
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="btn-group me-1 mb-1">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Lê Minh Quân
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="MainController?action=ShowProfile&userID=<%=loginUser.getUserId()%>&role=<%=loginUser.getRole()%>"><i class='bx bx-user'></i>Tài khoản</a>
                                        <a class="dropdown-item" href="owner-notification.html"><i class='bx bx-bell'></i>Thông báo</a>
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

        <!-- Main Content -->
        <div class="main-content"> 
            <!-- num of data -->
            <%
                OverviewDTO overview = (OverviewDTO) request.getAttribute("OVERVIEW");
                if (overview == null) {
                    overview = new OverviewDTO();
                }
            %>
            <div class="cardBox">
                <div class="card room">
                    <div class="inconBx">
                        <i class='bx bx-home-heart'></i>
                    </div>
                    <div>
                        <div class="number"><%= overview.getRoomNumber()%></div>
                        <div class="cardName">Số lượng phòng</div>
                    </div>
                </div>
                <div class="card service">
                    <div class="inconBx">
                        <i class='bx bx-detail'></i>
                    </div>
                    <div>
                        <div class="number"><%= overview.getServiceNumber()%></div>
                        <div class="cardName">Số lượng dịch vụ</div>
                    </div>
                </div>
                <div class="card feedback">
                    <div class="inconBx">
                        <i class='bx bx-conversation'></i>
                    </div>
                    <div>
                        <div class="number"><%= overview.getFeedbackNumber()%></div>
                        <div class="cardName">Nhận xét</div>
                    </div>
                </div>
                <div class="card turnover">
                    <div class="inconBx">
                        <i class='bx bx-money'></i>
                    </div>
                    <div>
                        <div class="number">&#8363;<%= overview.getIncomeNumber()%></div>
                        <div class="cardName">Tổng doanh thu</div>
                    </div>
                </div>
            </div>
            <!-- chart -->
            <section class="chartBox">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <canvas id="chart-Dashboard" width="300" height="100"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- order detail list -->
            <div class="details">       

                <!-- New Info -->
                <div class="cardInfo">
                    <div class="card border-0 d-flex">
                        <div class="card-header">
                            <h4>Thông báo mới</h4>
                            <a href="#" class="btn-title">Xem tất cả</a>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead >
                                    <tr>
                                        <th>Họ và tên</th>
                                        <th>Giá (&#8363;)</th>
                                        <th>Phòng</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<NewsDTO> listNews = (ArrayList<NewsDTO>) request.getAttribute("LIST_NEWS");
                                        if (listNews != null) {
                                            if (listNews.size() > 0) {
                                                for (NewsDTO news : listNews) {
                                                    String status = "";
                                                    String clas = "";
                                                    if (news.getStatus() == null) {
                                                        clas = "destroy";
                                                        status = "Hủy Phòng";
                                                    } else if (news.getStatus().equals("1")) {
                                                        clas = "outcome";
                                                        status = "Đã Thanh Toán";
                                                    } else {
                                                        clas = "demise";
                                                        status = "Đang Thuê";
                                                    }
                                    %>
                                    <tr>
                                        <td><%= news.getUserID()%></td>
                                        <td><%= news.getPrice()%></td>
                                        <td><%= news.getRoomName()%></td>
                                        <td><div class="<%= clas%>"><%= status%></div></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>                                            
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <!-- Rating -->
                <div class="cardFB">
                    <div class="card border-0 d-flex">
                        <div class="card-header">
                            <h4>Đánh Giá</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover table-borderless">
                                <thead >
                                    <tr>
                                        <th></th>
                                        <th>Tên</th>
                                        <th>Số sao</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<FeedbackDTO> listFeedback = (ArrayList<FeedbackDTO>) request.getAttribute("LIST_FEEDBACK");
                                        if (listFeedback != null) {
                                            if (listFeedback.size() > 0) {
                                                for (FeedbackDTO feedback : listFeedback) {
                                    %>
                                    <tr>
                                        <td><div class="imgBx"><img src="<%= feedback.getImage()%>" alt=""></div></td>
                                        <td><%= feedback.getUserName()%></td>
                                        <td>
                                            <% for (int i = 1; i <= feedback.getRating(); i++) { %>
                                            <i class='bx bxs-star yellow'></i>
                                            <% }%>
                                            <% if (5-feedback.getRating() > 0) {
                                                    for (int y = 1; y < 5 - feedback.getRating(); y++){
                                            %>
                                            <i class='bx bx-star'></i>
                                            <%
                                                    }
                                                }
                                            %>                                          
                                        </td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    <tr>
                                        <td><div class="imgBx"><img src="assets/img/avatar.jpg" alt=""></div></td>
                                        <td>Tran Ngoc Hai</td>
                                        <td>
                                            <i class='bx bx-star'></i>
                                            <i class='bx bx-star'></i>
                                            <i class='bx bxs-star yellow'></i>
                                            <i class='bx bxs-star yellow'></i>
                                            <i class='bx bxs-star yellow'></i>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>Total</td>
                                        <td></td>
                                        <td>4/5<i class='bx bxs-star yellow'></i></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div> 
                </div>

            </div>
        </div>


        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>