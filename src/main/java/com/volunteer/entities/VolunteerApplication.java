package com.volunteer.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "volunteer_applications")
public class VolunteerApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "volunteer_id")
    private User volunteer;

    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    private String status; // PENDING, APPROVED, REJECTED

    private int hours; // volunteer earned hours

    public VolunteerApplication() {}

    // Getters & Setters
}
