<%-- 
    Document   : registerCandPage
    Created on : Oct 9, 2022, 12:12:29 PM
    Author     : ThinkPad T490
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <header class="header row">
            <div class="col-md-6">
                <h1>Toidiyuh</h1>
            </div>
            <div class="col-md-6">
                <ul>
                    <li><a href="MainController?action=ShowJob">Home</a></li>
                    <li><a href="loginPage.jsp">Login</a></li>
                    <li><a href="registerCandPage.jsp" class="active-page">Register</a></li>
                </ul>
            </div>
        </header>
        <section>
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100">
                        <div class="login100-form">
                            <h1>Register</h1>
                            <%
                                String registerEmail = (String) request.getAttribute("reqEmail");
                            %>
                            <form action="MainController" method="post">
                                <%if (registerEmail == null) {
                                %>
                                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                    <input class="input100" type="text" name="txtemail" value="<%= (registerEmail != null) ? registerEmail : ""%>">
                                    <span class="focus-input100" data-placeholder="Email"></span>
                                </div>

                                <button type="submit" value="checkEmail" name="action" class="submit-button">Continue</button>
                                <% } else {
                                %>
                                <input type="hidden" class="input" readonly="" value="<%= registerEmail%>" >
                                <% }%>
                                <%if (request.getParameter("verify") != null) {
                                %>
                                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                    <input class="input100" type="text" name="txtvcode" >
                                    <span class="focus-input100" data-placeholder="Verify-code"></span>
                                </div>
                                <input type="hidden" value="<%= registerEmail %>" name="reEmail" />
                                <button type="submit" value="VerifyCode" name="action" class="submit-button">Continue</button>
                                <% }%>
                            </form>

                            <p style="color: red"> <%= (request.getParameter("wrongpass") != null) ? "Password do not match!" : ""%></p>
                            <%
                                if (request.getParameter("verified") != null) {
                            %>
                            <%@include file="registerPage2.jsp" %>
                            <% }%>
                            <p style="color: #dfa974"> <%= (request.getParameter("stt") != null) ? "Email already exists!!!" : ""%></p>
                            <p style="color: #dfa974"> <%= (request.getParameter("vstt") != null) ? "Verify-code invalid!!!" : ""%></p>
                            <p style="color: #dfa974"> <%= (request.getParameter("valstt") != null) ? "Email invalid!!!" : ""%></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
