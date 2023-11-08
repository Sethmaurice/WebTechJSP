package com.example.student_mis.bean;

import java.time.LocalDate;
import java.util.UUID;

public class StudentBean {
    private UUID Id;
    private String regNo;

    private String fullname;
    private LocalDate dob;
    private String infoMessage;
    private String errorMessage;

    public StudentBean() {
    }

    public StudentBean(UUID id, String regNo, String fullname, LocalDate dob, String infoMessage, String errorMessage) {
        Id = id;
        this.regNo = regNo;
        this.fullname = fullname;
        this.dob = dob;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
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
