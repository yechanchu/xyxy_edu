package com.example.edu.service;

import com.example.edu.entity.Student;

public interface StudentService {

    Student findStudentByAccountAndPassword(String name, String password);
}
