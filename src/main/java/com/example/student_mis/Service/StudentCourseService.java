package com.example.student_mis.Service;

import com.example.student_mis.model.StudentCourse;

import java.util.List;
import java.util.UUID;

public interface StudentCourseService {
    public boolean addStudentCourse(StudentCourse studentCourse);
    public List<StudentCourse> studentCourseList();
    public boolean deleteStudentCourse(StudentCourse studentCourse);
    public List<Object[]> getRegisteredStudents();
    public List<StudentCourse> studentBySemAndCourse(UUID crId, UUID smId);
    public List<StudentCourse> courseByStudentId(UUID id);
}
