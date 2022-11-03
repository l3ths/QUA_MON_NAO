/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.CandidateDTO;
import core.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ThinkPad T490
 */
public class CandidateDAO {

    public static ArrayList<CandidateDTO> getAllCandidates() {
        ArrayList<CandidateDTO> list = new ArrayList<>();
        //step1: make connection
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                //step 2: viet sql va execute no
                String sql = "SELECT [candidateID],[name] ,[phoneNumber],[email]\n"
                        + "      ,[imgPath] ,[dateOfBirth]\n"
                        + "  FROM [HR].[dbo].[tblCandidate]";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //step 3: xu li ket qu step 2
                if (table != null) {
                    while (table.next()) {
                        String cID = table.getString("candidateID");
                        String name = table.getString("name");
                        String phoneNumber = table.getString("phoneNumber");
                        String email = table.getString("email");
                        String imgPath = table.getString("imgPath");
                        String birthdate = table.getString("dateOfBirth");
                        CandidateDTO can = new CandidateDTO(cID, name, phoneNumber, email, imgPath, birthdate);
                        list.add(can);
                    }//het while
                }//het if
                cn.close();
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

    public static CandidateDTO getCandidate(String email) {
        CandidateDTO can = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [candidateID],[name] ,[phoneNumber]\n"
                        + "      ,[email],[imgPath] ,[dateOfBirth]\n"
                        + "  FROM [HR].[dbo].[tblCandidate]\n"
                        + "  where email=? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                // gan input email vao cac dau cham hoi??
                pst.setString(1, email);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    String cID = table.getString("candidateID");
                    String name = table.getString("name");
                    String phoneNumber = table.getString("phoneNumber");
                    String imgPath = table.getString("imgPath");
                    String birthdate = table.getString("dateOfBirth");
                    can = new CandidateDTO(cID, name, phoneNumber, email, imgPath, birthdate);
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
        return can;
    }

    public static boolean updateCandidate(String email, String name, String phone, String birthDate) {
        boolean result = false;
        int n;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "update tblCandidate\n"
                        + "set name = ?,\n"
                        + "	phoneNumber = ?,\n"
                        + "	dateOfBirth = ?\n"
                        + "where email=? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, phone);
                pst.setString(4, email);
                pst.setString(3, birthDate);
                n = pst.executeUpdate();
                if (n != 0) {
                    result = true;
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
        return result;
    }

    public static void createCandidate(String id, String name, String phone, String email, String birthDate) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert tblCandidate values (?,?,?,?,null,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, id);
                pst.setString(2, name);
                pst.setString(3, phone);
                pst.setString(4, email);
                pst.setString(5, birthDate);
                pst.executeUpdate();
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
    }
}
