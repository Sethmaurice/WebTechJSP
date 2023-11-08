package com.example.student_mis.Service;

import com.example.student_mis.dao.CourseDao;
import com.example.student_mis.model.Course;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class CourseServiceImpl extends RemoteException implements CourseService {
    CourseDao courseDao = new CourseDao();
    @Override
    public boolean addCourse(Course course) {
        return courseDao.addCourse(course);
    }

    @Override
    public List<Course> getCourse() throws RemoteException {
        return courseDao.findAll();
    }

    @Override
    public Course courseById(UUID id) {
        return courseDao.courseById(id);
    }

    @Override
    public List<Course> courseByDepAndSem(UUID depId, UUID semId) {

        return courseDao.courseByDepAndSem(depId, semId);
    }
}
