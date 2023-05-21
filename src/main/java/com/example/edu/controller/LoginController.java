package com.example.edu.controller;

import com.example.edu.entity.Student;
import com.example.edu.entity.Teacher;
import com.example.edu.service.StudentService;
import com.example.edu.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.PrintWriter;

@Controller
public class LoginController {

    @RequestMapping("/")
    public String one(){
        return "login";
    }

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @PostMapping("/login")
    public String login(String name, String password, String identity, HttpServletRequest request){
        if (identity.equals("teacher")){
            Teacher teacher = teacherService.findTeacherByAccountAndPassword(name, password);
            if (teacher != null) {
                return "index";
            }
        } else if (identity.equals("student")) {
            Student student = studentService.findStudentByAccountAndPassword(name, password);
            if (student != null) {
                return "index";
            }
        }
        request.setAttribute("error", "对不起，你的用户名或密码不正确！");
        return "login";
    }
}
