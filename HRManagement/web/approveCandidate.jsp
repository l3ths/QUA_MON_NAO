<%-- 
    Document   : approveCandidate
    Created on : Nov 3, 2022, 11:45:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Candidate</title>
    </head>
    <body>
        <%--<c:if test="${sessionScope.role==null||sessionScope.role ne 'hr manager'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>--%>
        <div class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="approveCandidate.jsp" class="active-page">Approve Candidate</a></li>
                    <li><a href="personalPage.jsp">Profile</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">Approve Candidate</h1>
            <div class="detail-table">
                <p style="font-size: 35px; color: black;">Marketing</p>
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
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form" style="height: 200px;">
                        <p class="table-description" style="margin-top: 80px;">Huy</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form" style="height: 200px;">
                        <div class="table-link" style="margin-top: 80px;">
                            <a href="#" >View</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border-form" style="height: 200px;">
                        <p class="table-description" style="margin-top: 80px;">80/85/85</p>
                    </div>
                </div>
                <div class="col-md-1">
                    <input class="input" type="checkbox" style="margin-top: 80px;">
                </div>
            </div>
            <div style="width: 150px; margin-right:40px; margin-bottom: 30px; margin-top: 20px; float: right;">
                <a href="#" class="link-button">Confirm</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>