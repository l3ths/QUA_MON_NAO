/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dao;

//import core.dto.Account;
import core.dto.EmployeeDTO;
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
public class EmployeeDAO {

    public static ArrayList<EmployeeDTO> getAllEmployees() {
        ArrayList<EmployeeDTO> list = new ArrayList<>();
        //step1: make connection
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                //step 2: viet sql va execute no
                String sql = "select empID, name, phoneNumber,email, role, dateofBirth, imgPath\n"
                            + "from tblEmployee\n";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //step 3: xu li ket qu step 2
                if (table != null) {
                    while (table.next()) {
                        String empID = table.getString("empID");
                        String name = table.getString("name");
                        String phoneNumber = table.getString("phoneNumber");
                        String email = table.getString("email");
                        String accrole = table.getString("role");
                        String birthdate = table.getString("dateofBirth");
                        String imgpath = table.getString("imgPath");
                        EmployeeDTO emp = new EmployeeDTO(empID, name, phoneNumber, email, accrole, birthdate, imgpath);
                        list.add(emp);
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

    public static EmployeeDTO getEmployee(String email) {
        EmployeeDTO emp = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select empID, name, phoneNumber,email, role, dateofBirth, imgPath\n"
                            + "from tblEmployee\n"
                            + "where email= ?  COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                // gan input email vao cac dau cham hoi??
                pst.setString(1, email);
                ResultSet table = pst.executeQuery();
                if (table != null && table.next()) {
                    String empID = table.getString("empID");
                    String name = table.getString("name");
                    String phoneNumber = table.getString("phoneNumber");
                    String accrole = table.getString("role");
                    String birthdate = table.getString("dateofBirth");
                    String imgpath = table.getString("imgPath");
                    emp = new EmployeeDTO(empID, name, phoneNumber, email, accrole, birthdate, imgpath);
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
        return emp;
    }

    public static boolean updateEmployee(String email, String name, String phone, String birthDate) {
        boolean result = false;
        int n;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "update tblEmployee\n"
                            + "set name = ?,\n"
                            + "phoneNumber = ? ,\n"
                            + "dateofBirth = ?\n"
                            + "where email= ?";
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

    public static ArrayList<EmployeeDTO> getAllInterviewers() {
        ArrayList<EmployeeDTO> list = new ArrayList<>();
        //step1: make connection
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                //step 2: viet sql va execute no
                String sql = "SELECT [empID]\n"
                            + "      ,[name]\n"
                            + "      ,[phoneNumber]\n"
                            + "      ,[email]\n"
                            + "      ,[role]\n"
                            + "      ,[dateofBirth]\n"
                            + "      ,[imgPath]\n"
                            + "  FROM [HR].[dbo].[tblEmployee]\n"
                            + "  where role = 'interviewer'";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //step 3: xu li ket qu step 2
                if (table != null) {
                    while (table.next()) {
                        String empID = table.getString("empID");
                        String name = table.getString("name");
                        String phoneNumber = table.getString("phoneNumber");
                        String email = table.getString("email");
                        String accrole = table.getString("role");
                        String birthdate = table.getString("dateofBirth");
                        String imgpath = table.getString("imgPath");
                        EmployeeDTO emp = new EmployeeDTO(empID, name, phoneNumber, email, accrole, birthdate, imgpath);
                        list.add(emp);
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

}
