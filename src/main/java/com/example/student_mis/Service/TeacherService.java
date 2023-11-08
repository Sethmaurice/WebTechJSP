package com.example.student_mis.Service;

import com.example.student_mis.model.CourseDefinition;
import com.example.student_mis.model.Teacher;

import java.rmi.RemoteException;
import java.util.List;

public interface TeacherService {
    public boolean addTeacher(Teacher teacher);
    public List<Teacher> getTeacher() throws RemoteException;
    public boolean deleteTeacher(Teacher teacher);
    public Teacher findTeacherByName(String name);
}
