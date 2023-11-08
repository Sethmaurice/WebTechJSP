package com.example.student_mis.dao;

import com.example.student_mis.model.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UserDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public String insertStudent(Users users){
        Transaction tx = session.beginTransaction();
        session.merge(users);
        tx.commit();
        session.close();
        return "Inserted successfully";
    }
    public List<Users> displayStudents(){
        return session.createQuery("from Users", Users.class).list();
    }

    public String loginUser(String email, String password){
        Query<Users> query = session.createQuery("from Users where email=:email and password=:password", Users.class);
        query.setParameter("email", email);
        query.setParameter("password", password);

        List<Users> userss = query.list();

        if(!userss.isEmpty()){
            return "Logged in";
        }return "Invalid credentials";
    }
}

