package com.example.edu.mapper;

import com.example.edu.entity.Student;

import java.util.List;

public interface StudentMapper {

    Student findStudentById(String id);
    void delete(String id);
    void update(Student student);
    void add(Student student);
    List<Student> findAll();
    Integer modifyUserInfo(Student student);
    Student findStudentByAccountAndPassword(String name, String password);
}
