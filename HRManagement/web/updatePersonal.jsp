<%-- 
    Document   : updatePersonal
    Created on : Sep 26, 2022, 8:48:03 PM
    Author     : ThinkPad T490
--%>

<%@page import="core.dto.CandidateDTO"%>
<%@page import="core.dto.EmployeeDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <c:if test="${sessionScope.role eq 'candidate'}">
                        <li><a href="MainController?action=ShowJob" class="active-page">Home</a></li>
                        <li><a href="candidatePage.jsp">Personal</a></li>
                        </c:if>
                        <c:if test="${sessionScope.role eq 'hr'}">
                        <li><a href="hrPage.jsp">Personal</a></li>
                        </c:if>
                        <c:if test="${sessionScope.role eq 'hr manager'}">
                        <li><a href="hrManagerPage.jsp">Personal</a></li>
                        </c:if>
                        <c:if test="${sessionScope.role eq 'interviewer'}">
                        <li><a href="interviewerPage.jsp">Personal</a></li>
                        </c:if>
                    <li><a href="personalPage.jsp" class="active-page">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <h1 class="page-title">Update Profile</h1>
        <form action="MainController" method="post">
            <%
                String role = (String) session.getAttribute("role");
                if (!role.equals("candidate")) {
                    EmployeeDTO emp = (EmployeeDTO) session.getAttribute("LOGIN_EMP");
            %>
            <div class="profile-information row" style="width: 600px; margin: 100px auto;">
                <div class="col-md-4" style="margin-top: 3.5%;">
                    <p1>Full name:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="text" class="input" name="txtnewname" required="" value="<%= emp.getEmname()%>">
                </div>
                <div class="col-md-4" style="margin-top: 3.5%;">
                    <p1>Date of birth:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="date" class="input" name="txtnewbirthdate" required="" value="<%= emp.getBirthdate()%>">
                </div>
                <div class="col-md-4" style="margin-top: 3.5%;">
                    <p1>Phone number:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="text" class="input" name="txtnewphone" required="" value="<%= emp.getEmphone()%>">
                </div>
                <div style="margin-left: 40%;">
                    <input type="hidden" name="txtemail" value="<%=emp.getEmemail()%>" >
                    <button type="submit" name="action" value="UPDATE PROFILE"  class="submit-button" >Update</button>
                </div>
            </div>
            <%
            } else {
                CandidateDTO can = (CandidateDTO) session.getAttribute("LOGIN_CDD");
            %>
            <div class="profile-information row" style="width: 600px; margin: 100px auto;">
                <div class="col-md-4" style="margin-top: 4%;">
                    <p1>Full name:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="text" class="input" name="txtnewname" required="" value="<%= can.getName()%>">
                </div>
                <div class="col-md-4" style="margin-top: 4%;">
                    <p1>Date of birth:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="date" class="input" name="txtnewbirthdate" required="" value="<%= can.getBirthdate()%>">
                </div>
                <div class="col-md-4" style="margin-top: 4%;">
                    <p1>Phone number:</p1>
                </div>
                <div class="col-md-8 input-border">
                    <input type="text" class="input" name="txtnewphone" required="" value="<%= can.getPhone()%>">
                </div>
                <div style="margin-left: 40%;">
                    <input type="hidden" name="txtemail" value="<%=can.getEmail()%>" >
                    <button type="submit" name="action" value="UPDATE PROFILE"  class="submit-button">Update</button>
                </div>
            </div>
            <%
                }
            %>         
        </form>
        <%@include file="footer.jsp" %>    
    </body>
</html>
