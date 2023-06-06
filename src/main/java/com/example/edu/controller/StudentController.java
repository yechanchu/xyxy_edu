package com.example.edu.controller;

import com.example.edu.entity.Student;
import com.example.edu.service.StudentService;
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
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService service;

    @RequestMapping("/edit")
    @ResponseBody
    public Student edit(String id){
        return service.findStudentById(id);
    }

    @RequestMapping("/add")
    public String add(Student student, MultipartFile multipartFile, HttpServletRequest request) throws IOException {
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
            student.setAvatar("/upload/" + fileName);
        }
        if (student.getId() == null || "".equals(student.getId())){
            //设置学生id
            student.setId(Util.get32uuid());
            service.add(student);
        }else {
            service.modifyUserInfo(student);
        }
        return listPage(1, 8, request);
    }

    @RequestMapping("/listPage")
    public String listPage(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam( defaultValue = "8") Integer pageSize, HttpServletRequest request){
        PageInfo pageInfo = service.queryPage(currentPage, pageSize);
        request.setAttribute("pageInfo", pageInfo);
        return "student/student_list";
    }
}
