package com.example.student_mis.dao;

import com.example.student_mis.model.Course;
import com.example.student_mis.model.CourseDefinition;
import com.example.student_mis.model.Semester;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class CourseDefinitionDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public boolean addCourseDefinition(CourseDefinition courseDefinition){
        Transaction tx = session.beginTransaction();
        session.merge(courseDefinition);
        tx.commit();
        session.close();
        return true;
    }
    public List<CourseDefinition> findAll() {
        Session session = null;
        List<CourseDefinition> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from CourseDefinition ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;

    }
    public CourseDefinition findCourseByName(String name) { // Correct the return type here
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM CourseDefinition WHERE name = :name"; // Correct the entity name
            Query<CourseDefinition> query = session.createQuery(hql, CourseDefinition.class); // Update the generic type
            query.setParameter("name", name);
            return query.uniqueResult();
        }
    }
    public boolean deleteCourse(CourseDefinition courseDefinition){
        Transaction tx = session.beginTransaction();
        session.remove(courseDefinition);
        tx.commit();
        session.close();
        return true;
    }
    public List<CourseDefinition> getAllCourseDefinitions() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM CourseDefinition";
            Query<CourseDefinition> query = session.createQuery(hql, CourseDefinition.class);
            return query.list();
        } finally {
            session.close();
        }
    }
}
