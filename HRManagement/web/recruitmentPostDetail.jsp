<%-- 
    Document   : recruitmentPostDetail
    Created on : Oct 21, 2022, 1:50:22 AM
    Author     : ADMIN
--%>

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
        <%--     <c:if test="${sessionScope.role==null||sessionScope.role ne 'hr'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>
        --%>
        <div class="header row">
            <div class="col-md-5">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-7">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="recruitmentPostDetail" class="active-page">Post Detail</a></li>
                    <li><a href="MainController?action=ViewPersonal">Personal</a></li>
                    <li><a href="MainController?action=Logout">Log out</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <h1 class="page-title">Interview Schedule</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="detail-name">
                        <h2 style="margin-top: 10%;">Marketing</h2>
                    </div>
                    <button value="" class="submit-button" style="margin: 15px auto;">Edit</button>
                    <button value="" class="submit-button" style="margin: 15px auto;">Schedule</button>
                </div>
                <div class="col-md-8 detail-table">
                    <p><span>Experience:</span> 2 year at Marketing</p>
                    <p><span>Education:</span> Graduated from university</p>
                    <p><span>Salary:</span> up to 2000 USD</p>
                    <p><span>Description:</span> Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.</p>
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
                    <tr class="border-form">
                        <td class="table-description border-form">Truong Tan Trung</td>
                        <td class="table-description border-form">11/12/2002</td>
                        <td class="table-description border-form">trung@gmail.com</td>
                        <td class="table-description border-form">0927352647</td>
                        <td class="table-description border-form">Certification 5</br>Certification 4</td>
                        <td class="table-description border-form">Harvard University</td>
                        <td class="table-description border-form">Manager: 1 year</td>
                    </tr>
                    <tr class="border-form">
                        <td class="table-description border-form">Nguyen Trung Tan</td>
                        <td class="table-description border-form">15/11/2000</td>
                        <td class="table-description border-form">tan@gmail.com</td>
                        <td class="table-description border-form">0942378423</td>
                        <td class="table-description border-form">Certification 1</br>Certification 2</td>
                        <td class="table-description border-form">Ho Chi Minh College</td>
                        <td class="table-description border-form">Coder: 2 years</td>
                    </tr>
                    <tr class="border-form">
                        <td class="table-description border-form">Tran Tan Trung</td>
                        <td class="table-description border-form">09/09/1999</td>
                        <td class="table-description border-form">trantrung@gmail.com</td>
                        <td class="table-description border-form">0934411324</td>
                        <td class="table-description border-form">Certification 3</br>Certification 2</td>
                        <td class="table-description border-form">Cambridge</td>
                        <td class="table-description border-form">Marketing: 2 years</td>
                    </tr>
                    <tr class="border-form">
                        <td class="table-description border-form">Nguyen Thi Nhu Trung</td>
                        <td class="table-description border-form">08/05/1995</td>
                        <td class="table-description border-form">nhutrung@gmail.com</td>
                        <td class="table-description border-form">038897249</td>
                        <td class="table-description border-form">Certification 7</br>Certification 6</td>
                        <td class="table-description border-form">FPT University</td>
                        <td class="table-description border-form">BA: 4 years</td>
                    </tr>
                </tbody>
            </table>
            <div class="page-pagination">
                <ul>
                    <li><a href="#" class="active">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
