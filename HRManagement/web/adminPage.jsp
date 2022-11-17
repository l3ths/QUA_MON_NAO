<%-- 
    Document   : adminPage
    Created on : Nov 17, 2022, 11:47:03 PM
    Author     : ThinkPad T490
--%>

<%@page import="core.dto.AccountDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<AccountDTO> accList = (ArrayList<AccountDTO>) request.getAttribute("accList");
            ArrayList<Integer> sttList = (ArrayList<Integer>) request.getAttribute("sttList");
            String stt[] = {"Blocked", "Active"};
        %>
        <form action="MainController" method="post">
            <table>
                <tr><th>Email</th><th>Role</th><th>Status</th><th>Action</th></tr>
                        <%
                            for (int i = 0; i < accList.size(); i++) {
                                AccountDTO get = accList.get(i);
                        %>
                <tr>
                    <td><%= get.getEmail()%></td>
                    <td><%= get.getAccrole()%></td>
                    <td><%= stt[sttList.get(i)]%></td>
                    <%
                        if (sttList.get(i) == 1) {
                    %>
                    <td><button name="action" value="BlockAccount">Block</button></td>
                    <%
                    } else {
                    %>
                    <td><button name="action" value="UnblockAccount">Unblock</button></td>
                    <%
                        }
                    %>

                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
