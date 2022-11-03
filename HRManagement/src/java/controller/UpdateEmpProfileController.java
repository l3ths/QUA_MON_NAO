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
import core.dto.CandidateDTO;
import core.dto.EmployeeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinkPad T490
 */
@WebServlet(name = "UpdateEmpProfileController", urlPatterns = {"/UpdateEmpProfileController"})
public class UpdateEmpProfileController extends HttpServlet {

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
            String newname = request.getParameter("txtnewname");
            String email = request.getParameter("txtemail");
            String newbirthdate = request.getParameter("txtnewbirthdate");
            String newphone = request.getParameter("txtnewphone");
            AccountDTO acc = AccountDAO.getAccount(email);
            if (!acc.getAccrole().equals("candidate")) {
                EmployeeDTO emp = EmployeeDAO.getEmployee(email);
                if (emp != null) {
                    if (EmployeeDAO.updateEmployee(email, newname, newphone, newbirthdate)) {
                        request.getRequestDispatcher("personalPage.jsp").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("homePage.jsp").forward(request, response);
                }
            } else {
                CandidateDTO can = CandidateDAO.getCandidate(email);
                if (can != null) {
                    if (CandidateDAO.updateCandidate(email, newname, newphone, newbirthdate)) {
                        request.getRequestDispatcher("personalPage.jsp").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("homePage.jsp").forward(request, response);
                }
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
