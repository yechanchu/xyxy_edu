package com.example.edu.service.impl;

import com.example.edu.entity.Teacher;
import com.example.edu.mapper.TeacherMapper;
import com.example.edu.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper mapper;

    @Override
    public Teacher findTeacherById(String id) {
        return mapper.findTeacherById(id);
    }

    @Override
    public void add(Teacher teacher) {
        mapper.add(teacher);
    }

    @Override
    public void del(String id) {
        mapper.del(id);
    }

    @Override
    public PageInfo findAll(Integer currentPage, Integer pageSize) {
        List<Teacher> list = mapper.findAll();
        PageHelper.startPage(currentPage, pageSize);
        return new PageInfo<>(list);
    }

    @Override
    public Integer modifyUserInfo(Teacher teacher) {
        if (teacher.getAvatar() == null) {
            return mapper.modifyExceptAvatar(teacher);
        }
        return mapper.modifyUserInfo(teacher);
    }

    @Override
    public Teacher findTeacherByAccountAndPassword(String name, String password) {
        return mapper.findTeacherByAccountAndPassword(name, password);
    }
}
