package com.example.edu.mapper;

import com.example.edu.entity.New;

import java.util.List;

public interface NewMapper {

    void del(String id);

    void update(New news);

    New findNewById(String id);

    void add(New news);

    List<New> findAll();
}
