package com.example.edu.mapper;

import com.example.edu.entity.Log;

import java.util.List;

public interface LogMapper {

    List<Log> findAll();

    void save(Log log);
}
