<%-- 
    Document   : updatePassword
    Created on : Sep 22, 2022, 11:19:41 PM
    Author     : ThinkPad T490
--%>

<%@page import="core.dto.CandidateDTO"%>
<%@page import="core.dto.EmployeeDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Password</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <header class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <c:if test="${sessionScope.role eq 'candidate'}">
                        <li><a href="MainController?action=ShowJob">Home</a></li>
                        </c:if>
                    <li><a href="MainController?action=ViewPersonal">Personal</a></li>
                    <li><a href="personalPage.jsp" class="active-page">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </header>
        <section class="container">
            <h1 class="page-title">Change Password</h1>
            <form action="MainController" method="post">
                <div class="row">
                    <div class="col-md-4" >
                        <%
                            String role = (String) session.getAttribute("role");
                            String email = "";
                            if (!role.equals("candidate")) {
                                EmployeeDTO emp = (EmployeeDTO) session.getAttribute("LOGIN_EMP");
                                email = emp.getEmemail();
                        %>
                        <img src="img/avatar/<%= emp.getImgpath()%>" class="ava-img"/>
                        <%
                        } else {
                            CandidateDTO can = (CandidateDTO) session.getAttribute("LOGIN_CDD");
                            email = can.getEmail();
                        %>
                        <img src="img/avatar/<%= can.getImgPath()%>" class="ava-img"/>
                        <%}%>
                    </div>
                    <div class="col-md-8 row">
                        <div class="col-md-4">
                            <p class="info-title">Email:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input type="text" class="input" name="txtemail" value="<%= email%>" readonly="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">Old password:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input type="password" class="input" name="txtoldpassword" required="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">New password:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input type="password" class="input" name="txtnewpassword" required="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">Confirm password:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input type="password" class="input" name="txtnewpassword2" required="">
                        </div>
                        <div>
                            <button type="submit" name="action" value="CHANGE PASSWORD" class="submit-button">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <%@include file="footer.jsp" %>  
    </body>
</html>
