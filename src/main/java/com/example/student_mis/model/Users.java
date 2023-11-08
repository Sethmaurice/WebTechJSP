package com.example.student_mis.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Users{
    @Id
    private UUID Id;
    private String email;
    private String password;
    private String role;

    // Constructors, getters, and setters

    public Users() {
    }

    public Users(UUID id, String email, String password, String role) {
        Id = id;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public UUID getId() {
        return Id;
    }

    public void setId(UUID id) {
        Id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}



