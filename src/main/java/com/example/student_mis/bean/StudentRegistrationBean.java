package com.example.student_mis.bean;

import com.example.student_mis.enums.ERegistrationStatus;
import com.example.student_mis.model.AcademicUnit;
import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Student;
import jakarta.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import java.time.LocalDate;
import java.util.UUID;

public class StudentRegistrationBean {
    private UUID id;
    //    Academic Unit
    @OneToOne
    private Student student;
    @Column(name = "registration_date", columnDefinition = "DATE DEFAULT CURRENT_DATE")
    @Generated(GenerationTime.INSERT)
    private LocalDate registrationDate;
    @Enumerated(EnumType.STRING)
    private ERegistrationStatus registrationStatus;
    @ManyToOne
    private Semester semester;
    @OneToOne
    @JoinColumn(name = "unitId")
    private AcademicUnit unit;
    private String infoMessage;
    private String errorMessage;

    public StudentRegistrationBean() {
    }

    public StudentRegistrationBean(UUID id, Student student, LocalDate registrationDate, ERegistrationStatus registrationStatus, Semester semester, AcademicUnit unit, String infoMessage, String errorMessage) {
        this.id = id;
        this.student = student;
        this.registrationDate = registrationDate;
        this.registrationStatus = registrationStatus;
        this.semester = semester;
        this.unit = unit;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }

    public ERegistrationStatus getRegistrationStatus() {
        return registrationStatus;
    }

    public void setRegistrationStatus(ERegistrationStatus registrationStatus) {
        this.registrationStatus = registrationStatus;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public AcademicUnit getUnit() {
        return unit;
    }

    public void setUnit(AcademicUnit unit) {
        this.unit = unit;
    }

    public String getInfoMessage() {
        return infoMessage;
    }

    public void setInfoMessage(String infoMessage) {
        this.infoMessage = infoMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
