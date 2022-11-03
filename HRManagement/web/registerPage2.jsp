<%-- 
    Document   : registerpage2
    Created on : Sep 30, 2022, 1:48:14 AM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="loginPage.jsp">Login</a></li>
                    <li><a href="registerPage.jsp" class="active-page">Register</a></li>
                </ul>
            </div>
        </div>
        <form action="MainController" method="post">
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
                <input class="input100" type="date" name="regDate">
                <span class="focus-input100" data-placeholder="Date of birth"></span>
            </div>
            <input type="hidden" value="<%= (String) request.getAttribute("reqEmail")%>" name="reEmail" />
            <input type="submit" value="Register" name="action" class="submit-button"/>
        </form>
    </body>
</html>
