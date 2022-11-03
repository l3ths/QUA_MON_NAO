<%-- 
    Document   : detailJobPage
    Created on : Sep 23, 2022, 12:56:34 PM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Detail Page</title>
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
        <%
            JobDTO job = (JobDTO) request.getAttribute("JOB");
        %>
        <h1 class="page-title">Job Detail</h1>
        <div class="row">
            <div class="col-md-6 detail-name">
                <h2 style="margin-top: 18%;"><%= job.getName()%></h2>
            </div>
            <div class="col-md-6 detail-img"> 
                <p><img class="img-responsive" src="img/job/<%= job.getImgPath()%>"  /></p>
            </div>
        </div>
        <div class="detail-table" style="margin: 10px 8%;">
            <p><span>Experience:</span> <%= job.getExperienceRequirement()%></p>
            <p><span>Education:</span> <%= job.getEducationRequirement()%></p>
            <p><span>Salary:</span> up to <%= job.getSalary()%></p>
            <p><span>Description:</span> <%= job.getDesription()%></p>
            <form action="MainController" method="post">
                <input type="hidden" value="CDD1" name="CID" />
                <div style="padding-left: 4%" >
                    <button type="submit" name="action" value="Applying" class="submit-button">Apply</button>
                </div>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
