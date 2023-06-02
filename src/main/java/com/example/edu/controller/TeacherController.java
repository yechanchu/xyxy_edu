package com.example.edu.controller;

import com.example.edu.entity.Teacher;
import com.example.edu.service.TeacherService;
import com.example.edu.util.Util;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("teacher")
public class TeacherController {

    @Autowired
    private TeacherService service;

    @RequestMapping("/findTeacherById")
    @ResponseBody
    public Teacher findTeacherById(String id, HttpServletRequest request){
        return service.findTeacherById(id);
    }

    @RequestMapping("/add")
    public String add(MultipartFile multipartFile, Teacher teacher, HttpServletRequest request) throws IOException {
        //获取上传图片，将路径存入avatar
        if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
            //获取头像文件原名
            String originalFilename = multipartFile.getOriginalFilename();
            //图片在服务器中的文件名
            String fileName = Util.get32uuid() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //存储资源目录
            String realPath = request.getServletContext().getRealPath("/upload");
            //存储资源路径
            String savePath = realPath + "/" + fileName;
            //保存附件
            multipartFile.transferTo(new File(savePath));
            //将附件路径存入数据库
            teacher.setAvatar("/upload/" + fileName);
        }
        if (teacher.getId() == null || "".equals(teacher.getId())){
            //设置教师id
            teacher.setId(Util.get32uuid());
            service.add(teacher);
        }else {
            service.modifyUserInfo(teacher);
        }

        return findAll(1, 8, request);
    }

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
