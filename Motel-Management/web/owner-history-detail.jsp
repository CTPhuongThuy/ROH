<%-- 
    Document   : owner-history-detail
    Created on : Jun 15, 2022, 2:19:05 AM
    Author     : Bao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.service.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.owner.HistoryDTO"%>
<%@page import="sample.owner.FeedbackDTO"%>
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
        <!--Boxicons-->
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <!-- Data-Table -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    </head>
    <body>


        <div id="main-wrapper">
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
                            <li data-toggle="tooltip"data-placement="right" title="T???ng quan">
                                <a href="MainController?action=ShowOverview">
                                    <span><i class='bx bx-tachometer'></i></span>
                                    <span class="title">T???ng quan</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    <i class='bx bx-bookmarks'></i>
                                    <span class="title">Qu???n l??</span>
                                    <i class='bx bxs-chevron-down drop'></i>
                                </a>
                                <ul class="collapse sub-menu" id="collapseOne">
                                    <li data-toggle="tooltip"data-placement="right" title="Qu???n l?? nh??">
                                        <a href="MainController?action=ownerShowMotel" li class="dropdown-item">
                                            <i class='bx bx-home-alt-2'></i>
                                            <span class="title">Nh?? ngh???</span>
                                        </a> 
                                    </li>
                                    <li class="active" data-toggle="tooltip"data-placement="right" title="Qu???n l?? ph??ng">
                                        <a href="MainController?action=ShowRoom&ownerID=<%=loginUser.getUserId()%>" li class="dropdown-item">
                                            <i class='bx bx-calendar-edit'></i>
                                            <span class="title">Ph??ng</span>
                                        </a>
                                    </li> 
                                    <li data-toggle="tooltip"data-placement="right" title="Qu???n l?? d???ch v???">
                                        <a href="owner-service.jsp" li class="dropdown-item">
                                            <i class='bx bx-cloud-rain'></i>
                                            <span class="title">D???ch v???</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="L???ch s???">
                                <a href="MainController?action=ShowHistory">
                                    <span><i class='bx bx-history'></i></span>
                                    <span class="title">L???ch s??? thu?? ph??ng</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Th??ng b??o">
                                <a href="owner-notification.jsp">
                                    <span><i class='bx bx-bell'></i></span>
                                    <span class="title">Th??ng b??o</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Nh???n x??t">
                                <a href="onwer-feedback.jsp">
                                    <span><i class="bx bx-detail"></i></span>
                                    <span class="title">Nh???n x??t</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="Th???ng k??">
                                <a href="owner-statistical.jsp">
                                    <span><i class='bx bx-line-chart'></i></span>
                                    <span class="title">Th???ng k??</span>
                                </a>
                            </li>
                            <li data-toggle="tooltip"data-placement="right" title="T??i kho???n">
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
                                    L???ch S??? Thu?? Ph??ng
                                </div>
                            </div>
                            <div class="float-right">
                                <div class="btn-group me-1 mb-1">
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            L?? Minh Qu??n
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="owner-profile.html"><i class='bx bx-user'></i>T??i kho???n</a>
                                            <a class="dropdown-item" href="owner-notification.html"><i class='bx bx-bell'></i>Th??ng b??o</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#"><i class='bx bx-log-out-circle'></i>Tho??t</a>
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
                        <div class="row">
                            <div class="offset-sm-6 col-sm-6  d-flex justify-content-sm-end p-md-0 mt-2 mt-sm-0 ">
                                <ol class="breadcrumb">
                                    <li class="breadcrumd-item">
                                        <a href="owner-history-room.html">L???ch s??? thu?? ph??ng</a>
                                    </li>
                                    <li class="breadcrumd-item">
                                        <span>/</span>
                                    </li>
                                    <li class="breadcrumd-item active">
                                        <a href="owner-history-detail.html">Chi ti???t</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 customer-detail">
                                <div class="col-lg-4 customer-profile">
                                    <div class="card profile">
                                        <div class="card-header">
                                            <h5>Th??ng tin ng?????i thu??</h5>
                                        </div>
                                        <%
                                            UserDTO userBooking = (UserDTO) request.getAttribute("USER_BOOKING");
                                            if (userBooking == null) {
                                                userBooking = new UserDTO();
                                            }
                                            FeedbackDTO feedbackBooking = (FeedbackDTO) request.getAttribute("FEEDBACK_BOOKING");
                                            if (feedbackBooking == null) {
                                                feedbackBooking = new FeedbackDTO();
                                            }
                                            HistoryDTO historyBooking = (HistoryDTO) request.getAttribute("HISTORY_DETAIL");
                                            if (historyBooking == null) {
                                                historyBooking = new HistoryDTO();
                                            }
                                            String status = "H???y Ph??ng";
                                            if (historyBooking.getStatus().equals("1")) {
                                                status = "???? Thanh To??n";
                                            }
                                            if (historyBooking.getStatus().equals("0")) {
                                                status = "Ch??a Thanh To??n";
                                            }
                                            if (historyBooking.getStatus().equals("3")){
                                                status = "???? Thanh To??n Tr?????c";
                                            }
                                        %>
                                        <div class="card-body flex-wrap">
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name">H??? v?? t??n:</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <span><%= userBooking.getFullName()%></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name">S??? ??i???n tho???i:</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <span><%= userBooking.getPhone()%></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name" style="display: block;">CCCD/CMND:</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <span><%= userBooking.getCitizenNumber()%></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name">?????a ch???:</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <span><%= userBooking.getAddress()%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card rating">
                                        <div class="card-header">
                                            <h5>????nh Gi??</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name">S??? sao:</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <% for (int i = 1; i <= feedbackBooking.getRating(); i++) {  %>
                                                    <i class='bx bxs-star yellow'></i>
                                                    <% } %>

                    
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5 text-md-right">
                                                    <label for="customer-name">Nh???n x??t ri??ng:</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <span>
                                                        <%= feedbackBooking.getDesc()%>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8 customer-booking">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Th??ng tin ?????t ph??ng</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>Tr???ng th??i:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span class="outcome"><%=status%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class=" col-sm-4 text-sm-right">
                                                    <span>M?? ?????t ph??ng:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getBookingID()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class=" col-sm-4 text-sm-right">
                                                    <span>T??n Ph??ng:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getRoomID()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>Lo???i Ph??ng:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getRoomType()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>T??n Nh?? Tr???:</span>
                                                </div>
                                                <div class="col-sm-2 text-sm-left">
                                                    <span><%= historyBooking.getMotelID()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>?????a ch???:</span>
                                                </div>
                                                <div class="col-sm-8 text-sm-left">
                                                    <span><%= historyBooking.getMotelAddress()%> - <%= historyBooking.getDistrict()%> - <%= historyBooking.getCity()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>Ng??y thu??:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getDate()%></span>
                                                </div>

                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>Th???i Gian Thu??:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getNumberService()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>D???ch v??? s??? d???ng:</span>
                                                </div>               
                                                <div class="col-sm-4 text-sm-left">
                                                    <ul>
                                                        <% List<ServiceDTO> listService = (ArrayList<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                                                            if (listService != null) {
                                                                if (listService.size() > 0) {
                                                                    for (ServiceDTO service : listService) {
                                                        %>
                                                        <li><%= service.getName() %></li>
                                                            <%  
                                                                    }
                                                                }
                                                            }
                                                            %>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-2 text-sm-left">
                                                    <ul>
                                                        <% 
                                                            if (listService != null) {
                                                                if (listService.size() > 0) {
                                                                    for (ServiceDTO service : listService) {
                                                        %>
                                                        <li><%= service.getPrice() %> VND</li>
                                                            <%  
                                                                    }
                                                                }
                                                            }
                                                            %>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>Ph????ng th???c thanh to??n:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span><%= historyBooking.getPayType()%></span>
                                                </div>
                                            </div>
                                            <div class="row mb-sm-2">
                                                <div class="col-sm-4 text-sm-right">
                                                    <span>T???ng ti???n:</span>
                                                </div>
                                                <div class="col-sm-3 text-sm-left">
                                                    <span style="color: red;"><%= historyBooking.getTotal() %></span>
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
        </div>

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>
