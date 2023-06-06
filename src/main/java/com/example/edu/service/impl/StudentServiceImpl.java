package com.example.edu.service.impl;

import com.example.edu.entity.Student;
import com.example.edu.mapper.StudentMapper;
import com.example.edu.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper mapper;

    @Override
    public Student findStudentById(String id) {
        return mapper.findStudentById(id);
    }

    @Override
    public void delete(String id) {
        mapper.delete(id);
    }

    @Override
    public void update(Student student) {
        mapper.update(student);
    }

    @Override
    public PageInfo queryPage(Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<Student> list = mapper.findAll();
        return new PageInfo(list);
    }

    @Override
    public void add(Student student) {
        mapper.add(student);
    }

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
