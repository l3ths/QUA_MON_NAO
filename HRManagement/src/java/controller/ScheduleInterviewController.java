/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.CVDAO;
import core.dao.EmployeeDAO;
import core.dao.JobDAO;
import core.dto.CVDTO;
import core.dto.EmployeeDTO;
import core.dto.JobDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPad T490
 */
public class ScheduleInterviewController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String JobID = request.getParameter("JobID");
            HttpSession session = request.getSession();
            JobDTO Job = JobDAO.getJob(JobID);
            ArrayList<CVDTO> listCV1 = CVDAO.getCVsByJobID(JobID);
            ArrayList<CVDTO> listCV = new ArrayList<>();
            ArrayList<EmployeeDTO> listInterviewer = EmployeeDAO.getAllInterviewers();
            for (int i = 0; i < listCV1.size(); i++) {
                CVDTO get = listCV1.get(i);
                if (request.getParameter(get.getCvid())!=null) {
                    listCV.add(get);
                }
            }
            request.setAttribute("Job", Job);
            request.setAttribute("listInterviewer", listInterviewer);
            session.setAttribute("listCV", listCV);
            request.getRequestDispatcher("interviewSchedule.jsp").forward(request, response);
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
