package com.volunteer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.volunteer.entities.Event;
import com.volunteer.entities.User;
import com.volunteer.repo.AdminEventRepo;


@Service
public class AdminEventService {
	@Autowired
	private AdminEventRepo adminEventRepo;

	public Event createEvents(Event events) {
		Event event = adminEventRepo.save(events);
		if(event != null) {
			return event;
		}
		return null;
		
	}

	public List<Event> findAllEvents(Long id) {

		List<Event> allEvents = adminEventRepo.findByUserId(id);
		if(allEvents==null) {
			return null;
		}
		return allEvents;
		
	}

	public void deleteEvent(Long id) {
		adminEventRepo.deleteById(id);
	}

	public Event editEvent(Long id) {
		Event event = adminEventRepo.findEventById(id);
		if(event==null) {
			return null;
		}
		return event;
		
	}

	public Event updateEvent(Event event) {
		return adminEventRepo.save(event);
	}



	public Event findById(Long eventId) {
		 Event eventById = adminEventRepo.findEventById(eventId);
		 return eventById;
	}

}
