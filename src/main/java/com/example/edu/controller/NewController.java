package com.example.edu.controller;

import com.example.edu.entity.New;
import com.example.edu.service.NewService;
import com.example.edu.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/new")
@Controller
public class NewController {

    @Autowired
    private NewService service;

    @RequestMapping("/del")
    public String del(String id, HttpServletRequest request){
        service.del(id);
        return findAll(1, 8, request);
    }

    public String update(New news, HttpServletRequest request){
        news.setModify_time(Util.getCurrentTime());
        service.update(news);
        return findAll(1, 8, request);
    }

    @RequestMapping("/edit")
    @ResponseBody
    public New edit(String id){
        return service.findNewById(id);
    }

    @RequestMapping("/upload")
    @ResponseBody
    public Map upload(MultipartFile file, HttpServletRequest request) throws IOException {
        Map<String, String> map = new HashMap<>();
        if (file != null && file.getSize() > 0) {
            //图片原始名
            String originalFilename = file.getOriginalFilename();
            //图片后缀名
            String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
            //存储路径
            String uploadPath = "/upload/";
            //最终路径
            String realPath = request.getServletContext().getRealPath(uploadPath);

            File uploadFile = new File(realPath);
            //若目录不存在，创建
            if (!uploadFile.exists()) {
                uploadFile.mkdirs();
            }
            //图片文件名
            String fileName = Util.get32uuid() + suffix;
            //上传
            file.transferTo(new File(uploadFile, fileName));
            //最终文件名
            String location = uploadPath + fileName;
            map.put("location", location);
        }
        return map;
    }

    @RequestMapping("/view")
    public String view(String id,HttpServletRequest request){
        New news = service.findNewById(id);
        request.setAttribute("news", news);
        return "new/new_view";
    }

    @RequestMapping("/add")
    public String add(New news, HttpServletRequest request){
        if (news.getId() == null || "".equals(news.getId())){
            news.setId(Util.get32uuid());
            news.setCreate_time(Util.getCurrentTime());
            service.add(news);
            return findAll(1, 8, request);
        }
        return update(news,request);
    }

    @RequestMapping("/findAll")
    public String findAll(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "8") Integer pageSize, HttpServletRequest request){
        request.setAttribute("pageInfo", service.findAll(currentPage, pageSize));
        return "/new/new_list";
    }
}
