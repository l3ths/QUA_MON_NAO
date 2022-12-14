/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.AccountDAO;
import core.dao.CVDAO;
import core.dao.InterviewingDAO;
import core.dao.JobDAO;
import core.dao.RecruitmentPostDAO;
import core.dto.AccountDTO;
import core.dto.CVDTO;
import core.dto.InterviewingDTO;
import core.dto.JobDTO;
import core.dto.RecruitmentPostDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPad T490
 */
@WebServlet(name = "ViewPersonalController", urlPatterns = {"/ViewPersonalController"})
public class ViewPersonalController extends HttpServlet {

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
                throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String email = (String) session.getAttribute("email");
            String role = (String) session.getAttribute("role");
            if (role.equals("interviewer")) {
                ArrayList<String> listID = InterviewingDAO.getInterviewingIDbyEmail(email);
                ArrayList<JobDTO> listJob = new ArrayList<>();
                for (int i = 0; i < listID.size(); i++) {
                    String get = listID.get(i);
                    listJob.add(JobDAO.getJobsByITVID(get));
                }
                ArrayList<String> listDay = new ArrayList<>();
                ArrayList<String> listTime = new ArrayList<>();
                for (int i = 0; i < listID.size(); i++) {
                    String get = listID.get(i);
                    InterviewingDTO iw = InterviewingDAO.getInterviewingByInterviewingID(get).get(0);
                    listDay.add(iw.getDate());
                    listTime.add(iw.getTime());
                }
                request.setAttribute("listDay", listDay);
                request.setAttribute("listTime", listTime);
                request.setAttribute("listJob", listJob);
                request.setAttribute("listID", listID);
                request.getRequestDispatcher("interviewerPage.jsp").forward(request, response);
            } else if (role.equals("candidate")) {
                ArrayList<CVDTO> listCV = CVDAO.getCVsByEmail(email);
                ArrayList<InterviewingDTO> listIW = new ArrayList<>();
                for (int i = 0; i < listCV.size(); i++) {
                    CVDTO get = listCV.get(i);
                    InterviewingDTO iw = InterviewingDAO.getInterviewingByCV(get.getCvid());
                    if (iw != null) {
                        listIW.add(iw);
                    }
                }
                ArrayList<JobDTO> listJob = new ArrayList<>();
                for (int i = 0; i < listIW.size(); i++) {
                    InterviewingDTO get = listIW.get(i);
                    listJob.add(JobDAO.getJob(get.getJobID()));
                }
                request.setAttribute("listCV", listCV);
                request.setAttribute("listIW", listIW);
                request.setAttribute("listJob", listJob);
                request.getRequestDispatcher("candidatePage.jsp").forward(request, response);
            } else if (role.equals("hr")) {
                ArrayList<RecruitmentPostDTO> listPost = RecruitmentPostDAO.getPostsByEmail(email);
                ArrayList<JobDTO> listJob = JobDAO.getJobsByEmail(email);
                request.setAttribute("listPost", listPost);
                request.setAttribute("listJob", listJob);
                request.getRequestDispatcher("hrPage.jsp").forward(request, response);
            } else if (role.equals("admin")) {
                ArrayList<AccountDTO> accList = AccountDAO.getAllAccounts();
                ArrayList<Integer> sttList = AccountDAO.getAllStatus();
                request.setAttribute("accList", accList);
                request.setAttribute("sttList", sttList);
                request.getRequestDispatcher("adminPage.jsp").forward(request, response);
            } else if (role.equals("hr manager")) {
                ArrayList<String> listID = InterviewingDAO.getInterviewingID();
                ArrayList<JobDTO> listJob = new ArrayList<>();
                for (int i = 0; i < listID.size(); i++) {
                    String get = listID.get(i);
                    listJob.add(JobDAO.getJobsByITVID(get));
                }
                ArrayList<Integer> listStatus = InterviewingDAO.getInterviewingStatus();
                ArrayList<Integer> listQuantity = new ArrayList<>();
                for (int i = 0; i < listJob.size(); i++) {
                    JobDTO get = listJob.get(i);
                    listQuantity.add(JobDAO.getQuantityByJID(get.getJobID()));
                }
                request.setAttribute("listID", listID);
                request.setAttribute("listJob", listJob);
                request.setAttribute("listStatus", listStatus);
                request.setAttribute("listQuantity", listQuantity);
                request.getRequestDispatcher("hrManagerPage.jsp").forward(request, response);
            } else {
                response.sendRedirect("errorPage.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewPersonalController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ViewPersonalController.class.getName()).log(Level.SEVERE, null, ex);
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
