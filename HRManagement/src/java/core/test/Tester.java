/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.test;

import core.dao.AccountDAO;
import core.dao.CVDAO;
import core.dao.CandidateDAO;
import core.dao.EmployeeDAO;
import core.dao.InterviewingDAO;
import core.dao.JobDAO;
import core.dao.RecruitmentPostDAO;
import core.dto.AccountDTO;
import core.dto.CVDTO;
import core.dto.CandidateDTO;
import core.dto.EmployeeDTO;
import core.dto.InterviewingDTO;
import core.dto.JobDTO;
import core.dto.RecruitmentPostDTO;
import core.utils.EmailUtils;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Tester {

    public static void main(String[] args) throws SQLException, Exception {
//        JobDAO dao=new JobDAO();
//        JobDTO job=dao.getJob("JOB1");
//        System.out.println(job.getName());

//        if(CandidateDao.updateCandidate("trancongduc", "Tran Cong Duc", "123", "duc@fpt", "2002/1/1")) {
//            System.out.println("wwin"); 
//        } else {
//            System.out.println("lose");
//        }
//        if(AccountDao.updateAccount("lethanhhuy", "222")) {
//            System.out.println("win");
//        } else {
//            System.out.println("loze");
//        } 
//            CandidateDTO acc = CandidateDao.getEmployee("trancongduc");
//            if (acc!=null){
//                System.out.println(acc.toString());
//            } else {
//                System.out.println("lose");
//            }
//        ArrayList<CandidateDTO> list = CandidateDao.getAllEmployees();
//        for (CandidateDTO can : list) {
//            System.out.println(can.toString());
////        }
//          CandidateDao.createCandidate("CDD3", "test2", "sdt", "email@", "tuilatestne2", "2001-11-11");
//            AccountDTO acc = AccountDAO.getAccount("ductcse160119@fpt.edu.vn");
//            System.out.println(acc.getEmail());
//            if (!acc.getAccrole().equalsIgnoreCase("candidate")){
//            EmployeeDTO emp = EmployeeDAO.getEmployee(acc.getEmail());
//            System.out.println(emp.getEmname());
//            }
//            else {
//                CandidateDTO can = CandidateDAO.getCandidate(acc.getEmail());
//                System.out.println(can.getName());
//            }
//        ArrayList<RecruitmentPostDTO> listPost = RecruitmentPostDAO.getPostsByEmail("ngoctlbse160583@fpt.edu.vn");
//        ArrayList<JobDTO> listJob = JobDAO.getJobsByEmail("ngoctlbse160583@fpt.edu.vn");
//        CVDTO cv = CVDAO.getCVByEmail("ductcse160119@fpt.edu.vn");
//        ArrayList<InterviewingDTO> listIW = InterviewingDAO.getInterviewingByCV(cv.getCvid());
//        ArrayList<String> listID = InterviewingDAO.getInterviewingID();
//                ArrayList<JobDTO> listJob = new ArrayList<>();
//                for (int i = 0; i < listID.size(); i++) {
//                    String get = listID.get(i);
//                    listJob.add(JobDAO.getJobsByITVID(get));
//                }
//                ArrayList<Integer> listStatus = InterviewingDAO.getInterviewingStatus();
//                ArrayList<Integer> listQuantity = new ArrayList<>();
//                for (int i = 0; i < listJob.size(); i++) {
//                    JobDTO get = listJob.get(i);
//                    listQuantity.add(JobDAO.getQuantityByJID(get.getJobID()));
//                }
        EmployeeDTO emp = EmployeeDAO.getEmployee("ngoctlbse160583@fpt.edu.vn");
        String empID = emp.getEid();
        int list = JobDAO.getCountJob();
        String Jobid = "JOB" + (list + 1);
        JobDAO.createJob(Jobid, "QC", 2500, "", "decrisption", "2 year", "img", 2, "2022-09-01", "2022-11-01", "EMP1");

    }
}
