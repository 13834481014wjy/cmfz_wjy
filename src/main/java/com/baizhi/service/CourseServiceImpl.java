package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Override
    public void addCourse(Course course) {
        course.setId(UUID.randomUUID().toString());
        course.setCreateTime(new Date());
        courseDao.insert(course);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Course> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return courseDao.queryByPage(start,rows);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long findTotals() {
        return courseDao.queryTotals();
    }

    @Override
    public void removeCourse(String id) {
        courseDao.delete(id);
    }
}
