package com.example.edu.controller;

import com.example.edu.entity.Student;
import com.example.edu.entity.Teacher;
import com.example.edu.service.StudentService;
import com.example.edu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;



    /**
     *
     * @return 起始页
     */
    @RequestMapping("/")
    public String index(){
        return "login";
    }

    /**
     * 登录
     * @param name 用户名
     * @param password 密码
     * @param identity 身份
     * @param request 请求域
     * @return 成功：跳转至首页；失败：跳自己
     */
    @PostMapping("/login")
    public String login(String name, String password, String identity, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (identity.equals("teacher")){
            Teacher teacher = teacherService.findTeacherByAccountAndPassword(name, password);
            if (teacher != null) {
                session.setAttribute("user", teacher);
                return "index";
            }
        } else if (identity.equals("student")) {
            Student student = studentService.findStudentByAccountAndPassword(name, password);
            if (student != null) {
                session.setAttribute("user", student);
                return "index";
            }
        }
        request.setAttribute("error", "对不起，你的用户名或密码不正确！");
        return "login";
    }

    /**
     * 退出
     * @return 跳转至起始页
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "login";
    }
}
