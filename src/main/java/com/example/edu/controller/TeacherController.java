package com.example.edu.controller;

import com.example.edu.entity.Teacher;
import com.example.edu.service.TeacherService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("teacher")
public class TeacherController {

    @Autowired
    private TeacherService service;

    @RequestMapping("del")
    public String del(String id, HttpServletRequest request){
        service.del(id);
        return findAll(1, 8, request);
    }

    @RequestMapping("/findAll")
    public String findAll(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "8") Integer pageSize, HttpServletRequest request){
        PageInfo pageInfo = service.findAll(currentPage, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "/teacher/teacher_list";
    }
}
