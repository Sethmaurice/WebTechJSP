package com.example.student_mis.Service;

import com.example.student_mis.dao.StudentCourseDao;
import com.example.student_mis.model.StudentCourse;

import java.util.List;
import java.util.UUID;

public class StudentCourseServiceImpl implements StudentCourseService{
    StudentCourseDao studentCourseDao = new StudentCourseDao();
    @Override
    public boolean addStudentCourse(StudentCourse studentCourse) {
        return studentCourseDao.addStudentCourse(studentCourse);
    }

    @Override
    public List<StudentCourse> studentCourseList() {
        return studentCourseDao.studentCourseList();
    }

    @Override
    public boolean deleteStudentCourse(StudentCourse studentCourse) {
        return studentCourseDao.deleteStudentCourse(studentCourse);
    }

    @Override
    public List<Object[]> getRegisteredStudents() {
        return studentCourseDao.getRegisteredStudents();
    }

    @Override
    public List<StudentCourse> studentBySemAndCourse(UUID crId, UUID smId) {
        return studentCourseDao.studentBySemAndCourse(crId, smId);
    }

    @Override
    public List<StudentCourse> courseByStudentId(UUID id) {
        return studentCourseDao.courseByStudentId(id);
    }
}
