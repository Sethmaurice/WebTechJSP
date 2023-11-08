package com.example.student_mis.model;
import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class CourseDefinition {
    @Id
    private UUID Id;
    private String Code;
    private String name;
    private String description;

    public CourseDefinition() {
    }

    public CourseDefinition(UUID id) {
        Id = id;
    }

    public CourseDefinition(UUID id, String code, String name, String description) {
        Id = id;
        Code = code;
        this.name = name;
        this.description = description;
    }

    public UUID getId() {
        return Id;
    }

    public void setId(UUID id) {
        Id = id;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
