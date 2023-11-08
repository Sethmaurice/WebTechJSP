package com.example.student_mis.dao;

import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Student;
import com.example.student_mis.model.StudentRegistration;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class StudentRegDao {

        Session session = HibernateUtil.getSessionFactory().openSession();

        public boolean addStudentRegistration(StudentRegistration studentRegistration){
        Transaction tx = session.beginTransaction();
        session.merge(studentRegistration);
        tx.commit();
        session.close();
        return true;
    }
        public List<StudentRegistration> findAll() {
        Session session = null;
        List<StudentRegistration> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from StudentRegistration ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;

    }
    public StudentRegistration studRegistrationById(UUID id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM StudentRegistration WHERE id = :id";
            Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        }
    }
    public boolean deleteStudentRegistration(StudentRegistration studentRegistration){
        Transaction tx = session.beginTransaction();
        session.remove(studentRegistration);
        tx.commit();
        session.close();
        return true;
    }
    public StudentRegistration findRegByName(String name) {
        Transaction tx = session.beginTransaction();
        session.remove(name);
        tx.commit();
        session.close();
        return new StudentRegistration();
    }
    public List<StudentRegistration> getStudentBySemester(UUID id){
        try(Session session1 = HibernateUtil.getSessionFactory().openSession()){
            String hql = "FROM StudentRegistration WHERE semester.id = :id";
            Query<StudentRegistration> query = session1.createQuery(hql, StudentRegistration.class);
            query.setParameter("id", id);

            return query.list();
        }
    }
    public List<StudentRegistration> getStudentBySemesterAndDepartment(UUID id, UUID unitId){
        try(Session session1 = HibernateUtil.getSessionFactory().openSession()){
            String hql = "FROM StudentRegistration WHERE semester.id = :id and unit.id = :unitId";
            Query<StudentRegistration> query = session1.createQuery(hql, StudentRegistration.class);
            query.setParameter("id", id);
            query.setParameter("unitId", unitId);

            return query.list();
        }
    }

}

