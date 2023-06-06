package com.example.edu.entity;

import lombok.Data;

@Data
public class Student{

    private String id;
    private String name;
    private String account;
    private String password;
    private Professional professional;
    private String sex;
    private String avatar;

}
