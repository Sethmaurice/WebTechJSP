package com.example.student_mis.Service;

import com.example.student_mis.model.Course;
import com.example.student_mis.model.CourseDefinition;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface CourseService {
    public boolean addCourse(Course course);
    public List<Course> getCourse() throws RemoteException;
    public Course courseById(UUID id);
    public List<Course> courseByDepAndSem(UUID depId, UUID semId);

}
