package com.example.edu.service.impl;

import com.example.edu.entity.Teacher;
import com.example.edu.mapper.TeacherMapper;
import com.example.edu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper mapper;

    @Override
    public Integer modifyUserInfo(Teacher teacher) {
        return mapper.modifyUserInfo(teacher);
    }

    @Override
    public Teacher findTeacherByAccountAndPassword(String name, String password) {
        return mapper.findTeacherByAccountAndPassword(name, password);
    }
}
