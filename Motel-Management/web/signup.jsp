<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
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
                            <a href="ShowMotelController"><img src="./assets/img/logo2-1.png" alt="logo"></a>
                            <h4 class="text-center my-3">Thông tin đăng ký</h4>
                        </div>
                        <div class="form col-12 px-5">
                            <form action="CreateUserController" method="POST" id="form-1" class="row">
                                <div class="form-item input-field col-12">
                                    <label for="fullName">Họ và tên <span class="text-danger">*</span></label>
                                    <input type="text" name="fullName" id="fullName"  placeholder="Họ và tên" />
                                    <span id="error_message" class="helper-text text-danger">
                                        <span id="error_fullName_all_leter" class="helper-text text-danger">${requestScope.USER_ERROR.getFullNameError()}</span>
                                    </span>
                                    
                                </div>
                                <div class="form-item input-field col-12">
                                    <label for="userId">Tên đăng nhập <span class="text-danger">*</span></label>
                                    <input type="text" name="userId" placeholder="Tên đăng nhập" id="userName">
                                    <span id="error_message" class="helper-text text-danger"><span id="error_userName_sign" class="helper-text text-danger">${requestScope.USER_ERROR.getUserIdError()} </span></span>
                                    
                                     </div>
                                <div class="form-item input-field col-12">
                                    <label for="gmail">Email <span class="text-danger">*</span></label>
                                    <input type="email" name="gmail" id="email" placeholder="Gmail">
                                    <span id="error_message" class="helper-text text-danger"></span>
                                </div>
                                <div class="form-item input-field col-12">
                                    <label for="phone">Số điện thoại <span class="text-danger">*</span></label>
                                    <input type="tel" name="phone" placeholder="Số điện thoại" id="telephone">
                                    <span id="error_message" class="helper-text text-danger">${requestScope.USER_ERROR.getPhoneError()}</span>
                               
                                </div>
                                <div class="form-item input-field col-12">
                                    <label for="password">Mật khẩu <span class="text-danger">*</span></label>
                                    <input type="password" name="password" id="password" placeholder="Mật khẩu" minlength="6" maxlength="32">
                                    <span id="error_message" class="helper-text text-danger">
                                    <span id="error_password_min_max_length" class="helper-text text-danger"></span></span>
                                </div>
                                <div class="form-item input-field col-12">
                                    <label for="confirm">Nhập lại mật khẩu <span class="text-danger">*</span></label>
                                    <input type="password" name="confirm" id="confirm" placeholder="Nhập lại mật khẩu">
                                    <span id="error_message" class="helper-text text-danger">${requestScope.USER_ERROR.getConfirmpasswordError()}</span>
                                
                                </div>
                                <div class="button-select btn-group btn-group-toggle col-12 offset-md-2 col-md-8 pt-3"
                                    data-toggle="buttons">
                                    <label class="btn active">
                                      <input type="radio" name="role" value="US" checked> Người thuê
                                    </label>
                                    <label class="btn btn-danger">
                                      <input type="radio" name="role" value="OW"> Chủ trọ
                                    </label>
                                </div>
                                <div class="button col-12">
                                    <button id="signUp" type="submit" value="Create"
                                        class="btn-signup btn btn-danger">Đăng
                                        ký</button>
                                </div>
                            </form>
                            <div class="text-center mt-3">
                                <label class="mb-0 me-2">Bạn đã có tài khoản? </label>
                                <span><a href="login.jsp" class="login-switch text-primary">Đăng nhập</a> ở
                                    đây</span>
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
</body>

</html>