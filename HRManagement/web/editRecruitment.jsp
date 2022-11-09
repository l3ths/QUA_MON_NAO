<%-- 
    Document   : recruitmentManagement
    Created on : Oct 21, 2022, 12:27:22 AM
    Author     : ADMIN
--%>

<%@page import="core.dto.JobDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment Management</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <%--    <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if> --%>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="editRecruitment.jsp" class="active-page">Edit Recruitment</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <%
                JobDTO Job = (JobDTO) request.getAttribute("Job");
            %>
            <h1 class="page-title">Edit Recruitment</h1>
            <div class="profile-information">
            <form action="MainController" method="post">
                <table>
                <tr><td><div class="info-title2">
                            <p2>Experience Requirement</p2>
                        </div> </td>
                    <td><div class="input-border">
                            <input type="text" name="" value="<%= Job.getExperienceRequirement()%> at <%= Job.getName()%>" class="input"/>
                        </div> </td></tr>
                <tr><td><div class="info-title2">
                            <p2>Education Requirement</p2>
                        </div> </td>
                    <td><div class="input-border">
                            <input type="text" name="" value="<%= Job.getEducationRequirement()%>" class="input"/>
                        </div> </td></tr>
                <tr><td><div class="info-title2">
                            <p2>Salary:</p2>
                        </div> </td>
                    <td><div class="input-border">
                            <input type="text" name="" value="<%= Job.getSalary()%> USD" class="input"/>
                        </div> </td></tr>
                <tr><td><div class="info-title2">
                            <p2>Description:</p2>
                        </div> </td>
                    <td><div class="input-border">
                            <input type="text" name="" value="<%= Job.getDesription()%>" class="input"/>
                        </div> </td></tr>
                <tr>
                    <td>
                        <button type="submit" name="action" value="" class="submit-button">Cancel</button>
                    </td>
                    <td>
                        <button type="submit" name="action" value="editPost" class="submit-button">Save</button>
                    </td>
                </tr>
                </table>
            </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
