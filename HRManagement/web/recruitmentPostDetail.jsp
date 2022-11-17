<%-- 
    Document   : recruitmentPostDetail
    Created on : Oct 21, 2022, 1:50:22 AM
    Author     : ADMIN
--%>

<%@page import="core.dto.CandidateDTO"%>
<%@page import="core.dto.CVDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="core.dto.JobDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment Post Detail</title>
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
        <header class="header row">
            <div class="col-md-4">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-8">
                <ul>
                    <li><a href="MainController?action=ViewPersonal" class="active-page">Personal</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </header>
        <%
            JobDTO Job = (JobDTO) request.getAttribute("Job");
            ArrayList<CVDTO> listCV = (ArrayList<CVDTO>) request.getAttribute("listCV");
            ArrayList<CandidateDTO> listCan = (ArrayList<CandidateDTO>) request.getAttribute("listCan");
        %>
        <div class="container">
            <h1 class="page-title">Interview Schedule</h1>
            <form action="MainController" method="post"> 
                <div class="row">
                    <div class="col-md-4">
                        <div class="detail-name">
                            <h2 style="margin-top: 10%;"><%= Job.getName()%></h2>
                        </div>
                        <input type="hidden" value="<%= Job.getJobID()%>" name="JobID">
                        <button type="submit" name="action" value="editRecruitmentPost" class="submit-button" style="margin: 15px auto;">Edit</button>
                        <button type="submit" name="action" value="ScheduleInterview" class="submit-button" style="margin: 15px auto;">Schedule</button>
                    </div>

                    <div class="col-md-8 detail-table">
                        <p><span>Experience:</span> <%= Job.getExperienceRequirement()%> at <%= Job.getName()%></p>
                        <p><span>Education:</span> <%= Job.getEducationRequirement()%></p>
                        <p><span>Salary:</span> up to <%= Job.getSalary()%> USD</p>
                        <p><span>Description:</span> <%= Job.getDesription()%></p>
                    </div>

                </div>
                <table border="1" style="margin: 20px auto;">
                    <thead>
                        <tr>
                            <th class="table-header border-form">Full Name</th>
                            <th class="table-header border-form">Date of birth</th>
                            <th class="table-header border-form">Email</th>
                            <th class="table-header border-form">Phone number</th>
                            <th class="table-header border-form">Certification</th>
                            <th class="table-header border-form">Education</th>
                            <th class="table-header border-form">Experience</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listCV.size(); i++) {
                                CVDTO get = listCV.get(i);
                        %>
                        <tr class="border-form">
                            <td class="table-description border-form"><%= listCan.get(i).getName()%></td>
                            <td class="table-description border-form"><%= listCan.get(i).getBirthdate()%></td>
                            <td class="table-description border-form"><%= listCan.get(i).getEmail()%></td>
                            <td class="table-description border-form"><%= listCan.get(i).getPhone()%></td>
                            <td class="table-description border-form">Certification 5</br>Certification 4</td>
                            <td class="table-description border-form"><%= get.getEducation()%></td>
                            <td class="table-description border-form"><%= get.getExperience()%> in <%= Job.getName()%></td>
                            <td><input type="checkbox" name="<%= get.getCvid()%>" value="true" /></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </form> 
        </div>
    </body>
    <%
        if (request.getParameter("msg") != null) {
    %>
    <script type="text/javascript">
        alert("Must choose at least 1 candidate!");
    </script> <%
    }
    %>
</html>
