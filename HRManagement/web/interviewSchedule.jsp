<%-- 
    Document   : interviewSchedule
    Created on : Oct 28, 2022, 1:37:05 PM
    Author     : ADMIN
--%>


<%@page import="core.dto.JobDTO"%>
<%@page import="core.dto.EmployeeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interview Schedule</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect> 
        </c:if>
        <%
            ArrayList<EmployeeDTO> listInterviewer = (ArrayList<EmployeeDTO>) request.getAttribute("listInterviewer");
            JobDTO Job = (JobDTO) request.getAttribute("Job");
        %>
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
            <h1 class="page-title">Interview schedule</h1>
            <h3 class="page-title" style="font-size: 20px" ><%= Job.getName()%></h3>
            <form action="MainController" method="post" style="width: 500px; margin: 100px auto;">
                <input type="hidden" name="JobID" value="<%= Job.getJobID()%>" />
                <div class="input-border">
                    <p>Interviewer :</p>
                    <%
                        for (int i = 0; i < listInterviewer.size(); i++) {
                            EmployeeDTO get = listInterviewer.get(i);
                    %>
                    <input type="checkbox" name="<%= get.getEid()%>" value="true"/>
                    <label for="<%= get.getEid()%>"><%= get.getEmname()%></label><br>
                    <%
                        }
                    %>
                </div>
                <div class="input-border">
                    <input required="" type="date" name="date" placeholder="Set Day" class="input"/>
                </div>
                <div class="input-border">
                    <input required="" type="time" name="time" placeholder="Set Time" class="input"/>
                </div>
                <div class="input-border">
                    <input required="" type="text" name="questtion" placeholder="Questions" class="input"/>
                </div>
                <button type="submit" name="action" value="SubmitSchedule" class="submit-button">Submit</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>