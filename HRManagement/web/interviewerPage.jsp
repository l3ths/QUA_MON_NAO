<%-- 
    Document   : interviewPage
    Created on : Oct 7, 2022, 1:30:59 AM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@page import="core.dto.InterviewingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interviewer Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <%
        ArrayList<String> listDay = (ArrayList<String>) request.getAttribute("listDay");
        ArrayList<String> listTime = (ArrayList<String>) request.getAttribute("listTime");
        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) request.getAttribute("listJob");
        ArrayList<String> listID = (ArrayList<String>) request.getAttribute("listID");
        
    %>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'interviewer'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <header class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ViewPersonal" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </header>
        <div class="container">
            <h1 class="page-title">Interviewer Page</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Job name</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Interview time</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Detail</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form long-form">
                        <% for (int idx = 0; idx < listJob.size(); idx++) {
                                JobDTO get = listJob.get(idx);
                        %>
                        <p class="table-description"><%= get.getName()%></p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form long-form">
                        <% for (int idx = 0; idx < listDay.size(); idx++) {
                        %>
                        <p class="table-description"><%= listTime.get(idx) %> <%= listDay.get(idx) %></p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form long-form">
                        <% for (int idx = 0; idx < listJob.size(); idx++) {
                                JobDTO get = listJob.get(idx);
                        %>
                        <div class="table-link">
                            <form action="MainController" method="post">
                                <input type="hidden" name="ITVID" value="<%= listID.get(idx) %>" />
                                <button class="button-link" type="submit" name="action" value="ViewInterviewDetail" >Detail</button>
                            </form>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
