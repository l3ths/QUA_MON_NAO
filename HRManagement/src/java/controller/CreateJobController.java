/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import core.dao.EmployeeDAO;
import core.dao.JobDAO;
import core.dto.EmployeeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ThinkPad T490
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CreateJobController extends HttpServlet {

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
            String jobname = request.getParameter("txtjobtittle");
            String expReq = request.getParameter("txtexpReq");
            String eduReq = request.getParameter("txteduReq");
            int salary = Integer.parseInt(request.getParameter("txtSalary"));
            String descript = request.getParameter("txtDesc");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            String fromdate = request.getParameter("txtDatefrom");
            String todate = request.getParameter("txtDateto");
            String uploadFolder = request.getServletContext().getRealPath("/img/job");
            Path uploadPath = Paths.get(uploadFolder);
            if (!Files.exists(uploadPath)) {
                Files.createDirectory(uploadPath);
            }
            Part imgPart = request.getPart("txtImg");
            String imgFilename = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
            imgPart.write(Paths.get(uploadPath.toString(), imgFilename).toString());
            HttpSession session = request.getSession();
            String empEmail = (String) session.getAttribute("email");
            EmployeeDTO emp = EmployeeDAO.getEmployee(empEmail);
            String empID = emp.getEid();
            int list = JobDAO.getCountJob();
            String Jobid = "JOB" + (list + 1);
            JobDAO.createJob(Jobid, jobname, salary, descript, expReq, eduReq, imgFilename, quantity, fromdate, todate, empID);
            request.getRequestDispatcher("ViewPersonalController?createstt=1").forward(request, response);
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
