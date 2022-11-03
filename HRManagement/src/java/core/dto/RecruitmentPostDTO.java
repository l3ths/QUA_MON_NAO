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
public class RecruitmentPostDTO {
    private String postID;
    private String dateFrom;
    private String dateTo;

    public RecruitmentPostDTO() {
    }

    public RecruitmentPostDTO(String postID, String dateFrom, String dateTo) {
        this.postID = postID;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
    }


    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

}
