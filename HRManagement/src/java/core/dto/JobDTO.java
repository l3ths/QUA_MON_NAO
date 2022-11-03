/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package core.dto;

/**
 *
 * @author ADMIN
 */
public class JobDTO {

    private String jobID;
    private String name;
    private int salary;
    private String desription;
    private String experienceRequirement;
    private String educationRequirement;
    private String imgPath;

    public JobDTO() {
        this.jobID = "";
        this.name = "";
        this.salary = 0;
        this.desription = "";
        this.experienceRequirement = "";
        this.educationRequirement = "";
        this.imgPath = "";
    }

    public JobDTO(String jobID, String name, int salary, String desription, String experienceRequirement, String educationRequirement, String imgPath) {
        this.jobID = jobID;
        this.name = name;
        this.salary = salary;
        this.desription = desription;
        this.experienceRequirement = experienceRequirement;
        this.educationRequirement = educationRequirement;
        this.imgPath = imgPath;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getDesription() {
        return desription;
    }

    public void setDesription(String desription) {
        this.desription = desription;
    }

    public String getExperienceRequirement() {
        return experienceRequirement;
    }

    public void setExperienceRequirement(String experienceRequirement) {
        this.experienceRequirement = experienceRequirement;
    }

    public String getEducationRequirement() {
        return educationRequirement;
    }

    public void setEducationRequirement(String educationRequirement) {
        this.educationRequirement = educationRequirement;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

}
