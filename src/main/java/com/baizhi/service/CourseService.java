package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Course;

import java.util.List;

public interface CourseService {
    void addCourse(Course course);

    List<Course> findByPage(Integer page, Integer rows);
    Long findTotals();
    void removeCourse(String id);
}
