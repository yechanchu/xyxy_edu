package com.example.edu.mapper;

import com.example.edu.entity.Teacher;

import java.util.List;

public interface TeacherMapper {

    void del(String id);
    List<Teacher> findAll();

    Integer modifyUserInfo(Teacher teacher);

    Teacher findTeacherByAccountAndPassword(String name, String password);
}
