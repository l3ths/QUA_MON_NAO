<%-- 
    Document   : personalPage
    Created on : 20-09-2022, 13:57:51
    Author     : truongtantrung
--%>

<%@page import="core.dto.CandidateDTO"%>
<%@page import="core.dto.EmployeeDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Profile</title>
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
            <h1 class="page-title">Profile</h1>
            <form action="MainController" method="post">
                <p style="color: red"> <%= (request.getParameter("stt") != null) ? "Register Successfull" : ""%></p>
                <%
                    String role = (String) session.getAttribute("role");
                    if (!role.equals("candidate")) {
                        EmployeeDTO emp = (EmployeeDTO) session.getAttribute("LOGIN_EMP");
                %>
                <div class="row">
                    <div class="col-md-5" >
                        <img src="img/avatar/<%= emp.getImgpath() != null ? emp.getImgpath() : "default_avatar.png"%>" alt="avatar" class="ava-img"/>
                    </div>
                    <div class="col-md-7 row" >
                        <div class="col-md-4">
                            <p class="info-title">Full name:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input class="input" value="<%= emp.getEmname()%>" readonly="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">Date of birth:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input type="date" class="input" value="<%= emp.getBirthdate()%>" readonly="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">Phone number:</p>
                        </div>
                        <div class="col-md-8 input-border">
                            <input class="input" value="<%= emp.getEmphone()%>" readonly="">
                        </div>
                        <div class="col-md-4">
                            <p class="info-title">Email:</p1>
                        </div>
                        <div class="col-md-8 input-border">
                            <input class="input" value="<%= emp.getEmemail()%>" readonly="">
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <a href="updatePassword.jsp" class="link-button">Change Password</a>  
                        </div>
                        <div class="col-md-4">
                            <a href="updatePersonal.jsp" class="link-button">Update Personal</a> 
                        </div>
                    </div>
                    <%
                    } else {
                        CandidateDTO can = (CandidateDTO) session.getAttribute("LOGIN_CDD");
                    %>
                    <div class="row">
                        <div class="col-md-5" >
                            <img src="img/avatar/<%= can.getImgPath() != null ? can.getImgPath() : "default_avatar.png"%>" alt="avatar" class="ava-img"/>
                        </div>
                        <div class="col-md-7 row">
                            <div class="col-md-4">
                                <p class="info-title">Full name:</p>
                            </div>
                            <div class="col-md-8 input-border">
                                <input class="input" value="<%= can.getName()%>" readonly="">
                            </div>
                            <div class="col-md-4">
                                <p class="info-title">Date of birth:</p>
                            </div>
                            <div class="col-md-8 input-border">
                                <input class="input" value="<%= can.getBirthdate()%>" readonly="">
                            </div>
                            <div class="col-md-4">
                                <p class="info-title">Phone number:</p>
                            </div>
                            <div class="col-md-8 input-border">
                                <input class="input" value="<%= can.getBirthdate()%>" readonly="">
                            </div>
                            <div class="col-md-4">
                                <p class="info-title">Email:</p>
                            </div>
                            <div class="col-md-8 input-border">
                                <input class="input" value="<%= can.getEmail()%>" readonly="">
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <a href="updatePassword.jsp" class="link-button">Change Password</a>  
                            </div>
                            <div class="col-md-4">
                                <a href="updatePersonal.jsp" class="link-button">Update Personal</a> 
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>    
            </form>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
