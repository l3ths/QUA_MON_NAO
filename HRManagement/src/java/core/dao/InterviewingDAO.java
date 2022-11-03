/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.InterviewingDTO;
import core.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ThinkPad T490
 */
public class InterviewingDAO {

    public static ArrayList<InterviewingDTO> getInterviewingByCV(String CVID) {
        ArrayList<InterviewingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblInterviewing\n"
                        + "where CVID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, CVID);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("interviewingID");
                    String date = rs.getString("date");
                    String time = rs.getString("time");
                    String score = rs.getString("score");
                    String content = rs.getString("content");
                    String empID = rs.getString("empID");
                    String jobID = rs.getString("jobID");
                    InterviewingDTO iw = new InterviewingDTO(id, date, time, score, empID, CVID, jobID);
                    list.add(iw);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static ArrayList<InterviewingDTO> getInterviewingByEmail(String email, String role) {
        ArrayList<InterviewingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql;
                if (role.equals("candidate")) {
                    sql = "SELECT interviewingID\n"
                            + "      ,[date]\n"
                            + "      ,[time]\n"
                            + "      ,[score]\n"
                            + "      ,[content]\n"
                            + "      ,i.[empID]\n"
                            + "      ,i.[CVID]\n"
                            + "      ,[jobID]\n"
                            + "  FROM tblInterviewing i\n"
                            + "  inner join tblCV cv\n"
                            + "  on i.CVID=cv.CVID\n"
                            + "  inner join tblCandidate c\n"
                            + "  on c.candidateID=cv.candidateID\n"
                            + "  where c.email=?";
                } else {
                    sql = "SELECT interviewingID\n"
                            + "      ,[date]\n"
                            + "      ,[time]\n"
                            + "      ,[score]\n"
                            + "      ,[content]\n"
                            + "      ,i.[empID]\n"
                            + "      ,[CVID]\n"
                            + "      ,[jobID]\n"
                            + "  FROM tblInterviewing i\n"
                            + "  inner join tblEmployee e\n"
                            + "  on i.empID=e.empID\n"
                            + "  where e.email=?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("interviewingID");
                    String date = rs.getString("date");
                    String time = rs.getString("time");
                    String score = rs.getString("score");
                    String content = rs.getString("content");
                    String empID = rs.getString("empID");
                    String CVID = rs.getString("CVID");
                    String jobID = rs.getString("jobID");
                    InterviewingDTO iw = new InterviewingDTO(id, date, time, score, empID, CVID, jobID);
                    list.add(iw);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static ArrayList<InterviewingDTO> getInterviewings() {
        ArrayList<InterviewingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblInterviewing";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("interviewingID");
                    String date = rs.getString("date");
                    String time = rs.getString("time");
                    String score = rs.getString("score");
                    String content = rs.getString("content");
                    String empID = rs.getString("empID");
                    String jobID = rs.getString("jobID");
                    String CVID = rs.getString("CVID");
                    InterviewingDTO iw = new InterviewingDTO(id, date, time, score, empID, CVID, jobID);
                    list.add(iw);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static ArrayList<Integer> getInterviewingStatus() {
        ArrayList<Integer> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblInterviewing";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    int status = rs.getInt("status");
                    list.add(status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static ArrayList<InterviewingDTO> getInterviewingByJobID(String JobID) {
        ArrayList<InterviewingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblInterviewing\n"
                        + "where jobID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, JobID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("interviewingID");
                    String date = rs.getString("date");
                    String time = rs.getString("time");
                    String score = rs.getString("score");
                    String content = rs.getString("content");
                    String empID = rs.getString("empID");
                    String jobID = rs.getString("jobID");
                    String CVID = rs.getString("CVID");
                    InterviewingDTO iw = new InterviewingDTO(id, date, time, score, empID, CVID, jobID);
                    list.add(iw);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

}
