package com.example.student_mis.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class Student {
    @Id
    private UUID Id;
    private String regNo;

    private String fullname;
    private LocalDate dob;

    public Student() {
    }

    public Student(UUID id, String regNo, String fullname, LocalDate dob) {
        Id = id;
        this.regNo = regNo;
        this.fullname = fullname;
        this.dob = dob;
    }

    public UUID getId() {
        return Id;
    }

    public void setId(UUID id) {
        Id = id;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }
}
