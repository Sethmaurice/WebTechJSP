package com.example.student_mis.Service;

import com.example.student_mis.dao.ListingDao;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class ListingServiceImpl implements ListingService{
    ListingDao listingDao = new ListingDao();
    @Override
    public List<Object[]> listStudentsByCourse(UUID course_id) throws RemoteException {
        return listingDao.getStudentsByCourse(course_id);
    }

    @Override
    public List<Object[]> listStudentsByDepartment(UUID acc_id) throws RemoteException {
        return listingDao.getStudentsByDepartment(acc_id);
    }

    @Override
    public List<Object[]> listCoursesByStudent(UUID course_id) throws RemoteException {
        return listingDao.getCoursesByStudent(course_id);
    }

    @Override
    public List<Object[]> listCoursesByDepartment(UUID course_id) throws RemoteException {
        return listingDao.getCoursesByDepartment(course_id);
    }

    @Override
    public List<Object[]> listStudentsBySemester(UUID stud_id) throws RemoteException {
        return listingDao.getStudentsBySemester(stud_id);
    }
}
