<%-- 
    Document   : hrManagerPage
    Created on : Oct 7, 2022, 1:48:11 AM
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
        <title>HR Manager Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <%
        ArrayList<String> listID = (ArrayList<String>) request.getAttribute("listID");
        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) request.getAttribute("listJob");
        ArrayList<Integer> listStatus = (ArrayList<Integer>) request.getAttribute("listStatus");
        ArrayList<Integer> listQuantity = (ArrayList<Integer>) request.getAttribute("listQuantity");
        String[] stt = {"Processing", "Done", "Completed"};
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
            <h1 class="page-title">Recruitment Management</h1>
            <div class="row">
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Job name</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Status</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">No Required</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Passed</h3>
                    </div>
                </div>
            </div>

            <%
                for (int i = 0; i < listJob.size(); i++) {
            %>
            <div class="row">
                <div class="col-md-3">
                    <div class="border-form short-form">
                        <p class="table-description"><%= listJob.get(i).getName()%></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form short-form">
                        <p class="table-description"><%= stt[listStatus.get(i)]%></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form short-form">
                        <p class="table-description"><%= listQuantity.get(i)%></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form short-form">
                        <%
                            if (listStatus.get(i) == 0) {
                        %>
                        <p class="table-description"><%= stt[listStatus.get(i)]%></p>
                        <%
                        } else if (listStatus.get(i) == 1) {
                        %>
                        <form action="MainController" method="post">
                            <input type="hidden" name="ITVID" value="<%= listID.get(i)%>" />
                            <p class="table-description"><%= stt[listStatus.get(i)]%></p>
                            <button class="button-link" type="submit" name="action" value="ViewPassed" >View Candidate List</button>
                        </form>
                        <%
                            } else {%>
                        <p class="table-description"><%= stt[listStatus.get(i)]%></p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
