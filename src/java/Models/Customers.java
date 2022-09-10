/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Customers {
    private String LoginName;
    private String Password;
    private String Name;
    private String Email;
    private String Phone;
    private int QuestionId;
    private String Answer;
    private boolean Active;
    private int Role = 1;

    public Customers() {
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }
    
    public Customers(String LoginName, String Password, String Name, String Email, String Phone, int QuestionId, String Answer, boolean Active) {
        this.LoginName = LoginName;
        this.Password = Password;
        this.Name = Name;
        this.Email = Email;
        this.Phone = Phone;    
        this.QuestionId = QuestionId;
        this.Answer = Answer;
        this.Active = Active;
    }


    public String getLoginName() {
        return LoginName;
    }

    public void setLoginName(String LoginName) {
        this.LoginName = LoginName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public int getQuestionId() {
        return QuestionId;
    }

    public void setQuestionId(int QuestionId) {
        this.QuestionId = QuestionId;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    public boolean isActive() {
        return Active;
    }

    public void setActive(boolean Active) {
        this.Active = Active;
    }
    
    
}
