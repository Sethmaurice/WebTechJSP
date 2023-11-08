package com.example.student_mis.bean;

import com.example.student_mis.enums.EAcademicUnit;
import com.example.student_mis.model.AcademicUnit;
import jakarta.persistence.*;

import java.util.UUID;

public class AcademicUnitBean {
    private UUID Id;
    @Column(unique = true)
    private String Code;
    private String name;
    @Enumerated(EnumType.STRING)
    private EAcademicUnit unit;
    @ManyToOne
    @JoinColumn(name = "parent_id")
    private AcademicUnit parent;
    private String infoMessage;
    private String errorMessage;

    public AcademicUnitBean() {
    }

    public AcademicUnitBean(UUID id, String code, String name, EAcademicUnit unit, AcademicUnit parent, String infoMessage, String errorMessage) {
        Id = id;
        Code = code;
        this.name = name;
        this.unit = unit;
        this.parent = parent;
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

    public EAcademicUnit getUnit() {
        return unit;
    }

    public void setUnit(EAcademicUnit unit) {
        this.unit = unit;
    }

    public AcademicUnit getParent() {
        return parent;
    }

    public void setParent(AcademicUnit parent) {
        this.parent = parent;
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
