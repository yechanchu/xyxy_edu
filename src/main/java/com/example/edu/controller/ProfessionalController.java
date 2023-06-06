package com.example.edu.controller;

import com.example.edu.entity.Professional;
import com.example.edu.service.ProfessionalService;
import com.example.edu.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("professional")
public class ProfessionalController {

    @Autowired
    private ProfessionalService service;

    @RequestMapping("/delete")
    public String delete(String id, HttpServletRequest request){
        service.delete(id);
        return list(request);
    }

    @RequestMapping("/findProfessionalById")
    @ResponseBody
    public Professional findProfessionalById(String id){
        return service.findProfessionalById(id);
    }

    @RequestMapping("/update")
    public String update(Professional professional, HttpServletRequest request){
        service.update(professional);
        return list(request);
    }

    @RequestMapping("/save")
    public String save(Professional professional, HttpServletRequest request){
        if (professional.getId() == null || "".equals(professional.getId())) {
            professional.setId(Util.get32uuid());
            service.save(professional);
            return list(request);
        }
        return update(professional, request);
    }

    @RequestMapping("/listForStudent")
    @ResponseBody
    public List<Professional> listForStudent(HttpServletRequest request){
        return service.findAll();
    }

    @RequestMapping("list")
    public String list(HttpServletRequest request){
        List<Professional> list = service.findAll();
        request.setAttribute("list", list);

        return "base/professional_list";
    }
}
