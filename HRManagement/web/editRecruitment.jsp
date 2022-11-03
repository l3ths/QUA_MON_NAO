<%-- 
    Document   : recruitmentManagement
    Created on : Oct 21, 2022, 12:27:22 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment Management</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="editRecruitment.jsp" class="active-page">Edit Recruitment</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">Edit Recruitment</h1>
            <form action="MainController" style="width: 500px; margin: 100px auto;">
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Experience Requirement" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Education Requirement" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Salary" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Description" class="input"/>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <button type="submit" name="action" value="" class="submit-button">Submit</button>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" name="action" value="" class="submit-button">Save</button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
