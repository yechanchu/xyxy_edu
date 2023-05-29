package com.example.edu.mapper;

import com.example.edu.entity.Student;

public interface StudentMapper {

    Integer modifyUserInfo(Student student);
    Student findStudentByAccountAndPassword(String name, String password);
}
