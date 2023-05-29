package com.example.edu.controller;

import com.example.edu.entity.Teacher;
import com.example.edu.service.StudentService;
import com.example.edu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UserInfoController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/modifyUserInfo")
    public String modifyUserInfo(MultipartFile img, Teacher teacher, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession(false);
        Object user = session.getAttribute("user");

        if (user instanceof Teacher) {

            if (!img.isEmpty() && img.getSize() > 0) {
                //获取头像文件原名
                String originalFilename = img.getOriginalFilename();

                String fileName = UUID.randomUUID().toString().replace("-", "")+ originalFilename.substring(originalFilename.lastIndexOf("."));
                //存储资源目录
                String realPath = request.getServletContext().getRealPath("/upload");
                //存储资源路径
                String savePath = realPath + "/" + fileName;
                //保存附件
                img.transferTo(new File(savePath));
                //将附件路径存入数据库
                teacher.setAvatar("/upload/" + fileName);
            }
            if (teacherService.modifyUserInfo(teacher) == 1) {
                return "login";
            }
        }

        request.setAttribute("fail", "更新失败");
        return "index";
    }

}
