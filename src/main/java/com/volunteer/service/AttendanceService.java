package com.volunteer.service;

import com.volunteer.entities.Attendance;
import com.volunteer.entities.Event;
import com.volunteer.entities.User;

import java.util.List;

public interface AttendanceService {

    String markAttendance(Event event,
                          User volunteer,
                          double userLat,
                          double userLon);

    List<Attendance> getVolunteerAttendance(User volunteer);

    List<Attendance> getEventAttendance(Event event);
    
    List<Attendance> getAllAttendance(User volunteer);
    long getPresentCount(Event event);

	Attendance findByAttendanceId(Long id);
}
