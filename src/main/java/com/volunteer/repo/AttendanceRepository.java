package com.volunteer.repo;

import com.volunteer.entities.Attendance;
import com.volunteer.entities.Event;
import com.volunteer.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long> {
	// to check already marked or not
    Optional<Attendance> findByEventAndVolunteer(Event event, User volunteer);
    // get attendance by volunteer 
    List<Attendance> findByVolunteer(User volunteer);

    // get all attendance of an event
    List<Attendance> findByEvent(Event event);

    // Count how many volunteers were present in an event
    long countByEventAndPresentTrue(Event event);

    // Get only present volunteers for an event
    List<Attendance> findByEventAndPresentTrue(Event event);

    // Get attendance report of a volunteer
    List<Attendance> findByVolunteerAndPresentTrue(User volunteer);
  
}
