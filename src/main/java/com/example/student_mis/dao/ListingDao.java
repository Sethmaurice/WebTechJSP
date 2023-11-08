package com.example.student_mis.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;
import java.util.UUID;
public class ListingDao {
        public List<Object[]> getStudentsByCourse(UUID course_id) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                String hql = "SELECT c.course_id, st.regNo, st.fullName, cd.course_def_code, cd.course_name FROM CourseDefinition cd JOIN Course c ON cd.course_def_id = c.courseDefinition.course_def_id JOIN StudentCourse sc ON c.course_id = sc.course.course_id JOIN StudentRegistration stu ON stu.reg_id = sc.studentRegistration.reg_id JOIN Student st On st.stud_id = stu.student.stud_id WHERE c.courseDefinition.course_def_id = :courseId";
                Query<Object[]> query = session.createQuery(hql);
                query.setParameter("courseId", course_id);
                return query.list();
            } finally {
                session.close();
            }
        }

        public List<Object[]> getCoursesByStudent(UUID stud_id) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                String hql = "SELECT s.reg_id, stu.regNo, stu.fullName, cd.course_def_code, cd.course_name " +
                        "FROM StudentCourse sc " +
                        "JOIN sc.course c " +
                        "JOIN c.courseDefinition cd " +
                        "JOIN sc.studentRegistration s " +
                        "JOIN s.student stu " +
                        "WHERE s.reg_id = :stud_id";

                Query<Object[]> query = session.createQuery(hql);
                query.setParameter("stud_id", stud_id);
                return query.list();
            } finally {
                session.close();
            }
        }

        public List<Object[]> getCoursesByDepartment(UUID dep_id) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                String hql = "SELECT c.course_id, cd.course_def_code, cd.course_name " +
                        "FROM Course c " +
                        "JOIN c.courseDefinition cd " +
                        "JOIN c.id acc " +
                        "WHERE acc. = :dep_id";

                Query<Object[]> query = session.createQuery(hql);
                query.setParameter("dep_id", dep_id);
                return query.list();
            } finally {
                session.close();
            }
        }

        public List<Object[]> getStudentsBySemester(UUID sem_id) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                String hql = "SELECT sem.id, st.regNo, st.fullname FROM StudentRegistration stu JOIN Student st On st.regNo = stu.student.regNo JOIN Semester sem ON sem.id = stu.semester.id WHERE sem.id = :sem_id";
                Query<Object[]> query = session.createQuery(hql);
                query.setParameter("sem_id", sem_id);
                return query.list();
            } finally {
                session.close();
            }
        }

        public List<Object[]> getStudentsByDepartment(UUID acc_id) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                String hql = "SELECT st.id, st.regNo, st.fullname, acc.name FROM StudentRegistration stu JOIN AcademicUnit acc ON acc.id = stu.unit.id JOIN Student st On st.id = stu.student.regNo WHERE acc.id = :accId";
                Query<Object[]> query = session.createQuery(hql);
                query.setParameter("accId", acc_id);
                return query.list();
            } finally {
                session.close();
            }
        }
    }