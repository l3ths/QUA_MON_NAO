<%-- 
    Document   : approveCandidate
    Created on : Nov 3, 2022, 11:45:22 PM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@page import="core.dto.InterviewingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Candidate</title>
    </head>
    <%
        ArrayList<InterviewingDTO> listIW = (ArrayList<InterviewingDTO>) request.getAttribute("listIW");
        ArrayList<String> listName = (ArrayList<String>) request.getAttribute("listName");
        JobDTO Job = (JobDTO) request.getAttribute("Job");
        String ITVID = (String) request.getAttribute("ITVID");
    %>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr manager'}">
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
            <h1 class="page-title">Approve Candidate</h1>
            <div class="detail-table">
                <p style="font-size: 35px; color: black;"><%= Job.getName()%></p>
                <p><span>Required:</span> 2</p>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Name</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">CV</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Score</h3>
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>
            <form action="MainController" method="post">
                <%
                    for (int i = 0; i < listIW.size(); i++) {
                        InterviewingDTO get = listIW.get(i);
                %>
                <div class="row">
                    <div class="col-md-4">
                        <div class="border-form short-form">
                            <p class="table-description"><%= listName.get(i)%></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="border-form short-form">
                            <input type="hidden" name="CVID" value="<%= get.getCvID()%>">
                            <button type="submit" name="action" value="viewCV" class="button-link">View</button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border-form short-form">
                            <p class="table-description"><%= get.getScore()%></p>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <input type="checkbox" id="<%= get.getCvID()%>" name="<%= get.getCvID()%>" value="true" />
                            <label for="<%= get.getCvID()%>"></label>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

                <input type="hidden" name="ITVID" value="<%= ITVID%>" />
                <button onclick="confirmButton()" type="submit" name="action" value="ApproveCandidate" >Approve</button>
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
