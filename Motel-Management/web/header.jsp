<%-- 
    Document   : header
    Created on : Jun 17, 2022, 9:33:21 AM
    Author     : cao thi phuong thuy
--%>

<%@page import="sample.users.UserDAO"%>
<%@page import="sample.users.DistrictDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>

    <div class="header__top d-flex justify-content-between align-items-center container-fluid py-2 fixed-top">
        <div class="header__left">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="mailto:hotelmanagement.fpt@gmail.com" class="text-white text-decoration-none"><i
                    class="fa fa-envelope"></i> hotelmanagement.fpt@gmail.com</a>
            <a href="tel:0396421901" class="text-white mr-4 text-decoration-none"><i class="fas fa-phone-alt"></i>
                039 6421 901</a>
        </div>
        <div class="header__right">

            <% UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) { %>

            <a href="./login.jsp">Đăng nhập</a>

            <a href="./signup.jsp">Đăng ký</a>
            <% } else if (loginUser.getRole().equals("US")) {%>


            <div class="user-dropdown dropdown">
                <button class="btn-user-dropdown text-white btn dropdown-toggle" type="button"
                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span>Xin chào, <%= loginUser.getFullName()%></span>
                    <span><img id="profile-pic" class="img-fluid" src="images/man.png" alt="<%= loginUser.getFullName()%>"></span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="MainController?action=ShowProfile&userID=<%=loginUser.getUserId()%>&role=<%=loginUser.getRole()%>">
                        Thông tin cá nhân</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="MainController?action=Logout">Đăng xuất</a>
                </div>
            </div>
        </div>
    </div>
    <%} else if (loginUser.getRole().equals("OW")) {%>

    <button type="button" class="button--primary btn btn-sm">
        <a href="OwnerShowOverview" class="border-left-0 m-0 p-0">Quản lý thuê trọ</a>
    </button>
    <div class="user-dropdown dropdown">
        <button class="btn-user-dropdown text-white btn dropdown-toggle" type="button"
                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span>Xin chào, <%= loginUser.getFullName()%></span>
            <span><img id="profile-pic" class="img-fluid" src="assets/img/avatar.jpg" alt="avatar"></span>
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="MainController?action=ShowProfile&userID=<%=loginUser.getUserId()%>&role=<%=loginUser.getRole()%>">
                Thông tin cá nhân</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="MainController?action=Logout">Đăng xuất</a>
        </div>
    </div>
</div>
</div>
<%}%>
</div>
</div>

</div>
</div>
<div class="header__bottom">
    <nav class="myNavBar navbar navbar-expand-lg navbar-dark container-fluid">
        <a class="navbar-brand" href="ShowMotelController"><img class="logo img-fluid" src="./assets/img/logo2-1.png"
                                                                alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Về chúng tôi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đội ngũ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Bảng giá dịch vụ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ShowAllMotelController">Danh sách motel</a>
                </li>
            </ul>
        </div>
       
        <%
            UserDAO district = new UserDAO();
            List<DistrictDTO> listDistrict = district.getListDistrict();
            if (listDistrict.size() > 0) {
                request.setAttribute("LIST_DISTRICT", listDistrict);
            }
        %>
        <div class="header__bottom__right">
            <form class="header__bottom--search d-flex" action="MotelManager">
                        
                <select class="custom-select" id="districtID" name="districtID" >
                        <c:if test="${requestScope.LIST_DISTRICT != null}">
                            <c:if test="${not empty requestScope.LIST_DISTRICT}">

                                <c:forEach var="d" varStatus="counter" items="${requestScope.LIST_DISTRICT}">
                                  
                                    <option value="${d.districtID}"> ${d.name}</option>
                                </c:forEach>
                            </c:if>
                        </c:if>
                </select>
                <button type="submit" class="searchButton" name="action" value="search">
                    <i class="fa fa-filter"></i>
                </button>
            </form>
        </div>
    </nav>
</div>
</header>