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
public class CandidateDTO {

    private String cID;
    private String name;
    private String phone;
    private String email;
    private String imgPath;
    private String birthdate;

    public CandidateDTO() {
    }

    public CandidateDTO(String cID, String name, String phone, String email, String imgPath, String birthdate) {
        this.cID = cID;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.imgPath = imgPath;
        this.birthdate = birthdate;
    }

    public String getcID() {
        return cID;
    }

    public void setcID(String cID) {
        this.cID = cID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

}
