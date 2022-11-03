/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dto;

/**
 *
 * @author asus
 */
public class EmployeeDTO {
    private String eid;
    private String emname;
    private String emphone;
    private String ememail;
    private String emrole;
    private String birthdate;
    private String imgpath;

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

 
    
    public EmployeeDTO() {
    }

    public EmployeeDTO(String eid, String emname, String emphone, String ememail, String emrole, String birthdate, String imgpath) {
        this.eid = eid;
        this.emname = emname;
        this.emphone = emphone;
        this.ememail = ememail;
        this.emrole = emrole;
        this.birthdate = birthdate;
        this.imgpath = imgpath;
    }



    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getEmname() {
        return emname;
    }

    public void setEmname(String emname) {
        this.emname = emname;
    }

    public String getEmphone() {
        return emphone;
    }

    public void setEmphone(String emphone) {
        this.emphone = emphone;
    }

    public String getEmemail() {
        return ememail;
    }

    public void setEmemail(String ememail) {
        this.ememail = ememail;
    }

    public String getEmrole() {
        return emrole;
    }

    public void setEmrole(String emrole) {
        this.emrole = emrole;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }
    
    
    
    
}
