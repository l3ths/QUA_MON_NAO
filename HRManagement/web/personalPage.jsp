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
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="personalPage.jsp" class="active-page">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <section>
            <h1 class="page-title">Profile</h1>
            <form action="MainController" method="post">
                <%
                    String role = (String) session.getAttribute("role");
                    if (!role.equals("candidate")) {
                        EmployeeDTO emp = (EmployeeDTO) session.getAttribute("LOGIN_EMP");
                %>
                <div class="profile-form row">
                    <div class="col-md-5" >
                        <img src="img/avatar/<%= emp.getImgpath()%>" class="img-responsive"/>
                    </div>
                    <div class="col-md-7" >
                        <div class="profile-information">
                            <div class="col-md-4">
                                <p1>Full name:</p1>
                            </div>
                            <div class="col-md-8">
                                <p> <%= emp.getEmname()%> </p>
                            </div>
                            <div class="col-md-4">
                                <p1>Date of birth:</p1>
                            </div>
                            <div class="col-md-8">
                                <p> <%= emp.getBirthdate()%> </p>
                            </div>
                            <div class="col-md-4">
                                <p1>Phone number:</p1>
                            </div>
                            <div class="col-md-8">
                                <p> <%= emp.getEmphone()%> </p>
                            </div>
                            <div class="col-md-4">
                                <p1>Email:</p1>
                            </div>
                            <div class="col-md-8">
                                <p> <%= emp.getEmemail()%> </p>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <a href="updatePassword.jsp" class="link-button">Change Password</a>  
                            </div>
                            <div class="col-md-4">
                                <a href="updatePersonal.jsp" class="link-button">Update Personal</a> 
                            </div>
                        </div>    
                    </div>
                    <%
                    } else {
                        CandidateDTO can = (CandidateDTO) session.getAttribute("LOGIN_CDD");
                    %>
                    <div class="profile-form row">
                        <div class="col-md-5" >
                            <img src="img/avatar/<%= can.getImgPath()%>" class="img-responsive"/>
                        </div>
                        <div class="col-md-7" >
                            <div class="profile-information">
                                <div class="col-md-4">
                                    <p1>Full name:</p1>
                                </div>
                                <div class="col-md-8">
                                    <p> <%= can.getName()%> </p>
                                </div>
                                <div class="col-md-4">
                                    <p1>Date of birth:</p1>
                                </div>
                                <div class="col-md-8">
                                    <p> <%= can.getBirthdate()%> </p>
                                </div>
                                <div class="col-md-4">
                                    <p1>Phone number:</p1>
                                </div>
                                <div class="col-md-8">
                                    <p> <%= can.getBirthdate()%> </p>
                                </div>
                                <div class="col-md-4">
                                    <p1>Email:</p1>
                                </div>
                                <div class="col-md-8">
                                    <p> <%= can.getEmail()%> </p>
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
                    </div>    
            </form>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
