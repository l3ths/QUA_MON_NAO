<%-- 
    Document   : postRecruitmentJob
    Created on : Oct 13, 2022, 2:38:29 PM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Recruitment Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>  
        <header class="header row">
            <div class="col-md-4">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-8">
                <ul>
                    <li><a href="MainController?action=ViewPersonal" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </header>
        <div class="container">
            <h1 class="page-title">Post Recruitment</h1>
            <div class="row" style="margin: 100px auto; width: 600px;">
                <form action="MainController" method="post" >
                    <div class="col-md-4">
                        <p class="info-title">Job tittle:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txtjobtittle" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Experience Requirement:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txtexpReq" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Education Requirement:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txteduReq" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Salary:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txtSalary" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Description:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txtDesc" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Image:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="text" class="input" name="txtImg" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Quantity:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="number" class="input" name="txtQuantity" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Date from:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="date" class="input" name="txtDatefrom" required="" >
                    </div>
                    <div class="col-md-4">
                        <p class="info-title">Date to:</p>
                    </div>
                    <div class="col-md-8 input-border">
                        <input type="date" class="input" name="txtDateto" required="" >
                    </div>
                    <button type="submit" name="action" value="CREATE JOB"  class="submit-button" >Post</button>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
