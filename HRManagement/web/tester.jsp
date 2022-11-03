<%-- 
    Document   : tester
    Created on : Oct 12, 2022, 3:24:59 PM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("email", "trungttse160105@fpt.edu.vn");
        %>
        <a href="ViewPersonalController"> link ne</a>
        <form action="MainController" method="post" >
            
            <input type="submit" value="ViewPersonal" name="action" />
        </form>
    </body>
</html>
