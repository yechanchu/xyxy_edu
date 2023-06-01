package com.example.edu.entity;

import lombok.Data;

@Data
public class Student extends User {

    private String id;
    private String name;
    private String account;
    private String password;

    private String sex;
    private String avatar;

}
