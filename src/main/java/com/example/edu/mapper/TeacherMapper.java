package com.example.edu.mapper;

import com.example.edu.entity.Teacher;

public interface TeacherMapper {

    Integer modifyUserInfo(Teacher teacher);

    Teacher findTeacherByAccountAndPassword(String name, String password);
}
