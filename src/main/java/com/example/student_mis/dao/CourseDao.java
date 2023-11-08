package com.example.student_mis.dao;

import com.example.student_mis.model.Course;
import com.example.student_mis.model.Semester;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CourseDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public boolean addCourse(Course course) {
        Transaction tx = session.beginTransaction();
        session.merge(course);
        tx.commit();
        session.close();
        return true;
    }

    public List<Course> findAll() {
        Session session = null;
        List<Course> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from Course ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

    public boolean deleteCourse(Course course) {
        Transaction tx = session.beginTransaction();
        session.remove(course);
        tx.commit();
        session.close();
        return true;
    }
    public Course courseById(UUID id){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Course WHERE id = :id";
            Query<Course> query = session.createQuery(hql, Course.class);
            query.setParameter("id", id);

            return query.uniqueResult();
        }
    }
    public List<Course> courseByDepAndSem(UUID depId, UUID semId){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Course WHERE semester.id = :semId and department.id = :depId";
            Query<Course> query = session.createQuery(hql, Course.class);
            query.setParameter("depId", depId);
            query.setParameter("semId", semId);

            return query.list();
        }
    }
}
