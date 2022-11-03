<%-- 
    Document   : candidatePage
    Created on : Oct 6, 2022, 10:29:36 PM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@page import="core.dto.InterviewingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="core.dto.CVDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'candidate'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="candidatePage.jsp" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <%
            CVDTO cv = (CVDTO) request.getAttribute("cv");
            ArrayList<InterviewingDTO> listIW = (ArrayList<InterviewingDTO>) request.getAttribute("listIW");
            ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) request.getAttribute("listJob");
            String[] stt = {"Processing","Aproved","Rejected"};
        %>
        <div class="container">
            <h1 class="page-title">Apply Result</h1>
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
                        <h3 class="table-header">Result</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form" style="height: 700px;">
                        <% for (int idx = 0; idx < listJob.size(); idx++) {
                                JobDTO get = listJob.get(idx);
                        %>
                        <p class="table-description"><%= get.getName() %></p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form" style="height: 700px;">
                        <% for (int idx = 0; idx < listIW.size(); idx++) {
                                InterviewingDTO get = listIW.get(idx);
                        %>
                        <p class="table-description"><%= get.getTime() %> <%= get.getDate()%></p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form" style="height: 700px;">
                        <% for (int idx = 0; idx < listIW.size(); idx++) {
                                InterviewingDTO get = listIW.get(idx);
                        %>
                        <p class="table-description"><%= stt[cv.getStatus()] %></p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>