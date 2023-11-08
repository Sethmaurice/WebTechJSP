package com.example.student_mis.Service;

import com.example.student_mis.model.CourseDefinition;
import java.rmi.RemoteException;
import java.util.List;

public interface CourseDefService {
    public boolean addCourseDefinition(CourseDefinition courseDefinition);
    public List<CourseDefinition> getCourseDef() throws RemoteException;
    public CourseDefinition findCourseByName(String name); // Correct the return type here
    public boolean deleteCourse(CourseDefinition courseDefinition); // Update method name
    public List<CourseDefinition> getAllCourseDefinitions();
}

