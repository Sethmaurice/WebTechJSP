package com.example.student_mis.dao;

import com.example.student_mis.model.AcademicUnit;
import com.example.student_mis.model.Course;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class AcademicUnitDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public boolean addAcademicUnit(AcademicUnit academicUnit){
        Transaction tx = session.beginTransaction();
        session.merge(academicUnit);
        tx.commit();
        session.close();
        return true;
    }
    public List<AcademicUnit> findAll() {
        return session.createQuery("from AcademicUnit ", AcademicUnit.class).list();
    }

    public AcademicUnit findUnitByName(String name){
        Query<AcademicUnit> query = session.createQuery("from AcademicUnit  where name = :unitName", AcademicUnit.class);
        query.setParameter("unitName", name);

        return query.uniqueResult();
    }

    public boolean deleteUnit(AcademicUnit unit){
        Transaction tx = session.beginTransaction();
        session.remove(unit);
        tx.commit();
        session.close();
        return true;
    }
    public AcademicUnit findUnitById(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM AcademicUnit WHERE name = :unitId";
            Query<AcademicUnit> query = session.createQuery(hql, AcademicUnit.class);
            query.setParameter("unitId", id);

            return query.uniqueResult();
        }
    }
    public List<AcademicUnit> getAllAcademicUnit(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM AcademicUnit";
            Query<AcademicUnit> query =  session.createQuery(hql, AcademicUnit.class);
            return query.list();
        } finally {
            session.close();
        }
    }
}
