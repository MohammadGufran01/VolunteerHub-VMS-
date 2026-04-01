package com.volunteer.repo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.volunteer.entities.Event;

@Repository
public interface AdminEventRepo extends JpaRepository<Event, Long> {

    List<Event> findByUserId(Long id);

    List<Event> findByDateAfter(LocalDate today);

	Event findEventById(Long id);
}

