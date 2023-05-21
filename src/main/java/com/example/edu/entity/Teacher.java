package com.example.edu.entity;

public class Teacher {

    private String id;
    private String name;
    private String account;
    private String password;
    private String sex;
    private String avatar;

    public Teacher() {
    }

    public Teacher(String id, String name, String account, String password, String sex, String avatar) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.sex = sex;
        this.avatar = avatar;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
