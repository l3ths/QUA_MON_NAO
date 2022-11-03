<%--
    Document   : homePage
    Created on : Sep 19, 2022, 10:01:08 PM
    Author     : thanhhuy
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/fontawesomecss" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin&display=swap" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.role eq 'candidate'}">
            <div class="header row">
                <div class="col-md-6">
                    <h1>Toidiyuh</h1>
                </div>
                <div class="col-md-6">
                    <ul>
                        <li><a href="MainController?action=ShowJob" class="active-page">Home</a></li>
                        <li><a href="candidatePage.jsp">Personal</a></li>
                        <li><a href="personalPage.jsp">Profile</a></li>
                        <li><a href="MainController?action=Logout">Log out</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.role==null}">
            <div class="header row">
                <div class="col-md-6">
                    <h1>Toidiyuh</h1>
                </div>
                <div class="col-md-6">
                    <ul>
                        <li><a href="MainController?action=ShowJob" class="active-page">Home</a></li>
                        <li><a href="loginPage.jsp">Login</a></li>
                        <li><a href="registerCandPage.jsp">Register</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <div class="container">
            <img src="img/background.jpg" alt="background" class="background-img">
            <div>
                <form action="MainController">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="input-border">
                                <input type="search" name="searchName" value="${param.searchName}" placeholder="Search for jobs" class="input"/>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="input-border">
                                <select name="searchSalary" class="input">
                                    <c:if test="${param.searchSalary > 0}">
                                        <option value="${param.searchSalary}">${param.searchSalary}</option>
                                    </c:if>
                                    <option value="0">Salary</option>
                                    <% for (int salary = 1000; salary <= 5000; salary += 500) {%>
                                    <option value="<%=salary%>">><%=salary%></option>
                                    <%
                                        }%>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div style="margin-top: 10px">
                                <button type="submit" name="action" value="SearchJob" class="input-button">Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <c:if test="${requestScope.LIST_JOB != null}">
                <div class="row job">
                    <c:if test="${not empty requestScope.LIST_JOB}">
                        <c:forEach var="job" varStatus="counter" items="${requestScope.LIST_JOB}">
                            <div class="col-md-4">
                                <form action="MainController" class="border-form">
                                    <img src="img/job/${job.imgPath}">
                                    <h3 class="job-title">${job.name}</h3>
                                    <div class="job-description row">
                                        <div class="col-md-6">
                                            <p>Salary:</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${job.salary}</p>
                                        </div>
                                    </div>
                                    <div class="job-description row">
                                        <div class="col-md-6">
                                            <p>Experience Requirement:</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${job.experienceRequirement}</p>
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" value="${job.jobID}" name="jobID" />
                                    </div>
                                    <button type="submit" name="action" value="ViewJobDetail">More Detail</button>
                                </form>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </c:if>
            <div class="page-pagination">
                <ul>
                    <c:if test="${requestScope.TAG > 1}">
                        <li><a href="MainController?action=SearchJob&index=${requestScope.TAG - 1}&searchName=${param.searchName == null ? "" : param.searchName}&searchSalary=${param.searchSalary  == null ? "0" : param.searchSalary}">Previous</a></li>
                        </c:if>
                        <c:forEach begin="1" end="${requestScope.END_PAGE}" var="index">
                        <li><a class="${requestScope.TAG == index ? "active" : ""}" href="MainController?action=SearchJob&index=${index}&searchName=${param.searchName == null ? "" : param.searchName}&searchSalary=${param.searchSalary  == null ? "0" : param.searchSalary}">${index}</a></li>
                        </c:forEach>
                        <c:if test="${requestScope.TAG < requestScope.END_PAGE}">
                        <li><a href="MainController?action=SearchJob&index=${requestScope.TAG + 1}&searchName=${param.searchName == null ? "" : param.searchName}&searchSalary=${param.searchSalary  == null ? "0" : param.searchSalary}">Next</a></li>
                        </c:if>
                </ul>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
