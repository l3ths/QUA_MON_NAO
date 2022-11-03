/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.RecruitmentPostDTO;
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
public class RecruitmentPostDAO {

    public static ArrayList<RecruitmentPostDTO> getPostsByEmail(String email) {
        ArrayList<RecruitmentPostDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT jobID\n"
                            + "      ,dateFrom\n"
                            + "      ,dateTo\n"
                            + "      ,j.empID\n"
                            + "  FROM tblJob j\n"
                            + "  inner join tblEmployee e\n"
                            + "  on j.empID=e.empID\n"
                            + "  where e.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("jobID");
                    String datefrom = rs.getString("dateFrom");
                    String dateto = rs.getString("dateTo");
                    RecruitmentPostDTO rp = new RecruitmentPostDTO(id, datefrom, dateto);
                    list.add(rp);
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

    public static String getJobNameByPostID(String postID) {
        String name = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "   SELECT [name]\n"
                            + "  FROM tblJob j\n"
                            + "  inner join tblAppyling a\n"
                            + "  on a.jobID=j.jobID\n"
                            + "  inner join tblRecruitmentPost r\n"
                            + "  on r.postID = a.postID\n"
                            + "  where r.postID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, postID);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    name = rs.getString("name");

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
        return name;
    }
}
