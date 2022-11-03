<%-- 
    Document   : loginPage
    Created on : Sep 19, 2022, 10:02:20 PM
    Author     : thanhhuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="loginPage.jsp" class="active-page">Login</a></li>
                    <li><a href="registerCandPage.jsp">Register</a></li>
                </ul>
            </div>
        </div>
        <%
            String msg = request.getParameter("msg");
        %>
        <section>
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100">
                        <div class="login100-form">
                            <h1>Login</h1>
                            <form action="MainController" method="post">

                                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                    <input class="input100" type="text" name="txtemail">
                                    <span class="focus-input100" data-placeholder="Email"></span>
                                </div>
                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                    <span class="btn-show-pass">
                                        <i class="zmdi zmdi-eye"></i>
                                    </span>
                                    <input class="input100" type="password" name="txtpassword">
                                    <span class="focus-input100" data-placeholder="Password"></span>
                                </div>
                                <h7><input type="checkbox" value="savelogin" name="savelogin"> Stay signed in</h7>
                                <br>
                                <button type="submit" value="login" name="action" class="submit-button">Log in</button>
                                <h2>Not a member? <a href="registerPage.jsp">Sign up </a></h2>
                                <input type="hidden" name="msg" value="<%= msg%>" />
                            </form>
                        </div>


                    </div>
                </div>
            </div>
            <p style="color: red"> <%= (msg != null) ? "You must login to use this funtion!" : ""%></p>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>