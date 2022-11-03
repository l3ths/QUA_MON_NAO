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
public class InterviewingDTO {
    private String iID;
    private String date;
    private String time;
    private String score;
    private String empID;
    private String cvID;
    private String jobID;

    public InterviewingDTO() {
    }

    public InterviewingDTO(String iID, String date, String time, String score, String empID, String cvID, String jobID) {
        this.iID = iID;
        this.date = date;
        this.time = time;
        this.score = score;
        this.empID = empID;
        this.cvID = cvID;
        this.jobID = jobID;
    }

    public String getiID() {
        return iID;
    }

    public void setiID(String iID) {
        this.iID = iID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public String getCvID() {
        return cvID;
    }

    public void setCvID(String cvID) {
        this.cvID = cvID;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

   
    
}
