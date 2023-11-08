package com.example.student_mis.Service;

import com.example.student_mis.dao.StudentDao;
import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Student;

import java.rmi.RemoteException;
import java.util.List;

public class StudentServiceImpl implements StudentService{
    StudentDao studentDao = new StudentDao();
    @Override
    public boolean addStudent(Student student) {
        return studentDao.addStudent(student);
    }

    @Override
    public List<Student> getStudents() throws RemoteException {
        return studentDao.findAll();
    }

    @Override
    public boolean deleteStudent(Student student) {
        return studentDao.deleteStudent(student);
    }

    @Override
    public Student findStudentByName(String fullname) {
        return studentDao.findStudentByName(fullname);
    }

    @Override
    public Student findStudentByRegNo(String regNo) {
        return studentDao.findStudentByRegNo(regNo);
    }

    @Override
    public List<Student> getStudentsBySemester(Semester semester) {
        return studentDao.getStudentsBySemester(semester);
    }
}
