package com.example.student_mis.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Course {
    @Id
    private UUID id;
    @ManyToOne
    @JoinColumn(name = "semester")
    private Semester semester;
    @ManyToOne
    @JoinColumn(name = "teacher")
    private Teacher teacher;
    @OneToOne
    @JoinColumn(name = "coursed")
    private CourseDefinition courseDefinition;

    @ManyToOne
    private AcademicUnit department;

    public Course() {
    }

    public Course(UUID id, Semester semester, Teacher teacher, CourseDefinition courseDefinition, AcademicUnit department) {
        this.id = id;
        this.semester = semester;
        this.teacher = teacher;
        this.courseDefinition = courseDefinition;
        this.department = department;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public CourseDefinition getCourseDefinition() {
        return courseDefinition;
    }

    public void setCourseDefinition(CourseDefinition courseDefinition) {
        this.courseDefinition = courseDefinition;
    }

    public AcademicUnit getDepartment() {
        return department;
    }

    public void setDepartment(AcademicUnit department) {
        this.department = department;
    }
}
