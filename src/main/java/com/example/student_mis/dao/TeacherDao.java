package com.example.student_mis.dao;

import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Teacher;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class TeacherDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public boolean addTeacher(Teacher teacher){
        Transaction tx = session.beginTransaction();
        session.merge(teacher);
        tx.commit();
        session.close();
        return true;
    }
    public List<Teacher> findAll() {
        Session session = null;
        List<Teacher> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from Teacher ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }
    public boolean deleteTeacher(Teacher teacher){
        Transaction tx = session.beginTransaction();
        session.remove(teacher);
        tx.commit();
        session.close();
        return true;
    }

    public Teacher findTeacherByName(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Teacher WHERE names = :teacherName";
            Query<Teacher> query = session.createQuery(hql, Teacher.class);
            query.setParameter("teacherName", name);
            return query.uniqueResult();
        }
    }
}
