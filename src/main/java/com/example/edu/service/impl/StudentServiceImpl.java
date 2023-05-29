package com.example.edu.service.impl;

import com.example.edu.entity.Student;
import com.example.edu.mapper.StudentMapper;
import com.example.edu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper mapper;

    @Override
    public Integer modifyUserInfo(Student student) {
        return mapper.modifyUserInfo(student);
    }

    @Override
    public Student findStudentByAccountAndPassword(String name, String password) {
        Student student = mapper.findStudentByAccountAndPassword(name, password);
        return student;
    }
}
