package com.example.edu.mapper;

import com.example.edu.entity.Teacher;

public interface TeacherMapper {

    Teacher findTeacherByAccountAndPassword(String name, String password);
}
