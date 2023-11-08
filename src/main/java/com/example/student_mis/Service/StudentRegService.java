package com.example.student_mis.Service;

import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Student;
import com.example.student_mis.model.StudentRegistration;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface StudentRegService {

    public boolean addStudentRegistration(StudentRegistration studentRegistration);
    public List<StudentRegistration> getStudentRegistration() throws RemoteException;
    public StudentRegistration studRegistrationById(UUID id);
    public StudentRegistration findRegistrationByName(String name);
    public boolean deleteStudentRegistration(StudentRegistration studentRegistration);
    public List<StudentRegistration> getStudentBySemester(UUID id);
    public List<StudentRegistration> getStudentBySemesterAndDepartment(UUID id, UUID unitId);

    }
