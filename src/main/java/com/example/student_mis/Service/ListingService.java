package com.example.student_mis.Service;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface ListingService extends Remote{
        public List<Object[]> listStudentsByCourse(UUID course_id) throws RemoteException;
        public List<Object[]> listStudentsByDepartment(UUID acc_id) throws RemoteException;
        public List<Object[]> listCoursesByStudent(UUID course_id) throws RemoteException;
        public List<Object[]> listCoursesByDepartment(UUID course_id) throws RemoteException;
        public List<Object[]> listStudentsBySemester(UUID stud_id) throws RemoteException;

}
