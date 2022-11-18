<%-- 
    Document   : adminPage
    Created on : Nov 17, 2022, 11:47:03 PM
    Author     : ThinkPad T490
--%>

<%@page import="core.dto.AccountDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role==null||sessionScope.role ne 'admin'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        <%
            ArrayList<AccountDTO> accList = (ArrayList<AccountDTO>) request.getAttribute("accList");
            ArrayList<Integer> sttList = (ArrayList<Integer>) request.getAttribute("sttList");
            String stt[] = {"Blocked", "Active"};
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
            <h1 class="page-title">Manage Account</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="border-form">
                        <h3 class="table-header">Email</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Role</h3>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="border-form">
                        <h3 class="table-header">Status</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="border-form">
                        <h3 class="table-header">Action</h3>
                    </div>
                </div>
            </div>
            <%
                for (int i = 0; i < accList.size(); i++) {
                    AccountDTO get = accList.get(i);
            %>
            <div class="row">
                <form action="MainController" method="post">
                    <div class="col-md-4">
                        <div class="border-form short-form">
                            <p class="table-description"><%= get.getEmail()%></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="border-form short-form">
                            <p class="table-description"><%= get.getAccrole()%></p>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="border-form short-form">
                            <p class="table-description"><%= stt[sttList.get(i)]%></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="border-form short-form">
                            <input type="hidden" name="email" value="<%= get.getEmail()%>"/>
                            <input type="hidden" name="stt" value="<%= sttList.get(i)%>"/>
                            <button class="submit-button" style="margin-top: 0;" name="action" value="BUAccount">
                                <%
                                    if (sttList.get(i) == 1) {
                                %>
                                Block
                                <%
                                } else {
                                %>
                                Unblock
                                <%
                                    }
                                %>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <%
                }
            %>
            <form action="createEmployee.jsp">
                <button name="action" class="submit-button" value="">Create Employee Account</button>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <%
        if (request.getParameter("regstt") != null) {
    %>
    <script type="text/javascript">
        alert("Create account successfull!");
    </script> <%
    }
    %>
</html>
