<%-- 
    Document   : createEmployee
    Created on : Nov 18, 2022, 9:48:48 AM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Employee Account Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ViewPersonal" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </header>
        <section>
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100">
                        <div class="login100-form">
                            <h1>Create Employee Account</h1>
                            <form action="MainController" method="post">
                                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c" style="margin-top: 30px;">
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
                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                    <span class="btn-show-pass">
                                        <i class="zmdi zmdi-eye"></i>
                                    </span>
                                    <input class="input100" type="password" name="txtpassword2">
                                    <span class="focus-input100" data-placeholder="Confirm Password"></span>
                                </div>

                                <div class="wrap-input100 validate-input" >
                                    <input class="input100" type="text" name="regName">
                                    <span class="focus-input100" data-placeholder="Name"></span>
                                </div>
                                <div class="wrap-input100 validate-input" >
                                    <input class="input100" type="text" name="regPhone">
                                    <span class="focus-input100" data-placeholder="Phone"></span>
                                </div>
                                <div class="wrap-input100 validate-input" >
                                    <input class="input100" type="text" name="regRole">
                                    <span class="focus-input100" data-placeholder="Role"></span>
                                </div>
                                <div class="wrap-input100 validate-input" >
                                    <input class="input100" type="date" name="regDate">
                                    <span class="focus-input100" data-placeholder="Date of birth"></span>
                                </div>
                                <input type="hidden" value="" name="reEmail" />
                                <input type="submit" value="Create Account" name="action" class="submit-button"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
