package com.example.student_mis.bean;

import java.util.UUID;

public class CourseDefinitionBean {
    private UUID Id;
    private String Code;
    private String name;
    private String description;
    private String infoMessage;
    private String errorMessage;

    public CourseDefinitionBean() {
    }

    public CourseDefinitionBean(UUID id, String code, String name, String description, String infoMessage, String errorMessage) {
        Id = id;
        Code = code;
        this.name = name;
        this.description = description;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
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
