package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();

        List<Course> courses = courseService.findByPage(page, rows);

        Long totals = courseService.findTotals();
        results.put("total",totals);
        results.put("rows",courses);

        return results;
    }
    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Course course){
        Map<String,Object> results = new HashMap<String,Object>();
        try {

           courseService.addCourse(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            courseService.removeCourse(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

}
