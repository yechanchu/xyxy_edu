package com.example.edu.service;

import com.example.edu.entity.Teacher;
import com.github.pagehelper.PageInfo;

public interface TeacherService {

    Teacher findTeacherById(String id);
    void add(Teacher teacher);
    void del(String id);
    PageInfo findAll(Integer currentPage, Integer pageSize);
    //更新教师个人信息
    Integer modifyUserInfo(Teacher teacher);
    Teacher findTeacherByAccountAndPassword(String name, String password);
}
