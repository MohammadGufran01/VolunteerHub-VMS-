//package com.volunteer.entities;
//
//import jakarta.persistence.*;
//import java.time.LocalDateTime;
//
//@Entity
//@Table(name = "notifications")
//public class Notification {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    private String message;
//
//    private String type; // EVENT, APPROVAL, REMINDER, SYSTEM
//
//    private boolean readStatus = false;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    private User user;
//
//    private LocalDateTime createdAt = LocalDateTime.now();
//
//    public Notification() {}
//
//}
