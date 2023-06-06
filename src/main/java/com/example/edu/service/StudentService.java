package com.example.edu.service;

import com.example.edu.entity.Student;
import com.github.pagehelper.PageInfo;

public interface StudentService {

    Student findStudentById(String id);
    void delete(String id);
    void update(Student student);
    PageInfo queryPage(Integer currentPage, Integer pageSize);
    void add(Student student);
    Integer modifyUserInfo(Student student);
    Student findStudentByAccountAndPassword(String name, String password);
}
