package com.example.student_mis.dao;

import com.example.student_mis.model.Student;
import com.example.student_mis.model.StudentCourse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class StudentCourseDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public StudentCourseDao() {
    }

    public boolean addStudentCourse(StudentCourse studentCourse){
        Transaction tx = session.beginTransaction();
        session.merge(studentCourse);
        tx.commit();
        session.close();
        return true;
    }

    public List<StudentCourse> studentCourseList(){
        return session.createQuery("from StudentCourse", StudentCourse.class).list();
    }

    public boolean deleteStudentCourse(StudentCourse studentCourse){
        Transaction tx = session.beginTransaction();
        session.remove(studentCourse);
        tx.commit();
        session.close();
        return true;
    }
    public List<Object[]> getRegisteredStudents() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("SELECT studreg.id, stud.regNo, stud.fullname FROM StudentRegistration studreg JOIN Student stud ON stud.regNo = studreg.student.regNo").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    public List<StudentCourse> studentBySemAndCourse(UUID crId, UUID smId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM StudentCourse WHERE course.courseDefinition.id = :crId and studentRegistration.semester.id = :smId";
            Query<StudentCourse> query = session.createQuery(hql, StudentCourse.class);
            query.setParameter("crId", crId);
            query.setParameter("smId", smId);

            return query.list();
        }
    }
    public List<StudentCourse> courseByStudentId(UUID id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM StudentCourse WHERE studentRegistration.student.id = :id";
            Query<StudentCourse> query = session.createQuery(hql, StudentCourse.class);
            query.setParameter("id", id);

            return query.list();
        }
    }
}
