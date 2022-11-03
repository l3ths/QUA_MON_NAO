<%-- 
    Document   : interviewSchedule
    Created on : Oct 28, 2022, 1:37:05 PM
    Author     : ADMIN
--%>


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
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'interviewer'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
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
            <h1 class="page-title">Interview schedule</h1>
            <form action="MainController" style="width: 500px; margin: 100px auto;">
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Job Title" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Candidate" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Interviewer" class="input"/>
                </div>
                <div class="input-border">
                    <input type="datetime-local" name="" value="" placeholder="Set Time" class="input"/>
                </div>
                <div class="input-border">
                    <input type="text" name="" value="" placeholder="Questions" class="input"/>
                </div>
                <button type="submit" name="action" value="" class="submit-button">Submit</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>