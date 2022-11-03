/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dto;

/**
 *
 * @author ThinkPad T490
 */
public class CVDTO {

    private String cvid;
    private String education;
    private String experience;
    private String birthday;
    private int status;
    private String filecv;
    private String CID;
    private String CerID;

    public CVDTO() {
    }

    public CVDTO(String cvid, String education, String experience, String birthday, int status, String filecv, String CID, String CerID) {
        this.cvid = cvid;
        this.education = education;
        this.experience = experience;
        this.birthday = birthday;
        this.status = status;
        this.filecv = filecv;
        this.CID = CID;
        this.CerID = CerID;
    }

    public String getCvid() {
        return cvid;
    }

    public void setCvid(String cvid) {
        this.cvid = cvid;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFilecv() {
        return filecv;
    }

    public void setFilecv(String filecv) {
        this.filecv = filecv;
    }

    public String getCID() {
        return CID;
    }

    public void setCID(String CID) {
        this.CID = CID;
    }

    public String getCerID() {
        return CerID;
    }

    public void setCerID(String CerID) {
        this.CerID = CerID;
    }

}
