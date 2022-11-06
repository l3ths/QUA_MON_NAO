/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.JobDTO;
import core.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class JobDAO {

    private static final String GET_ALL_JOB = "SELECT jobID, name, salary, description, experienceRequirement, educationRequirement, imgPath FROM tblJob ORDER BY jobID OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
    private static final String GET_JOB = "SELECT jobID, name, salary, description, experienceRequirement, educationRequirement, imgPath FROM tblJob WHERE jobID=?";
    private static final String SEARCH_JOB = "SELECT jobID, name, salary, description, experienceRequirement, educationRequirement, imgPath FROM tblJob WHERE name like ? AND SALARY >= ? ORDER BY jobID OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
    private static final String COUNT_JOB = "SELECT COUNT(jobID) AS count FROM tblJob";
    private static final String COUNT_SEARCH = "SELECT COUNT(jobID) AS count FROM tblJob WHERE name like ? AND SALARY >= ?";

    public List<JobDTO> getListJob(int index) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB);
                ptm.setInt(1, (index - 1) * 3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String jobID = rs.getString("jobID");
                    String name = rs.getString("name");
                    int salary = rs.getInt("salary");
                    String description = rs.getString("description");
                    String experienceRequirement = rs.getString("experienceRequirement");
                    String educationRequirement = rs.getString("educationRequirement");
                    String imgPath = rs.getString("imgPath");
                    listJob.add(new JobDTO(jobID, name, salary, description, experienceRequirement, educationRequirement, imgPath));
                }
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
        return listJob;
    }

    public static JobDTO getJob(String jID) throws SQLException {
        JobDTO Job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB);
                ptm.setString(1, jID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int salary = rs.getInt("salary");
                    String description = rs.getString("description");
                    String experienceRequirement = rs.getString("experienceRequirement");
                    String educationRequirement = rs.getString("educationRequirement");
                    String imgPath = rs.getString("imgPath");
                    Job = new JobDTO(jID, name, salary, description, experienceRequirement, educationRequirement, imgPath);
                }
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
        return Job;
    }

    public List<JobDTO> getSearchJob(String searchName, int searchSalary, int index) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_JOB);
                ptm.setString(1, "%" + searchName + "%");
                ptm.setInt(2, searchSalary);
                ptm.setInt(3, (index - 1) * 3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String jobID = rs.getString("jobID");
                    String name = rs.getString("name");
                    int salary = rs.getInt("salary");
                    String description = rs.getString("description");
                    String experienceRequirement = rs.getString("experienceRequirement");
                    String educationRequirement = rs.getString("educationRequirement");
                    String imgPath = rs.getString("imgPath");
                    listJob.add(new JobDTO(jobID, name, salary, description, experienceRequirement, educationRequirement, imgPath));
                }
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
        return listJob;
    }

    public static int getCountJob() {
        int count = 0;
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                ptm = cn.prepareStatement(COUNT_JOB);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt("count");
                }
            }
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return count;
    }

    public int getCountSearch(String searchName, int searchSalary) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_SEARCH);
                ptm.setString(1, "%" + searchName + "%");
                ptm.setInt(2, searchSalary);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    count = rs.getInt("count");
                }
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
        return count;
    }

    public static ArrayList<JobDTO> getJobByUsername(String username) throws SQLException {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT *\n"
                            + "  FROM tblJob j\n"
                            + "  inner join tblAppyling ap\n"
                            + "  on j.jobID=ap.jobID\n"
                            + "  inner join tblCV cv\n"
                            + "  on cv.CVID=ap.CVID\n"
                            + "  inner join tblCandidate c\n"
                            + "  on cv.candidateID=c.candidateID\n"
                            + "  where c.username=?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String jID = rs.getString("jobID");
                    String name = rs.getString("name");
                    int salary = rs.getInt("salary");
                    String description = rs.getString("description");
                    String experienceRequirement = rs.getString("experienceRequirement");
                    String educationRequirement = rs.getString("educationRequirement");
                    String imgPath = rs.getString("imgPath");
                    JobDTO Job = new JobDTO(jID, name, salary, description, experienceRequirement, educationRequirement, imgPath);
                    list.add(Job);
                }
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
        return list;
    }

    public static void createJob(String jid, String jname, int salary, String description, String expReq, String eduReq, String imgJob, int quantity, String fromDate, String toDate, String empID) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert tblJob values (?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, jid);
                pst.setString(2, jname);
                pst.setInt(3, salary);
                pst.setString(4, description);
                pst.setString(5, expReq);
                pst.setString(6, eduReq);
                pst.setString(7, imgJob);
                pst.setInt(8, quantity);
                pst.setString(9, fromDate);
                pst.setString(10, toDate);
                pst.setString(11, empID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("error");
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                System.out.println("error");
            }
        }
    }

    public static int getQuantityByJID(String jobID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int quan = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT quantity\n"
                            + "  FROM tblJob\n"
                            + "  where jobID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quan = rs.getInt("quantity");
                }
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
        return quan;
    }

    public static ArrayList<JobDTO> getJobsByEmail(String email) {
        ArrayList<JobDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT jobID\n"
                            + "      ,j.name\n"
                            + "      ,salary\n"
                            + "      ,description\n"
                            + "      ,experienceRequirement\n"
                            + "      ,educationRequirement\n"
                            + "      ,j.imgPath\n"
                            + "      ,quantity\n"
                            + "      ,dateFrom\n"
                            + "      ,dateTo\n"
                            + "      ,j.empID\n"
                            + "    FROM tblJob j\n"
                            + "  inner join tblEmployee e\n"
                            + "  on j.empID=e.empID\n"
                            + "  where e.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String jID = rs.getString("jobID");
                    String name = rs.getString("name");
                    int salary = rs.getInt("salary");
                    String description = rs.getString("description");
                    String experienceRequirement = rs.getString("experienceRequirement");
                    String educationRequirement = rs.getString("educationRequirement");
                    String imgPath = rs.getString("imgPath");
                    JobDTO Job = new JobDTO(jID, name, salary, description, experienceRequirement, educationRequirement, imgPath);
                    list.add(Job);
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return list;
    }
}
