
<%@page import="sample.room.RoomTypeDTO"%>
<%@page import="sample.room.RoomDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.motel.MotelDTO"%>
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
                    <div class="col-sm-12 my-2">
                        <div class="toggle float-left">
                            <i class='bx bx-menu'></i>
                        </div>
                        <div class="float-left">
                            <div class="dashboard_bar d-flex">
                                Qu???n L?? Ph??ng
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
        <!-- End header -->

        <!-- List room -->
        <div class="main-content">
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="offset-sm-6 col-sm-6  d-flex justify-content-sm-end p-md-0 mt-2 mt-sm-0 ">
                            <ol class="breadcrumb">
                                <li class="breadcrumd-item">
                                    <a href="#">Qu???n l??</a>
                                </li>
                                <li class="breadcrumd-item">
                                    <span>/</span>
                                </li>
                                <li class="breadcrumd-item active">
                                    <a href="owner-room-list.html">Ph??ng</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <section>
                        <div class="card">
                            <div class="card-body">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">   
                                    <!-- dung vong for o day -->
                                    <%
                                        List<MotelDTO> listMotel = (ArrayList<MotelDTO>) request.getAttribute("LIST_MOTEL");
                                        if (listMotel != null) {
                                            if (listMotel.size() > 0) {
                                                for (MotelDTO motel : listMotel) {

                                    %>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#a<%= motel.getMotelID()%>">
                                            <i class='bx bx-home-alt-2'></i>
                                            <span><%= motel.getName()%></span>
                                        </a>
                                    </li>
                                    <%
                                                }
                                            }
                                        }
                                    %> 
                                </ul>


                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <!-- home1 -->
                                    <%
                                        if (listMotel != null) {
                                            if (listMotel.size() > 0) {
                                                for (MotelDTO motel : listMotel) {
                                    %>
                                    <div class="tab-pane" id="a<%= motel.getMotelID()%>" role="tabpanel">
                                        <div class="search">
                                            <div class="address-home">
                                                <span>?????a ch???: <h5> <%= motel.getAddress()%>,<%= motel.getDistrict()%>,<%= motel.getCity()%></h5></span>
                                            </div>
                                            <form action="MainController" method="post">
                                                <label>
                                                    <input type="hidden" name="ownerID" value="<%= loginUser.getUserId() %>"/>
                                                    <input type="hidden" name="action" value="searchRoom"/>
                                                    <input class="form-control" type="text" name="search" placeholder="Search...">
                                                    <i class='bx bx-search-alt'></i>
                                                </label>
                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-3 col-lg-6 col-sm-6 my-3">
                                                <div class="card card-child">
                                                    <div class="card-body add-room">
                                                        <button class="border-0" data-toggle="modal"  data-target="#addRoom<%=motel.getMotelID()%>">
                                                            <span>Th??m Ph??ng</span>
                                                            <i class='bx bx-add-to-queue'></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- dung vong for o day -->
                                            <%
                                                List<RoomDTO> listRoom = (ArrayList<RoomDTO>) request.getAttribute("LIST_ROOM");
                                                for (RoomDTO room : listRoom) {
                                                    if (room.getMotelID().equals(motel.getMotelID())) {
                                            %>
                                            <div class="col-xl-3 col-lg-6 col-sm-6 my-3">
                                                <div class="card card-child">
                                                    <div class="room-name">
                                                        <span><%= room.getName()%></span>
                                                        <div class="status">
                                                            <!-- d??ng l???nh if -->
                                                            <% if (room.getStatus() == 1) { %>
                                                            <span class="stt2">Tr???ng th??i:<h6>??ang thu??</h6></span>
                                                            <% } else {%>
                                                            <span class="stt1">Tr???ng th??i:<h6>Tr???ng</h6></span>
                                                            <% }%>
                                                        </div>
                                                    </div>
                                                    <div class="card-body room-title">
                                                        <ul class="list">
                                                            <li>
                                                                <h6>LO???I PH??NG:<%= room.getImage()%></h6>
                                                                <span></span>
                                                            </li>                                                        
                                                            <li>
                                                                <h6>TH??NG TIN:<%= room.getDesc()%></h6>
                                                                <span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <h6>S??? l?????ng d???ch v??? ???? s??? d???ng:</h6>
                                                                <span>
                                                                </span>
                                                            </li>
                                                            <li>
                                                                <h5>Gi??:</h5>
                                                                <span><%= room.getPrice()%>&dstrok;</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="form-group mx-auto">
                                                        <button class="btn btn-primary clickable-row" data-href="MainController?action=showRoomDetail&roomID=<%=room.getRoomId()%>&status=<%=room.getStatus()%>">
                                                            <span>Xem</span> 
                                                        </button>                                                   
                                                        <button class="btn btn-danger" data-toggle="modal" data-target="#Room<%=room.getRoomId()%>">
                                                            <span>X??a Ph??ng</span> 
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                    }
                                                }

                                            %>
                                        </div>
                                    </div>
                                    <%                                            }
                                            }
                                        }
                                    %> 
                                </div>
                                <!-- end tapnet -->
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <%
            if (listMotel != null) {
                if (listMotel.size() > 0) {
                    for (MotelDTO motel : listMotel) {

        %>
        <!-- add new Room -->
        <div id="addRoom<%=motel.getMotelID()%>" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Th??m Ph??ng M???i</h4>
                    </div>
                    <form action="MainController" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="ownerID" value="<%= loginUser.getUserId() %>" />
                        <div class="modal-body">
                            <div class="row p-4">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">T??n Nh?? Tr???</label>
                                        <select name="motelID" class="form-control col-md-7">
                                            <option disabled selected>Motel name to add room</option>
                                            <option value="<%=motel.getMotelID()%>" selected="selected" ><%=motel.getName()%></option>
                                        </select>
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">T??n ph??ng</label>
                                        <input type="text" name="roomName" placeholder="T??n Ph??ng" required class="form-control col-md-7">
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Lo???i ph??ng</label>
                                        <select name="typeofRoom" class="form-control col-md-7" onchange="other(event)" required="">
                                            <option disabled selected>Choose type of room</option>
                                            <%
                                                List<RoomTypeDTO> listRoomType = (ArrayList<RoomTypeDTO>) request.getAttribute("LIST_ROOMTYPE");
                                                for (RoomTypeDTO roomType : listRoomType) {
                                                    if (roomType.getMotelID().equals(motel.getMotelID())) {
                                            %>
                                            <option value="<%= roomType.getRoomTypeID()%>"><%= roomType.getTypeName()%></option>
                                            <%
                                                    }
                                                }

                                            %>
                                            <option value="custom">Other</option>
                                        </select>
                                        <input type="text" name="roomType" id="otherid" class="offset-md-3 form-control col-md-3 mt-2" style="display: none;"
                                               placeholder="Lo???i ph??ng" >
                                        <input type="text" id="otherid1" name="price" placeholder="Gi?? Ph??ng"  
                                               class="form-control offset-md-1 col-md-3 mt-2" style="display: none;"> 
                                        <label class="col-md-3 col-form-label mt-2 text-md-right" id="otherid2" for="customFile" style="display: none;">
                                            Ch???n ???nh
                                        </label>
                                        <input type="file" name="photo" class="form-control col-md-7 mt-2" id="customFile" accept="image/*" style="display: none;">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right mt-3" id="labeldecp" style="display: none;">
                                            M?? t???
                                        </label>
                                        <textarea type="text" name="roomTypeDesct" placeholder="M?? t??? ph??ng..." class="form-control col-md-7 mt-3" 
                                                  rows="3" id="decp" style="display: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button class="btn btn-success" type="submit" name="action" value="createRoom" >X??c Nh???n</button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%                    }
                }
            }
        %> 


        <%
            List<RoomDTO> listRoom = (ArrayList<RoomDTO>) request.getAttribute("LIST_ROOM");
            for (RoomDTO room : listRoom) {
        %>
        <!-- delete Home -->
        <div id="Room<%=room.getRoomId()%>" class="modal fade" role="dialog">                                               
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <form action="MainController" method="post">
                        <input type="hidden" name="statusRoom" value="<%= room.getStatus()%>" >
                        <input type="hidden" value="<%= loginUser.getUserId()%>" name="ownerID">
                        <input type="hidden" value="<%= room.getRoomId()%>" name="roomID">
                        <div class="card-body">
                            <div class="del-title">
                                <i class='bx bx-error-circle'></i>
                                <h2>B???n mu???n x??a ph??ng ?</h2> 
                            </div>                            
                            <div class="del-submit d-flex justify-content-center">                                 
                                <button type="submit" name="action" value="DeleteRoom" class="btn btn-success">X??c Nh???n</button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% }%>

        <!-- remove Home -->
        <div id="removeRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <form action="#">
                        <div class="card-body">
                            <div class="del-title">
                                <i class='bx bx-error-circle'></i>
                                <h2>B???n mu???n h???y ph??ng ?</h2> 
                            </div>
                            <div class="del-submit d-flex justify-content-center">
                                <button type="submit" class="btn btn-success">X??c Nh???n</button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/2.5.0-beta.5/lightgallery.es5.min.js"></script>
        <script src="https://unpkg.com/filepond-plugin-file-poster/dist/filepond-plugin-file-poster.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>