package com.example.student_mis.bean;

import com.example.student_mis.model.CourseDefinition;
import com.example.student_mis.model.Semester;
import com.example.student_mis.model.Teacher;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;

import java.util.UUID;

public class CourseBean {
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
    private String infoMessage;
    private String errorMessage;

    public CourseBean() {
    }

    public CourseBean(UUID id, Semester semester, Teacher teacher, CourseDefinition courseDefinition, String infoMessage, String errorMessage) {
        this.id = id;
        this.semester = semester;
        this.teacher = teacher;
        this.courseDefinition = courseDefinition;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
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
