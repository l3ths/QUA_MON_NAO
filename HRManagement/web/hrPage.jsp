<%-- 
    Document   : hrPage
    Created on : Oct 7, 2022, 12:37:54 AM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@page import="core.dto.RecruitmentPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <%
        ArrayList<RecruitmentPostDTO> listPost = (ArrayList<RecruitmentPostDTO>) request.getAttribute("listPost");
        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) request.getAttribute("listJob");
    %>
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
                    <li><a href="hrPage.jsp" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">Recruitment Management</h1>
            <div class="row">
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Job name</h3>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="border-form">
                        <h3 class="table-header">Date</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Detail</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                    for (int i = 0; i < listJob.size(); i++) {
                        JobDTO get = listJob.get(i);
                %>
                <div class="col-md-3">
                    <div class="border-form" style="height: 200px;">
                        <p class="table-description" style="margin-top: 25%;"><%= get.getName() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="border-form" style="height: 200px;">
                        <p class="table-description" style="margin-top: 10%;">From : <%= listPost.get(i).getDateFrom()%></p>
                        <p class="table-description">To : <%= listPost.get(i).getDateTo()%></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form table-link" style="height: 200px; padding-top: 25%;">
                        <a href="#">Detail</a>
                    </div>
                </div>
                <%
                    }
                %>
                <div style="width: 150px; margin-right:40px; margin-bottom: 30px; margin-top: 20px; float: right;">
                    <a href="postRecruitmentJob.jsp" class="link-button" >New post</a>
                </div>
            </div>
            <footer>
                <%@include file="footer.jsp" %>
            </footer>
    </body>
</html>
