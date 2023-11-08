package com.example.student_mis.model;

import jakarta.persistence.*;

import java.util.UUID;
@Entity
public class StudentCourse {
    @Id
    private UUID id;
    private Integer credits;
    private String results;
    @ManyToOne
    @JoinColumn(name = "stRegId")
    private StudentRegistration studentRegistration;
    @OneToOne
    @JoinColumn(name = "courseId")
    private Course course;

    public StudentCourse() {
    }

    public StudentCourse(UUID id, Integer credits, String results, StudentRegistration studentRegistration, Course course) {
        this.id = id;
        this.credits = credits;
        this.results = results;
        this.studentRegistration = studentRegistration;
        this.course = course;
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
}
