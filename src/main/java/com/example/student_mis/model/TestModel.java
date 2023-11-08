package com.example.student_mis.model;

import com.example.student_mis.dao.HibernateUtil;

public class TestModel {
    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
    }
}
