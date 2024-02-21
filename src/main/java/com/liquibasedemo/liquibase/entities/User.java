package com.liquibasedemo.liquibase.entities;

import jakarta.persistence.*;

import java.util.Date;

@Table(name = "users")
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "username")
    private String username;

    @Column(name = "created_At")
    private Date createdDate;
}
