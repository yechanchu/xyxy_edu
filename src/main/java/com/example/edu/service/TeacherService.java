package com.example.edu.service;

import com.example.edu.entity.Teacher;

public interface TeacherService {
    Teacher findTeacherByAccountAndPassword(String name, String password);
}
