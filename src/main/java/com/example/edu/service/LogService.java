package com.example.edu.service;

import com.example.edu.entity.Log;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface LogService {

    //导出
    void export(HttpServletResponse response) throws IOException;

    //currentPage：当前页，pageSize：当前页显示记录条数
    PageInfo listPage(Integer currentPage, Integer pageSize);

    List<Log> findAll();

    void save(Log log);
}
