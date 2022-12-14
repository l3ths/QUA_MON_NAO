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
        String ITVID = (String) request.getAttribute("ITVID");
        String question = (String) request.getAttribute("question");
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
            <h1 class="page-title">Interview detail</h1>
            <div class="row">
                <div class="col-md-5">
                    <div class="detail-name">
                        <h2><%= Job.getName()%></h2>
                    </div>
                </div>
                <div class="col-md-7 detail-table">
                    <p><span><%= question %></span></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Name</h3>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="border-form">
                        <h3 class="table-header">CV</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Score</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Mark</h3>
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
                        <div class="border-form short-form">
                            <p class="table-description"><%= listName.get(i)%></p>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="border-form short-form table-link">
                            <a class="button-link" href="ViewCVController?CVID=<%= get.getCvID()%>">View</a>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="border-form short-form">
                            <input class="input" placeholder="Score" type="number" name="score" value="<%= (get.getScore() == null) ? "" : get.getScore()%>">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="border-form short-form">
                            <input type="hidden" name="CVID" value="<%= get.getCvID()%>" />
                            <input type="hidden" name="ITVID" value="<%= ITVID%>" />
                            <button style="margin-top: 0;" type="submit" class="submit-button" name="action" value="MarkCandidate" ><%= (get.getScore() == null) ? "Mark" : "Update"%></button>
                        </div>
                    </div>
                </div>
            </form>
            <%
                }
            %>
            <form action="MainController" method="post">
                <input type="hidden" name="ITVID" value="<%= ITVID%>" />
                <button onclick="confirmButton()" type="submit" name="action" value="SubmitInterview" class="submit-button" style="margin: 15px auto;">Submit</button>
            </form>

        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        function confirmButton() {
            confirm("Is all the information correct?");
        }
    </script>
</html>