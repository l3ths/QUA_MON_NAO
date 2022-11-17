/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.CandidateDAO;
import core.dao.EmployeeDAO;
import core.dao.InterviewingDAO;
import core.dao.JobDAO;
import core.dto.CVDTO;
import core.dto.CandidateDTO;
import core.dto.EmployeeDTO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPad T490
 */
public class SubmitScheduleController extends HttpServlet {

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
            HttpSession session = request.getSession();
            ArrayList<CVDTO> listCV = (ArrayList<CVDTO>) session.getAttribute("listCV");
            String JobID = request.getParameter("JobID");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String questtion = request.getParameter("questtion");
            ArrayList<EmployeeDTO> listInterviewers1 = EmployeeDAO.getAllInterviewers();
            ArrayList<EmployeeDTO> listInterviewers = new ArrayList<>();
            for (int i = 0; i < listInterviewers1.size(); i++) {
                EmployeeDTO get = listInterviewers1.get(i);
                if (request.getParameter(get.getEid()) != null) {
                    listInterviewers.add(get);
                }
            }
            int size = InterviewingDAO.getInterviewings().size();
            String ID = "ITV" + (size + 1);
            for (int i = 0; i < listInterviewers.size(); i++) {
                EmployeeDTO get = listInterviewers.get(i);
                for (int j = 0; j < listCV.size(); j++) {
                    CVDTO get1 = listCV.get(j);
                    InterviewingDAO.createInterviewing(ID, date, time, questtion, get.getEid(), get1.getCvid(), JobID);
                }
            }
            for (int i = 0; i < listCV.size(); i++) {
                CVDTO get = listCV.get(i);
                CandidateDTO can = CandidateDAO.getCandidatesByCV(get.getCvid());
                String subject = "Announcement of interview appointment - Toidiyuh Group";
                String body = "Hello, \n"
                            + "Your interview appointment is"
                            + time + " " + date + "."
                            + "\nPlease be on time.\n"
                            + "Sincerely, \n"
                            + "Toidiyuh group";
                EmailUtils.sendEmail(can.getEmail(), subject, body);
            }
            JobDAO.updateStatus(1, JobID);
            request.getRequestDispatcher("ViewPersonalController?schedulestt=true").forward(request, response);
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
            Logger.getLogger(SubmitScheduleController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SubmitScheduleController.class.getName()).log(Level.SEVERE, null, ex);
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
