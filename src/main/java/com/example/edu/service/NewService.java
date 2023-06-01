package com.example.edu.service;

import com.example.edu.entity.New;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface NewService {

    void del(String id);
    void update(New news);
    New findNewById(String id);
    void add(New news);
    PageInfo findAll(Integer currentPage, Integer pageSize);
}
