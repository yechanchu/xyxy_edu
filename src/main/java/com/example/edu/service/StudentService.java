package com.example.edu.service;

import com.example.edu.entity.Student;

public interface StudentService {

    Integer modifyUserInfo(Student student);
    Student findStudentByAccountAndPassword(String name, String password);
}
