package com.example.edu.service;

import com.example.edu.entity.Teacher;

public interface TeacherService {

    Integer modifyUserInfo(Teacher teacher);
    Teacher findTeacherByAccountAndPassword(String name, String password);
}
