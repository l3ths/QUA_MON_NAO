/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.CVDTO;
import core.dto.JobDTO;
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
 * @author ADMIN
 */
public class CVDAO {

    private static final String CREATE_CV = "insert into tblCV (CVID, dateOfBirth, status, education, experience, candidateID, fileCV) values ( ? , ? , ? , ? , ? , ? , ? )";
    private static final String GET_CV = "SELECT CVID, dateOfBirth, status, education, experience, candidateID, fileCV, certificateID FROM tblCV WHERE CVID = ?";

    public void createCV(String CVID, String fileCV, String edu, String exp, String date, String CID) throws SQLException {
        JobDTO Job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_CV);
                ptm.setString(1, CVID);
                ptm.setString(2, date);
                ptm.setInt(3, 0);
                ptm.setString(4, edu);
                ptm.setString(5, exp);
                ptm.setString(6, CID);
                ptm.setString(7, fileCV);
                ptm.executeUpdate();

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public static CVDTO getCVByEmail(String email) {
        CVDTO cv = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select cv.CVID\n"
                        + "      ,cv.dateOfBirth\n"
                        + "      ,cv.status\n"
                        + "      ,cv.education\n"
                        + "      ,cv.experience\n"
                        + "      ,cv.candidateID\n"
                        + "      ,cv.certificateID\n"
                        + "      ,cv.fileCV\n"
                        + "from tblCV cv\n"
                        + "inner join tblCandidate c\n"
                        + "on cv.candidateID=c.candidateID\n"
                        + "where c.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    String CVID = rs.getString("CVID");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    int status = rs.getInt("status");
                    String education = rs.getString("education");
                    String experience = rs.getString("experience");
                    String fileCV = rs.getString("fileCV");
                    String candidateID = rs.getString("candidateID");
                    String certificateID = rs.getString("certificateID");
                    cv = new CVDTO(CVID, education, experience, dateOfBirth, status, fileCV, candidateID, certificateID);

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
        return cv;
    }

    public static ArrayList<CVDTO> getCVsByEmail(String email) {

        Connection cn = null;
        ArrayList<CVDTO> list = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select cv.CVID\n"
                        + "      ,cv.dateOfBirth\n"
                        + "      ,cv.status\n"
                        + "      ,cv.education\n"
                        + "      ,cv.experience\n"
                        + "      ,cv.candidateID\n"
                        + "      ,cv.certificateID\n"
                        + "      ,cv.fileCV\n"
                        + "from tblCV cv\n"
                        + "inner join tblCandidate c\n"
                        + "on cv.candidateID=c.candidateID\n"
                        + "where c.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String CVID = rs.getString("CVID");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    int status = rs.getInt("status");
                    String education = rs.getString("education");
                    String experience = rs.getString("experience");
                    String fileCV = rs.getString("fileCV");
                    String candidateID = rs.getString("candidateID");
                    String certificateID = rs.getString("certificateID");
                    CVDTO cv = new CVDTO(CVID, education, experience, dateOfBirth, status, fileCV, candidateID, certificateID);
                    list.add(cv);
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

    public static ArrayList<CVDTO> getCVs() {
        ArrayList<CVDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblCV";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("CVID");
                    String education = rs.getString("education");
                    String experience = rs.getString("experience");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    int status = rs.getInt("status");
                    String fileCV = rs.getString("fileCV");
                    String candidateID = rs.getString("candidateID");
                    String certificateID = rs.getString("certificateID");
                    CVDTO cv = new CVDTO(id, education, experience, dateOfBirth, status, fileCV, candidateID, certificateID);
                    list.add(cv);
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

    public static ArrayList<CVDTO> getCVsByJobID(String jobID) {
        ArrayList<CVDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select cv.*\n"
                        + "from dbo.tblCV cv\n"
                        + "inner join dbo.tblAppyling app on cv.CVID = app.CVID\n"
                        + "inner join dbo.tblJob job on app.jobID = job.jobID\n"
                        + "where job.jobID = ? and cv.status=0";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, jobID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("CVID");
                    String education = rs.getString("education");
                    String experience = rs.getString("experience");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    int status = rs.getInt("status");
                    String fileCV = rs.getString("fileCV");
                    String candidateID = rs.getString("candidateID");
                    String certificateID = rs.getString("certificateID");
                    CVDTO cv = new CVDTO(id, education, experience, dateOfBirth, status, fileCV, candidateID, certificateID);
                    list.add(cv);
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

    public CVDTO getCVByCVID(String CVID) {
        CVDTO cv = new CVDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(GET_CV);
                pst.setString(1, CVID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String education = rs.getString("education");
                    String experience = rs.getString("experience");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    int status = rs.getInt("status");
                    String fileCV = rs.getString("fileCV");
                    String candidateID = rs.getString("candidateID");
                    String certificateID = rs.getString("certificateID");
                    cv = new CVDTO(CVID, education, experience, dateOfBirth, status, fileCV, candidateID, certificateID);
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
        return cv;
    }
}
