<%-- 
    Document   : applyJobPage
    Created on : Sep 27, 2022, 1:49:32 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply Job Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role eq 'candidate'}">
            <div class="header row">
                <div class="col-md-6">
                    <h1>Toidiyuh</h1>
                </div>
                <div class="col-md-6">
                    <ul>
                        <li><a href="MainController?action=ShowJob" class="active-page">Home</a></li>
                        <li><a href="candidatePage.jsp">Personal</a></li>
                        <li><a href="personalPage.jsp">Profile</a></li>
                        <li><a href="MainController?action=Logout">Log out</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.role==null}">
            <div class="header row">
                <div class="col-md-6">
                    <h1>Toidiyuh</h1>
                </div>
                <div class="col-md-6">
                    <ul>
                        <li><a href="MainController?action=ShowJob" class="active-page">Home</a></li>
                        <li><a href="loginPage.jsp">Login</a></li>
                        <li><a href="registerCandPage.jsp">Register</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <div class="container">
            <h1 class="page-title">Apply</h1>
            <form action="MainController" method="post" style="width: 500px; margin: 100px auto;">
                <div class="input-border">
                    <input type="text" name="applyFileCV" placeholder="File CV" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="applyEdu" placeholder="Education" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="applyExp" placeholder="Experience" class="input"/>
                </div>
                <div class="input-border">
                    <input type="date" name="applydateOB" placeholder="Date of Birth" class="input"/>
                </div>
                <button type="submit" name="action" value="ApplyJob" class="submit-button">Apply</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
