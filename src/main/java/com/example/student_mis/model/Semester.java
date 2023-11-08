package com.example.student_mis.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class Semester {
    @Id
    private UUID Id;
    private String name;
    private LocalDate startDate;
    private LocalDate endDate;

    public Semester() {
    }

    public Semester(UUID id) {
        Id = id;
    }

    public Semester(UUID id, String name, LocalDate startDate, LocalDate endDate) {
        Id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
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
}
