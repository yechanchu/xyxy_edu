package com.example.edu.service.impl;

import com.example.edu.entity.New;
import com.example.edu.mapper.NewMapper;
import com.example.edu.service.NewService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewServiceImpl implements NewService {

    @Autowired
    private NewMapper mapper;


    @Override
    public void del(String id) {
        mapper.del(id);
    }

    @Override
    public void update(New news) {
        mapper.update(news);
    }

    @Override
    public New findNewById(String id) {
        return mapper.findNewById(id);
    }

    @Override
    public void add(New news) {
        mapper.add(news);
    }

    @Override
    public PageInfo findAll(Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<New> list = mapper.findAll();
        return new PageInfo<New>(list);
    }
}
