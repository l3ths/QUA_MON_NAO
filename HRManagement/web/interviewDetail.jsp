<%-- 
    Document   : interviewDetail
    Created on : Nov 3, 2022, 10:56:52 PM
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
        <title>Interview Detail</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <%
        ArrayList<String> listName = (ArrayList<String>) request.getAttribute("listName");
        ArrayList<InterviewingDTO> listIW = (ArrayList<InterviewingDTO>) request.getAttribute("listIW");
        JobDTO Job = (JobDTO) request.getAttribute("Job");
    %>
    <body>
        <%--<c:if test="${sessionScope.role==null||sessionScope.role ne 'interviewer'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>--%>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="interviewSchedule.jsp" class="active-page">Interview Schedule</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">Interview detail</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="detail-name">
                        <h2 style="margin-top: 30%;"><%= Job.getName()%></h2>
                    </div>
                </div>
                <div class="col-md-8 detail-table">
                    <p><span>Question 1:</span> If they had a magic wand, what would your customers change about their experiences with your product?</p>
                    <p><span>Question 2:</span> Are the changes because of something you changed on your site, something different about your product, or something in the market?</p>
                    <p><span>Question 3:</span> Is the experience consistent across all channels?</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Name</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">CV</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Score</h3>
                    </div>
                </div>
            </div>

            <%
                for (int i = 0; i < listIW.size(); i++) {
                    InterviewingDTO get = listIW.get(i);
            %>
            <form action="MainController" method="post">
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form" style="height: 200px;">
                        <p class="table-description" style="margin-top: 25%;"><%= listName.get(i)%></p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form table-link" style="height: 200px; padding-top: 25%;">
                        <a href="#">Detail</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form" style="height: 200px;">
                        <input placeholder="Score" type="number" name="score" value="<%= (get.getScore() == null) ? "" : get.getScore()%>">
                        <input type="hidden" value="<%= get.getCvID()%>" name="CVID" />
                    </div>
                </div>
            </div>
            
                <div style="width: 150px; margin-right:40px; margin-bottom: 30px; margin-top: 20px; float: right;">
                    <input type="hidden" name="CVID" value="<%= get.getCvID() %>" />
                    <input type="hidden" name="JobID" value="<%= get.getJobID()%>" />
                    <button type="submit" name="action" value="MarkCandidate" ><%= (get.getScore() == null) ? "Mark":"Update" %></button>
                </div>
            </form>
            <%
                }
            %>


        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>