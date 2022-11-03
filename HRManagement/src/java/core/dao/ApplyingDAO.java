/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author ThinkPad T490
 */
public class ApplyingDAO {

    public static void createApplying(String cvID, String jobID) {
        Connection cn = null;
        String date = java.time.LocalDate.now().toString();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql="insert into tblAppyling  values (?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, date);
                pst.setString(2, cvID);
                pst.setString(3, jobID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

}
