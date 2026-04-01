package com.volunteer.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "attendance")
public class Attendance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Event
    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    private Event event;

    // Volunteer
    @ManyToOne
    @JoinColumn(name = "volunteer_id", nullable = false)
    private User volunteer;

    // Present or not
    @Column(nullable = false)
    private boolean present;

    // When attendance marked
    private LocalTime markedAt;

    // GPS captured from volunteer phone
    private double userLatitude;
    private double userLongitude;

    // Distance between event & volunteer (in meters)
    private double distanceFromEvent;

    public Attendance() {}

    public Attendance(Event event, User volunteer,
                      boolean present,
                      double userLatitude,
                      double userLongitude,
                      double distanceFromEvent) {

        this.event = event;
        this.volunteer = volunteer;
        this.present = present;
        this.userLatitude = userLatitude;
        this.userLongitude = userLongitude;
        this.distanceFromEvent = distanceFromEvent;
        this.markedAt = LocalTime.now();
    }

    // Getters & Setters

    public Long getId() {
        return id;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public User getVolunteer() {
        return volunteer;
    }

    public void setVolunteer(User volunteer) {
        this.volunteer = volunteer;
    }

    public boolean isPresent() {
        return present;
    }

    public void setPresent(boolean present) {
        this.present = present;
    }

    public LocalTime getMarkedAt() {
        return markedAt;
    }

    public void setMarkedAt(LocalTime markedAt) {
        this.markedAt = markedAt;
    }

    public double getUserLatitude() {
        return userLatitude;
    }

    public void setUserLatitude(double userLatitude) {
        this.userLatitude = userLatitude;
    }

    public double getUserLongitude() {
        return userLongitude;
    }

    public void setUserLongitude(double userLongitude) {
        this.userLongitude = userLongitude;
    }

    public double getDistanceFromEvent() {
        return distanceFromEvent;
    }

    public void setDistanceFromEvent(double distanceFromEvent) {
        this.distanceFromEvent = distanceFromEvent;
    }
}
