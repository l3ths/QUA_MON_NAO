<%-- 
    Document   : viewCV
    Created on : Nov 8, 2022, 8:02:03 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <%--<c:if test="${sessionScope.role==null||sessionScope.role ne 'candidate'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>--%>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ViewPersonal">Personal</a></li>
                    <li><a href="personalPage.jsp" class="active-page">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">CV</h1>
            <div class="row" style="margin: 50px auto;">
                <div class="col-md-5">
                    <img src="img/avatar/thuytien.jpg" class="img-responsive"/>
                </div>
                <div class="col-md-7 row">
                    <div class="col-md-4">
                        <p class="info-title">Full name:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" readonly="Nguyen Thuc Tien" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Date of birth:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="date" class="input" readonly="" value="12/8/1998">
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Phone number:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" readonly="" value="0987654321">
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Email:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" readonly="" value="thuytien@gmail.com">
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Year of experience:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="number" class="input" readonly="" value="4">
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Education:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" readonly="" value="Master of Business FU">
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Strength:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" readonly="" value="Handsome, friendly">
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
