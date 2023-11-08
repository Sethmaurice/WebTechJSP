package com.example.student_mis.dao;

import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Student;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public boolean addStudent(Student student){
        Transaction tx = session.beginTransaction();
        session.merge(student);
        tx.commit();
        session.close();
        return true;
    }
    public List<Student> findAll() {
        Session session = null;
        List<Student> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from Student ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }
    public boolean deleteStudent(Student student){
        Transaction tx = session.beginTransaction();
        session.remove(student);
        tx.commit();
        session.close();
        return true;
    }

    public Student findStudentByName(String fullname) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Student WHERE fullname = :studentName";
            Query<Student> query = session.createQuery(hql, Student.class);
            query.setParameter("studentName", fullname);
            return query.uniqueResult();
        }
    }
    public Student findStudentByRegNo(String regNo){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Student WHERE regNo = :regNo";
            Query<Student> query = session.createQuery(hql, Student.class);
            query.setParameter("regNo", regNo);
            return query.uniqueResult();
        }
    }
    public List<Student> getStudentsBySemester(Semester semester) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "SELECT s FROM Student s JOIN s.StudentRegistration sr WHERE sr.semester = :semester";
            Query<Student> query = session.createQuery(hql, Student.class);
            query.setParameter("semester", semester);
            return query.list();
        }
    }
}
