/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.AccountDAO;
import core.dao.CandidateDAO;
import core.dao.InterviewingDAO;
import core.dto.InterviewingDTO;
import core.utils.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinkPad T490
 */
public class ApproveCandidateController extends HttpServlet {

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
                throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String ITVID = request.getParameter("ITVID");
            ArrayList<InterviewingDTO> listIW = InterviewingDAO.getInterviewingByInterviewingID(ITVID);
            ArrayList<InterviewingDTO> listIWPass = new ArrayList<>();
            ArrayList<InterviewingDTO> listIWNotPass = new ArrayList<>();
            for (int i = 0; i < listIW.size(); i++) {
                InterviewingDTO get = listIW.get(i);
                if (request.getParameter(get.getCvID())!=null) {
                    listIWPass.add(get);
                } else {
                    listIWNotPass.add(get);
                }
            }
            for (int i = 0; i < listIWNotPass.size(); i++) {
                InterviewingDTO get = listIWNotPass.get(i);
                String subject = "Recruitment Result";
                String body = "Hi there,"
                            + "I am from Toidiuyh corp."
                            + "I am sorry to annouce that you are not pass"
                            + "Thank you and see you later"
                            + "Toidiyuh";
                String email = CandidateDAO.getCandidatesByCV(get.getCvID()).getEmail();
                EmailUtils.sendEmail(email, subject, body);
                AccountDAO.deleteAccount(email);
            }
            for (int i = 0; i < listIWPass.size(); i++) {
                InterviewingDTO get = listIWPass.get(i);
                String subject = "Recruitment Result";
                String body = "Hi there,"
                            + "I am from Toidiuyh corp."
                            + "Congratulation, you have passed the interview. "
                            + "Thank you and see you later"
                            + "Toidiyuh";
                String email = CandidateDAO.getCandidatesByCV(get.getCvID()).getEmail();
                EmailUtils.sendEmail(email, subject, body);
                AccountDAO.updateRoleToEmployee(email);
            }
            InterviewingDAO.updateStatus(ITVID, 2);
            request.getRequestDispatcher("ViewPersonalController?aprovestt=true").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(ApproveCandidateController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(ApproveCandidateController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
