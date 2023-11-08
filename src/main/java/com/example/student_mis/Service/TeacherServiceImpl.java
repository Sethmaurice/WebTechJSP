package com.example.student_mis.Service;

import com.example.student_mis.dao.TeacherDao;
import com.example.student_mis.model.Teacher;

import java.rmi.RemoteException;
import java.util.List;

public class TeacherServiceImpl extends RemoteException implements TeacherService {
    TeacherDao teacherDao = new TeacherDao();
    @Override
    public boolean addTeacher(Teacher teacher) {
        return teacherDao.addTeacher(teacher);
    }

    @Override
    public List<Teacher> getTeacher() throws RemoteException {
        return teacherDao.findAll();
    }

    @Override
    public boolean deleteTeacher(Teacher teacher) {
        return teacherDao.deleteTeacher(teacher);
    }

    @Override
    public Teacher findTeacherByName(String name) {
        return teacherDao.findTeacherByName(name);
    }
}
