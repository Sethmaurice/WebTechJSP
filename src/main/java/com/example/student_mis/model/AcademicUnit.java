package com.example.student_mis.model;

import com.example.student_mis.enums.EAcademicUnit;
import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class AcademicUnit {
    @Id
    private UUID Id;
    @Column(unique = true)
    private String Code;
    private String name;
    @Enumerated(EnumType.STRING)
    private EAcademicUnit unit;
    @ManyToOne
    @JoinColumn(name = "parent_id")
    private AcademicUnit parent;

    public AcademicUnit() {
    }

    public AcademicUnit(UUID id, String code, String name, EAcademicUnit unit, AcademicUnit parent) {
        Id = id;
        Code = code;
        this.name = name;
        this.unit = unit;
        this.parent = parent;
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
}
