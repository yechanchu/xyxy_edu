package com.example.edu.service;

import com.example.edu.entity.Teacher;
import com.github.pagehelper.PageInfo;

public interface TeacherService {

    void del(String id);
    PageInfo findAll(Integer currentPage, Integer pageSize);
    Integer modifyUserInfo(Teacher teacher);
    Teacher findTeacherByAccountAndPassword(String name, String password);
}
