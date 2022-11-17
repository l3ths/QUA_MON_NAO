/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

import core.dto.AccountDTO;
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
public class AccountDAO {

    public static ArrayList<AccountDTO> getAllAccounts() {
        ArrayList<AccountDTO> list = new ArrayList<>();
        //step1: make connection
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                //step 2: viet sql va execute no
                String sql = "select email, password, role\n"
                            + "from tblAccount";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //step 3: xu li ket qu step 2
                if (table != null) {
                    while (table.next()) {
                        String password = table.getString("password");
                        String email = table.getString("email");
                        String accrole = table.getString("role");
                        AccountDTO acc = new AccountDTO(email, password, accrole);
                        list.add(acc);
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

    public static AccountDTO getAccount(String email) {
        AccountDTO acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select email, password, role\n"
                            + "from tblAccount\n"
                            + "where email = ?  COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                // gan input email vao cac dau cham hoi??
                pst.setString(1, email);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    String password = table.getString("password");
                    String accrole = table.getString("role");
                    acc = new AccountDTO(email, password, accrole);
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
        return acc;
    }

    public static boolean updateAccount(String email, String newPassword) {
        boolean result = false;
        int n;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "update tblAccount\n"
                            + "set password = ? \n"
                            + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newPassword);
                pst.setString(2, email);
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

    public static AccountDTO getAccount(String email, String password) {
        AccountDTO acc = null;
        try {
            Connection cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select email,password,role\n"
                            + "from dbo.tblAccount\n"
                            + "where email=? and password=? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet table = pst.executeQuery();
                if (table != null & table.next()) {
                    String role = table.getString("role");
                    acc = new AccountDTO(email, password, role);
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static boolean updateToken(String token, String email) throws Exception {
        boolean ok = false;
        if (checkExistAccount(email)) {
            Connection cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblAccount\n"
                            + "SET token = '" + token + "'\n"
                            + "WHERE tblAccount.email='" + email + "'";
                Statement st = cn.createStatement();
                try {
                    st.executeUpdate(sql);
                    ok = true;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            cn.close();
        }
        return ok;
    }

    public static boolean checkExistAccount(String email) throws Exception {
        boolean ok = false;
        Connection cn = DBUtils.getConnection();
        if (cn != null) {
            String sql = "select email,password,role\n"
                        + "from dbo.tblAccount\n"
                        + "where email=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet table = pst.executeQuery();
            if (table != null & table.next()) {
                ok = true;
            }
            cn.close();
        }
        return ok;
    }

    public static void createAccount(String user, String password) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "insert tblAccount values (?,?,'candidate',null)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, user);
                pst.setString(2, password);
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

    public static void updateRoleToEmployee(String email) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "update tblAccount set role='employee' where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
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

    public static void deleteAccount(String email) {
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "delete tblAccount\n"
                            + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
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
