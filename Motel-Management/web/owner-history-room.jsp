

<%@page import="sample.owner.HistoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sun.java2d.marlin.stats.Histogram"%>
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
        <!-- loading -->
        <!-- <div id="preloader">
            <img class="loadbackground" src="assets/img/loading.jpg" alt="background">
            <img class="car" src="assets/img/car.gif" alt="loading...">
        </div> -->

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
                            <li class="active" data-toggle="tooltip"data-placement="right" title="L???ch s???">
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
                        <section>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table id="myTable" class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>M?? ?????t Ph??ng</th>
                                                            <th>M?? Motel</th>
                                                            <th>M?? Ph??ng</th>
                                                            <th>T??n Ng?????i Thu??</th>
                                                            <th>Tr???ng Th??i</th>
                                                            <th>S??? D???ch V???</th>
                                                            <th>PT Thanh To??n</th>
                                                            <th>Ng??y Nh???n Ph??ng</th>
                                                            <th>T???ng Ti???n</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            List<HistoryDTO> listHistory = (ArrayList<HistoryDTO>) request.getAttribute("LIST_HISTORY");
                                                            for (HistoryDTO history : listHistory) {
                                                                String status = "???? H???y";
                                                                if (history.getStatus().equals("2")) {
                                                                    status = "???? C???c";
                                                                }
                                                                if (history.getStatus().equals("0")) {
                                                                    status = "Ch??a Thanh To??n";
                                                                }
                                                                if (history.getStatus().equals("1")) {
                                                                    status = "???? Thanh To??n";
                                                                }
                                                        %>
                                                        <tr class='clickable-row' data-href="MainController?action=showHistoryDetail&bookingID=<%=history.getBookingID()%>&roomID=<%= history.getRoomID() %>" 
                                                            data-bs-toggle="tooltip"data-bs-placement="right" title="Nh???n ????? xem chi ti???t">
                                                            <td><%= history.getBookingID()%></td>
                                                            <td><%= history.getMotelID()%></td>
                                                            <td><%= history.getRoomID()%></td>
                                                            <td><%= history.getUserName()%></td>
                                                            <td><%= status %></td>
                                                            <td><%= history.getNumberService()%></td>
                                                            <td><%= history.getPayType()%></td>
                                                            <td><%= history.getDate()%></td>
                                                            <td><%= history.getTotal()%>&#8363;</td>

                                                        </tr>
                                                        <% }%>                                                    
                                                    </tbody>
                                                </table>
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