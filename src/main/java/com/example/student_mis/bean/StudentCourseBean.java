package com.example.student_mis.bean;

import com.example.student_mis.model.Course;
import com.example.student_mis.model.StudentRegistration;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;

import java.util.UUID;

public class StudentCourseBean {
    private UUID id;
    private Integer credits;
    private String results;
    @ManyToOne
    @JoinColumn(name = "stRegId")
    private StudentRegistration studentRegistration;
    @OneToOne
    @JoinColumn(name = "courseId")
    private Course course;
    private String infoMessage;
    private String errorMessage;

    public StudentCourseBean() {
    }

    public StudentCourseBean(UUID id, Integer credits, String results, StudentRegistration studentRegistration, Course course, String infoMessage, String errorMessage) {
        this.id = id;
        this.credits = credits;
        this.results = results;
        this.studentRegistration = studentRegistration;
        this.course = course;
        this.infoMessage = infoMessage;
        this.errorMessage = errorMessage;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results;
    }

    public StudentRegistration getStudentRegistration() {
        return studentRegistration;
    }

    public void setStudentRegistration(StudentRegistration studentRegistration) {
        this.studentRegistration = studentRegistration;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
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
