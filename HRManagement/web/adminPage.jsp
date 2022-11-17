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
    </head>
    <body>
        <%--<c:if test="${sessionScope.role==null||sessionScope.role ne 'admin'}">
            <c:redirect url="loginPage.jsp"></c:redirect>
        </c:if>--%>
        <%
            ArrayList<AccountDTO> accList = (ArrayList<AccountDTO>) request.getAttribute("accList");
            ArrayList<Integer> sttList = (ArrayList<Integer>) request.getAttribute("sttList");
            String stt[] = {"Blocked", "Active"};
        %>

        <table>
            <tr><th>Email</th><th>Role</th><th>Status</th><th>Action</th></tr>
                    <%
                        for (int i = 0; i < accList.size(); i++) {
                            AccountDTO get = accList.get(i);
                    %>
            
                <tr>
                    <form action="MainController" method="post">
                    <td><%= get.getEmail()%></td>
                    <td><%= get.getAccrole()%></td>
                    <td><%= stt[sttList.get(i)]%></td>
                <input type="hidden" name="email" value="<%= get.getEmail()%>"/>
                <input type="hidden" name="stt" value="<%= sttList.get(i)%>"/>
                <td><button name="action" value="BUAccount">
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
                    </button></td>
                    </form>
                </tr>
            
            <%
                }
            %>
        </table>
        <form>
            <button name="action" value="">Create Employee Account</button>
        </form>
        
    </body>
</html>
