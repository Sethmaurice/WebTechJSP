package com.example.student_mis.bean;

import java.time.LocalDate;
import java.util.UUID;

public class SemesterBean {
    private UUID Id;
    private String name;
    private LocalDate startDate;
    private LocalDate endDate;
    private String infoMessage;
    private String errorMessage;

    public SemesterBean() {
    }

    public SemesterBean(UUID id, String name, LocalDate startDate, LocalDate endDate, String infoMessage, String errorMessage) {
        Id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
    }

    public UUID getId() {
        return Id;
    }

    public void setId(UUID id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
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
