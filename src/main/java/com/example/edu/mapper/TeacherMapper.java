package com.example.edu.mapper;

import com.example.edu.entity.Teacher;

import java.util.List;

public interface TeacherMapper {

    void modify(Teacher teacher);
    Teacher findTeacherById(String id);
    void add(Teacher teacher);
    void del(String id);
    List<Teacher> findAll();

    Integer modifyExceptAvatar(Teacher teacher);
    Integer modifyUserInfo(Teacher teacher);

    Teacher findTeacherByAccountAndPassword(String name, String password);
}
