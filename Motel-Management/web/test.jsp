<%-- 
    Document   : test
    Created on : Jun 10, 2022, 12:32:21 AM
    Author     : Bao
--%>

<%@page import="sample.room.RoomDTO"%>
<%@page import="sample.motel.MotelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <ul>
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
                        <li>
                            <a href="MainController?action=ShowOverview">
                                <span><i class='bx bx-tachometer'></i></span>
                                <span class="title">T???ng quan</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="MainController?action=ShowRoom&ownerID=<%=loginUser.getUserId()%>">
                                <span><i class='bx bx-home'></i></span>
                                <span class="title">Ph??ng</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-service.html">
                                <span><i class='bx bx-cloud-rain'></i></span>
                                <span class="title">D???ch v???</span>
                            </a>
                        </li>
                        <li>
                            <a href="MainController?action=ShowHistory">
                                <span><i class='bx bx-history'></i></span>
                                <span class="title">L???ch s??? thu?? ph??ng</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-notification.html">
                                <span><i class='bx bx-bell'></i></span>
                                <span class="title">Th??ng b??o</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-feedback.html">
                                <span><i class="bx bx-detail"></i></span>
                                <span class="title">Nh???n x??t</span>
                            </a>
                        </li>
                        <li>
                            <a href="owner-statistical.html">
                                <span><i class='bx bx-line-chart'></i></span>
                                <span class="title">Th???ng k??</span>
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
                    <div class="room-list">
                        <div class="page-header">
                            <div class="edit-home">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addHome">Th??m Nh??</button>
                                <button class="btn btn-success" data-toggle="modal" data-target="#editHome">S???a Nh??</button>
                                <button class="btn btn-danger" data-toggle="modal" data-target="#deleteHome">X??a Nh??</button>
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
                                            <a class="nav-link active" data-toggle="tab" href="#a<%= motel.getMotelID()%>">
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
                                        <div class="tab-pane active" id="a<%= motel.getMotelID()%>" role="tabpanel">
                                            <div class="row search">
                                                <div class="col-sm-12 d-flex">
                                                    <div class="col-sm-6 d-flex address-home">
                                                        <span>?????a ch???: </span>
                                                        <h5> 111a,????nh phong ph??</h5>
                                                    </div>
                                                    <div class="col-sm-6 d-flex justify-content-end">
                                                        <form action="#">
                                                            <div>
                                                                <label>
                                                                    <input class="form-control" type="text" name="search" placeholder="Search...">
                                                                    <i class='bx bx-search-alt'></i>
                                                                </label>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-3 col-lg-6 col-sm-6 my-3">
                                                    <div class="card card-child">
                                                        <div class="card-body add-room">
                                                            <button class="border-0" data-toggle="modal"  data-target="#addRoom">
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
                                                            <span><%= room.getName() %></span>
                                                            <div class="status">
                                                                <!-- d??ng l???nh if -->
                                                                <span class="stt1">Tr???ng th??i:<h6>Tr???ng</h6></span>
                                                                <!-- <span class="stt2">Tr???ng th??i:<h6>??ang thu??</h6></span>
                                                                <span class="stt3">Tr???ng th??i:<h6>???? c???c</h6></span> -->
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="room-title"  data-toggle="modal" data-target="#titleRoom">
                                                                <ul>
                                                                    <li>
                                                                        <h6>Ng?????i thu??:</h6>
                                                                        <span></span>
                                                                    </li>                                                        
                                                                    <li>
                                                                        <h6>Th??ng tin ph??ng:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h6>D???ch v??? s??? d???ng:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h6>M?? t???:</h6>
                                                                        <span>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <h5>Gi??:</h5>
                                                                        <span>120,000&dstrok;</span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mx-auto">
                                                            <button class="btn btn-primary" data-toggle="modal" data-target="#editRoom">
                                                                <span>Ch???nh S???a</span> 
                                                            </button>

                                                            <!-- d??ng if tr???ng th??i ph??ng ??? ????y -->
                                                            <button class="btn btn-danger" data-toggle="modal" data-target="#deleteRoom">
                                                                <span>X??a Ph??ng</span> 
                                                            </button>

                                                            <!-- n???u ph??ng ???? ???????c thu?? hay ???? c???c th?? d??ng c??u d?????i -->
                                                            <!-- <button class="btn btn-danger" data-toggle="modal" data-target="#deleteRoom">
                                                                <span>H???y Ph??ng</span> 
                                                            </button> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }

                                                %>
                                            </div>
                                        </div>
                                        <%                                                    
                                                   }
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
        </div>

        <!-- add Home -->
        <div id="addHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Th??m Nh??</h4>
                    </div>
                    <form action="#" >
                        <div class="modal-body container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-md-2 text-md-right"><span>T???nh:</span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name=" " class="form-control">
                                                    <option value="1">S??n La</option>
                                                    <option value="2">??i???n Bi??n</option>
                                                    <option value="3">Lai Ch??u</option>
                                                    <option value="4">B???c Giang</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-md-right"><span>Huy???n: </span></div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <select name=" " class="form-control">
                                                    <option value="1">S??n La</option>
                                                    <option value="2">??i???n Bi??n</option>
                                                    <option value="3">Lai Ch??u</option>
                                                    <option value="4">B???c Giang</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 text-md-right pb-1"><span>?????a ch???: </span></div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Nh???p ?????a ch???..." required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="offset-md-2 col-md-8 upload-img">
                                            <div class="custom-file col-ms-4">
                                                <label for="file-input">
                                                    <i class="fas fa-upload"></i>&nbsp; Th??m ???nh ph??ng
                                                </label>
                                                <input type="file" id="file-input" accept="image/*" onchange="preview()" multiple>
                                                <p id="num-of-files">No file choose</p>
                                                <div id="images"></div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">X??c Nh???n</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- edit Home -->
        <div id="editHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Ch???nh s???a th??ng tin ph??ng</h4>
                    </div>
                    <form action="#" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12  ">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label text-sm-right">M?? Ph??ng</label>
                                        <div class="col-sm-6">
                                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="001">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nameRoom" class="col-sm-4 col-form-label text-sm-right">T??n Ph??ng</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" value="ABC" id="nameRoom" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="typeofRoom" class="col-sm-4 col-form-label text-sm-right">Ki???u Ph??ng</label>
                                        <div class="col-sm-6">
                                            <select name="#" id="typeofRoom" class="form-control">
                                                <option value="">Luxury</option>
                                                <option value="">Luxury</option>
                                                <option value="">Normal</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-4 col-form-label text-sm-right">M?? t???</label>
                                        <div class="col-sm-6">
                                            <textarea type="text" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">X??c nh???n</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- remove Home -->
        <div id="deleteHome" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xo?? nh??</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="cancel" class="col-md-3 col-form-label text-md-right">L?? do x??a</label>
                                        <select class="form-control col-md-7" name="reason" id="">
                                            <option value="">Kh??ch kh??ng nh???n ph??ng</option>
                                            <option value="">Kh??ch ?????i ph??ng</option>
                                            <option value="">Kh??c</option>
                                        </select>
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">L?? do kh??c</label>
                                        <textarea type="text" name="" placeholder="Vi???t l?? do kh??c ??? ????y" 
                                                  required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" >X??c Nh???n</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- add new Room -->
        <div id="addRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Th??m Ph??ng M???i</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">M?? ph??ng</label>
                                        <input type="text" name="roomID" placeholder="Nh???p M??" required class="form-control col-md-7">
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">Gi??</label>
                                        <input type="text" name="price" placeholder="Gi??" required class="form-control col-md-7">
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">M?? t???</label>
                                        <textarea type="text" placeholder="M?? t??? ph??ng..." required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button class="btn btn-success" type="submit" >X??c Nh???n</button>
                                <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- title   Room -->
        <div id="titleRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-xl" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Chi ti???t Ph??ng</h4>
                    </div>
                    <div class="modal-body container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-5">
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>M?? Ph??ng: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>004 </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>H??? T??n Ng?????i Thu??: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>L?? Minh Qu??n</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>Th???i gian thu??: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>01/06/2022</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>H???n tr??? ph??ng: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <span>02/06/2022</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 text-md-right pb-1">
                                        <span>D???ch v???: </span>
                                    </div>
                                    <div class="col-md-6">
                                        <ul>
                                            <li>??n u???ng</li>
                                            <li>Cho thu?? xe g???n m??y</li>
                                            <li>Kh??c</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-7 text-lg-left">
                                <div id="lightgallery" class="row">
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>   
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>  
                                    <a href="assets/img/bgd.jpg" data-exthumbimage="assets/img/bgd.jpg" data-src="assets/img/bgd.jpg" class= "col-lg-4 col-md-6 mb-4">
                                        <img src="assets/img/bgd.jpg" alt="" style="width:100%;">
                                    </a>                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#editRoom">Ch???nh s???a</button>
                        <button class="btn btn-danger" type="button" data-dismiss="modal">Tho??t</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- edit Room -->
        <div id="editRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="content">
                <div class="modal-content modal-addRoom">
                    <div class="modal-header">
                        <h4 class="modal-title">Ch???nh s???a th??ng tin ph??ng</h4>
                    </div>
                    <form action="#" class="form-group">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12 col-md-7">
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-4 col-form-label">M?? Ph??ng</label>
                                        <div class="col-sm-8">
                                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="001">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nameRoom" class="col-sm-4 col-form-label">T??n Ph??ng</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" value="ABC" id="nameRoom" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="typeofRoom" class="col-sm-4 col-form-label">Ki???u Ph??ng</label>
                                        <div class="col-sm-8">
                                            <select name="#" id="typeofRoom" class="form-control">
                                                <option value="">Luxury</option>
                                                <option value="">Normal</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-4 col-form-label">M?? t???</label>
                                        <div class="col-sm-8">
                                            <textarea type="text" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit">X??c nh???n</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- remove Home -->
        <div id="deleteRoom" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xo?? Ph??ng</h4>
                    </div>
                    <form action="#">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row form-group">
                                        <label for="cancel" class="col-md-3 col-form-label text-md-right">L?? do x??a</label>
                                        <select class="form-control col-md-7" name="reason" id="">
                                            <option value="">Kh??ch kh??ng nh???n ph??ng</option>
                                            <option value="">Kh??ch ?????i ph??ng</option>
                                            <option value="">Kh??c</option>
                                        </select>
                                    </div>
                                    <div class="row form-group">
                                        <label for="firstname" class="col-md-3 col-form-label text-md-right">L?? do kh??c</label>
                                        <textarea type="text" name="" placeholder="Vi???t l?? do kh??c ??? ????y" required class="form-control col-md-7" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-success" type="submit" >X??c Nh???n</button>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">H???y</button>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="assets/js/owner-script.js"></script>
    </body>
</html>
