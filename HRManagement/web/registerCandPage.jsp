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
                            <%if (registerEmail != null) {
                            %>
                            <form action="MainController" method="post">
                                <% } else {
                                %>
                                <form action="MainController" method="post" onSubmit="return ValidateEmail()">
                                    <% }%>
                                    <%if (registerEmail == null) {
                                    %>
                                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                        <input class="input100" type="text" name="txtemail" value="<%= (registerEmail != null) ? registerEmail : ""%>">
                                        <span class="focus-input100" data-placeholder="Email"></span>
                                    </div>

                                    <button type="submit" value="checkEmail" name="action" class="submit-button">Continue</button>
                                    <% } else {
                                    %>
                                    <input type="text" class="input" readonly="" value="<%= registerEmail%>" >
                                    <% }%>
                                    <%if (request.getParameter("verify") != null) {
                                    %>
                                    <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                                        <input class="input100" type="text" name="txtvcode" >
                                        <span class="focus-input100" data-placeholder="Verify-code"></span>
                                    </div>
                                    <input type="hidden" value="<%= registerEmail%>" name="reEmail" />
                                    <button type="submit" value="VerifyCode" name="action" class="submit-button">Continue</button>
                                    <% }%>
                                </form>

                                <p style="color: red"> <%= (request.getParameter("wrongpass") != null) ? "Password do not match!" : ""%></p>
                                <%
                                    if (request.getParameter("verified") != null) {
                                %>
                                <%@include file="registerPage2.jsp" %>
                                <% }%>
                                <p style="color: red"> <%= (request.getParameter("stt") != null) ? "Email invalid!!!" : ""%></p>
                                <p style="color: red"> <%= (request.getParameter("vstt") != null) ? "Verify-code invalid!!!" : ""%></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script language = "Javascript">

        function emailcheck(str) {

            var at = "@"
            var dot = "."
            var lat = str.indexOf(at)
            var lstr = str.length
            var ldot = str.indexOf(dot)
            if (str.indexOf(at) == -1) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.indexOf(at, (lat + 1)) != -1) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.indexOf(dot, (lat + 2)) == -1) {
                alert("Invalid E-mail ID")
                return false
            }

            if (str.indexOf(" ") != -1) {
                alert("Invalid E-mail ID")
                return false
            }
            alert("valid E-mail ID")
            return true
        }

        function ValidateEmail() {
            var emailID = document.frm.txtEmail

            if ((emailID.value == null) || (emailID.value == "")) {
                alert("Please Enter your Email Address")
                emailID.focus()
                return false
            }
            if (emailcheck(emailID.value) == false) {
                emailID.value = ""
                emailID.focus()
                return false
            }
            return true
        }
    </script>
</html>
