package entity;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.AssertTrue;

public class User {

    @Length(max = 14, min = 8, message = "用户名长度为8~14位")
    private String username;
    @Length(max = 14, min = 8, message = "密码长度为8~14位")
    private String password;
    private String confirmPassword;
    private String sex;
    private String work;
    private String hobby;
    private String note;

    @AssertTrue(message = "密码的值不能与用户名相同")
    public boolean isSameUsername() {
        if (username != null && username.equals(password)) {
            return false;
        } else {
            return true;
        }
    }

    @AssertTrue(message = "两次密码输入不一致")
    public boolean isSamePassword() {
        if (password != null && password.equals(confirmPassword)) {
            return true;
        } else {
            return false;
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", sex='" + sex + '\'' +
                ", work='" + work + '\'' +
                ", hobby='" + hobby + '\'' +
                ", note='" + note + '\'' +
                '}';
    }

}
