<%-- 
    Document   : postRecruitmentJob
    Created on : Oct 13, 2022, 2:38:29 PM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                      <title>Post Recruitment Page</title>
    </head>
    <body>
  <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>  
        <div class="header row">
            <div class="col-md-4">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-8">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="postRecruitmentJob" class="active-page">Post Recruitment</a></li>
                    <li><a href="MainController?action=ViewPersonal">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
            <div class="container row">
                <h1 class="page-title">Post Recruitment</h1>
                <div class="profile-information">
                    <form action="MainController" method="post" >
                    <table>
                        <tr><td><div class="info-title2">
                                    <p2>Job tittle:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtjobtittle" required="" ></td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Experience Requirement:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtexpReq" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Education Requirement:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txteduReq" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Salary:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtSalary" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Description:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtDesc" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Image:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtImg" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Quantity:</p2>
                                </div> </td>
                            <td> <input type="text" class="input-form" name="txtQuantity" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Date from:</p2>
                                </div> </td>
                            <td> <input type="date" class="input-form" name="txtDatefrom" required="" > </td></tr>
                        <tr><td><div class="info-title2">
                                    <p2>Date to:</p2>
                                </div> </td>
                            <td> <input type="date" class="input-form" name="txtDateto" required="" > </td></tr>
                        <tr><td></td><td> <button type="submit" name="action" value="CREATE JOB"  class="submit-button" >Post</button></td></tr>
                    </table>
                    </form>
                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
