package com.example.edu.mapper;

import com.example.edu.entity.Student;

public interface StudentMapper {

    Student findStudentByAccountAndPassword(String name, String password);
}
