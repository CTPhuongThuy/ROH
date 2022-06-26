<%-- 
    Document   : Login
    Created on : Jun 3, 2022, 5:13:06 PM
    Author     : Bao
--%>

<%@page import="sample.utils.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link rel="shortcut icon" href="./assets/img/logo2.png">
        <!-- BS4 CSS -->
        <link rel="stylesheet" href="vendor/bootstrap-4.5.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
        <!-- FONT -->
        <link
            href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;0,900;1,100&family=Roboto+Condensed:wght@400;700&display=swap"
            rel="stylesheet">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="fonts/fontawesome-free-5.15.4-web/css/all.min.css">


        <!-- CSS -->
        <link rel="stylesheet" href="./assets/css/main.css">

    </head>

    <body>
   
    <div class="background">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 p-lg-0">
                    <div class="login row">
                        <div class="col-12 text-center">
                            <a href="ShowMotelController"><img src="assets/img/logo2-1.png" alt="logo"></a>
                            <h4 class="text-center my-3">Điền thông tin đăng nhập</h4>
                        </div>
                        <div class="col-12 px-5">
                            <form class="form" action="MainController" method="POST">
                                <div class="form-item input-field col-12">
                                    <label for="userId">Tên đăng nhập</label>
                                    <input type="text" id="userName" name="userId"/>
                                </div>
                                <div class="form-item input-field col-12">
                                    <label for="password">Mật khẩu</label>
                                    <input type="password" name="password" id="password"> <!-- id="password" minlength="6" maxlength="32" -->
                                    <a href="#" class="float-end">Quên mật khẩu?</a>
                                </div>
                                <span class="danger fs-16 font-w500 text-end d-block" style="color: red"><em>${requestScope.ERROR} </em></span>
                                
                                <button type="submit" name="action" value="Login" class="btn-signup btn btn-danger">Đăng nhập</button>
                            </form>
                                <!-- login by gg -->
                            <div>
                                <p class="text-center my-3">Or</p>
                                <button class="login-gg">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=<%=Constants.GOOGLE_REDIRECT_URI%>&response_type=code&client_id=<%=Constants.GOOGLE_CLIENT_ID%>&approval_prompt=force">
                                    <img src="assets/img/Google__G__Logo.svg" alt="logo-G"> Đăng nhập bằng
                                        Google</a>
                                </button>
                            </div>
                            <div class="d-flex align-items-center justify-content-center pt-lg-5">
                                <p class="mb-0 me-2">Don't have an account? </p>
                                <a href="signup.jsp" class="signup"> Đăng ký.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- thư viện hỗ trợ -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!-- Jquery Waypoint -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
    <!-- BS4 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.5/umd/popper.min.js"></script>
    <script src="vendor/bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
    <!-- main js -->
    <script src="assets/js/user-script.js"></script>
    <script>
        Validator({
            form: '#form-2',
            errorSelector: '#error_message',
            rules: [
                Validator.isNotEmpty('#userName'),
                Validator.isRequired('#userName', 'Vui lòng nhập lại tên người dùng'),
                Validator.isNotEmpty('#password'),
                Validator.minLength('#password', 1, 'Vui lòng nhập lại mật khẩu'),
            ]
        });
    </script>
</body>

</html>
