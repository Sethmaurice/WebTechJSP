package com.example.student_mis.Service;

import com.example.student_mis.dao.AcademicUnitDao;
import com.example.student_mis.model.AcademicUnit;

import java.rmi.RemoteException;
import java.util.List;

public class AcademicServiceImpl  extends RemoteException implements AcademicService {
    AcademicUnitDao academicUnitDao = new AcademicUnitDao();
    @Override
    public boolean addAcademicUnit(AcademicUnit academicUnit) {
        return academicUnitDao.addAcademicUnit(academicUnit);
    }

    @Override
    public List<AcademicUnit> findAll() {
        return academicUnitDao.findAll();
    }

    @Override
    public AcademicUnit findUnitByName(String name) {
        return academicUnitDao.findUnitByName(name);
    }

    @Override
    public boolean deleteUnit(AcademicUnit unit) {
        return academicUnitDao.deleteUnit(unit);
    }

    @Override
    public AcademicUnit findUnitById(String id) {
        return academicUnitDao.findUnitById(id);
    }

    @Override
    public List<AcademicUnit> getAllAcademicUnit() {
        return academicUnitDao.getAllAcademicUnit();
    }
}
