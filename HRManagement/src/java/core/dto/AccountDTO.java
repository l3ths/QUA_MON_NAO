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
public class AccountDTO {
    private String email;
    private String password;
    private String accrole;

    public AccountDTO() {
    }

    public AccountDTO(String email, String password, String accrole) {
        this.email = email;
        this.password = password;
        this.accrole = accrole;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccrole() {
        return accrole;
    }

    public void setAccrole(String accrole) {
        this.accrole = accrole;
    }

    
}
