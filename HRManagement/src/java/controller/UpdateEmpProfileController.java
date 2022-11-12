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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ThinkPad T490
 */
@WebServlet(name = "UpdateEmpProfileController", urlPatterns = {"/UpdateEmpProfileController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateEmpProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String newname = request.getParameter("txtnewname");
            String email = request.getParameter("txtemail");
            String newbirthdate = request.getParameter("txtnewbirthdate");
            String newphone = request.getParameter("txtnewphone");
            String uploadFolder = request.getServletContext().getRealPath("/img/avatar");
            Path uploadPath = Paths.get(uploadFolder);
            if (!Files.exists(uploadPath)) {
                Files.createDirectory(uploadPath);
            }
            Part imgPart = request.getPart("txtnewimage");
            String imgFilename = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
            imgPart.write(Paths.get(uploadPath.toString(), imgFilename).toString());
            AccountDTO acc = AccountDAO.getAccount(email);
            if (!acc.getAccrole().equals("candidate")) {
                EmployeeDTO emp = EmployeeDAO.getEmployee(email);
                if (emp != null) {
                    if (EmployeeDAO.updateEmployee(email, newname, newphone, newbirthdate, imgFilename)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("LOGIN_EMP", EmployeeDAO.getEmployee(email));
                        request.getRequestDispatcher("personalPage.jsp").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }
            } else {
                CandidateDTO can = CandidateDAO.getCandidate(email);
                if (can != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_CDD", CandidateDAO.getCandidate(email));
                    if (CandidateDAO.updateCandidate(email, newname, newphone, newbirthdate, imgFilename)) {
                        request.getRequestDispatcher("personalPage.jsp").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
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
