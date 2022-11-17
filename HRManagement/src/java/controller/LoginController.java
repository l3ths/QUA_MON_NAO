/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.AccountDAO;
import core.dao.CandidateDAO;
import core.dao.EmployeeDAO;
import core.dto.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPad T490
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String msg = request.getParameter("msg");
            String save = request.getParameter("savelogin");
            AccountDTO acc = null;
            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie aCookie : c) {
                            if (aCookie.getName().equals("selector")) {
                                token = aCookie.getValue();
                            }
                        }
                    }
                    if (!token.equals("")) {
                        response.sendRedirect("ShowJobController");
                    } else {
                        response.sendRedirect("loginPage.jsp");
                    }
                } else {
                    acc = AccountDAO.getAccount(email, password);
                    if (acc != null) {
                        if (acc.getAccrole().equals("hr")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_EMP", EmployeeDAO.getEmployee(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("ViewPersonalController");
                            }
                        } else if (acc.getAccrole().equals("hr manager")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_EMP", EmployeeDAO.getEmployee(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("ViewPersonalController");
                            }
                        } else if (acc.getAccrole().equals("interviewer")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_EMP", EmployeeDAO.getEmployee(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("ViewPersonalController");
                            }
                        } else if (acc.getAccrole().equals("candidate")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_CDD", CandidateDAO.getCandidate(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("ViewPersonalController");
                            }
                        } else if (acc.getAccrole().equals("admin")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_EMP", EmployeeDAO.getEmployee(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("ViewPersonalController");
                            }
                        } else if (acc.getAccrole().equals("employee")) {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("email", acc.getEmail());
                                session.setAttribute("role", acc.getAccrole());
                                session.setAttribute("LOGIN_CDD", CandidateDAO.getCandidate(email));
                                if (save != null) {
                                    String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
                                                + "lmnopqrstuvwxyyz!@#$%^&";
                                    Random rnd = new Random();
                                    StringBuilder sb = new StringBuilder(7);
                                    for (int i = 0; i < 7; i++) {
                                        sb.append(chars.charAt(rnd.nextInt(chars.length())));
                                    }
                                    String token = sb.toString();
                                    boolean a = AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 60);
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("employeePage.jsp");
                            }

                        }
                    } else {
                        response.sendRedirect("loginPage.jsp?loginstt=0");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
