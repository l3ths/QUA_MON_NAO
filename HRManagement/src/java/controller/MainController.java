/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mavis
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SHOW_JOB = "ShowJob";
    private static final String SHOW_JOB_CONTROLLER = "ShowJobController";
    private static final String SEARCH_JOB = "SearchJob";
    private static final String SEARCH_JOB_CONTROLLER = "SearchJobController";
    private static final String VIEW_JOB_DETAIL = "ViewJobDetail";
    private static final String VIEW_JOB_DETAIL_CONTROLLER = "ViewJobDetailController";
    private static final String UPDATE_PROFILE = "UPDATE PROFILE";
    private static final String UPDATE_PROFILE_CONTROLLER = "UpdateEmpProfileController";
    private static final String CHANGE_PASSWORD = "CHANGE PASSWORD";
    private static final String CHANGE_PASSWORD_CONTROLLER = "UpdatePassAccController";
    private static final String VIEW_PROFILE = "Showprofile";
    private static final String VIEW_PROFILE_CONTROLLER = "ManageEmployeeController";
    private static final String LOGIN = "login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String APLLY_JOB = "ApplyJob";
    private static final String APLLY_JOB_CONTROLLER = "ApplyJobController";
    private static final String APLLYING = "Applying";
    private static final String APLLYING_CONTROLLER = "ApplyingController";
    private static final String CONTINUE = "checkEmail";
    private static final String CONTINUE_CONTROLLER = "ContinueController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String VIEW_PERSONAL = "ViewPersonal";
    private static final String VIEW_PERSONAL_CONTROLLER = "ViewPersonalController";
    private static final String VIEW_INTERVIEW_DETAIL = "ViewInterviewDetail";
    private static final String VIEW_INTERVIEW_DETAIL_CONTROLLER = "ViewInterviewDetailController";
    private static final String VIEW_PASSED = "ViewPassed";
    private static final String VIEW_PASSED_CONTROLLER = "ViewPassedController";
    private static final String MARK_CANDIDATE = "MarkCandidate";
    private static final String MARK_CANDIDATE_CONTROLLER = "MarkCandidateController";
    private static final String CREATE_JOB = "CREATE JOB";
    private static final String CREATE_JOB_CONTROLLER = "CreateJobController";
    private static final String GET_DETAIL_JOB = "Detail";
    private static final String GET_DETAIL_JOB_CONTROLLER = "GetDetailJobRecruitmentController";
    private static final String EDIT_RECRUITMENT_POST = "editPost";
    private static final String EDIT_RECRUITMENT_POST_CONTROLLER = "EditRecruitmentPostController";
    private static final String EDIT_RECRUITMENT_POST_LINK = "editRecruitmentPost";
    private static final String EDIT_RECRUITMENT_POST_LINK_CONTROLLER = "EditRecruitmentPostController1";
    private static final String SCHEDULE_INTERVEW = "ScheduleInterview";
    private static final String SCHEDULE_INTERVEW_CONTROLLER = "ScheduleInterviewController";
    private static final String SUBMIT_SCHEDULE = "SubmitSchedule";
    private static final String SUBMIT_SCHEDULE_CONTROLLER = "SubmitScheduleController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (SHOW_JOB.equals(action)) {
                url = SHOW_JOB_CONTROLLER;
            } else if (SEARCH_JOB.equals(action)) {
                url = SEARCH_JOB_CONTROLLER;
            } else if (VIEW_JOB_DETAIL.equals(action)) {
                url = VIEW_JOB_DETAIL_CONTROLLER;
            } else if (UPDATE_PROFILE.equals(action)) {
                url = UPDATE_PROFILE_CONTROLLER;
            } else if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            } else if (VIEW_PROFILE.equals(action)) {
                url = VIEW_PROFILE_CONTROLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (APLLY_JOB.equals(action)) {
                url = APLLY_JOB_CONTROLLER;
            } else if (APLLYING.equals(action)) {
                url = APLLYING_CONTROLLER;
            } else if (CONTINUE.equals(action)) {
                url = CONTINUE_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (VIEW_PERSONAL.equals(action)) {
                url = VIEW_PERSONAL_CONTROLLER;
            } else if (VIEW_INTERVIEW_DETAIL.equals(action)) {
                url = VIEW_INTERVIEW_DETAIL_CONTROLLER;
            } else if (VIEW_PASSED.equals(action)) {
                url = VIEW_PASSED_CONTROLLER;
            } else if (MARK_CANDIDATE.equals(action)) {
                url = MARK_CANDIDATE_CONTROLLER;
            } else if (CREATE_JOB.equals(action)) {
                url = CREATE_JOB_CONTROLLER;
            } else if (GET_DETAIL_JOB.equals(action)) {
                url = GET_DETAIL_JOB_CONTROLLER;
            } else if (EDIT_RECRUITMENT_POST.equals(action)) {
                url = EDIT_RECRUITMENT_POST_CONTROLLER;
            } else if (EDIT_RECRUITMENT_POST_LINK.equals(action)) {
                url = EDIT_RECRUITMENT_POST_LINK_CONTROLLER;
            } else if (SCHEDULE_INTERVEW.equals(action)) {
                url = SCHEDULE_INTERVEW_CONTROLLER;
            } else if (SUBMIT_SCHEDULE.equals(action)) {
                url = SUBMIT_SCHEDULE_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
