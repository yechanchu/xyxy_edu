package com.example.edu.controller;

import com.example.edu.entity.Log;
import com.example.edu.service.LogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/log")
@Controller
public class LogController {

    @Autowired
    private LogService service;

    @RequestMapping("/export")
    public void export(HttpServletResponse response) throws IOException {
        service.export(response);
    }

    @RequestMapping("/listPage")
    public String listPage(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "8") Integer pageSize, HttpServletRequest request){
        PageInfo pageInfo = service.listPage(currentPage, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "base/log_list";
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request){
        List<Log> list = service.findAll();
        request.setAttribute("log_list", list);
        return "base/log_list";
    }
}
