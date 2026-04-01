package com.volunteer.service;

import com.volunteer.entities.Attendance;
import com.volunteer.entities.Event;
import com.volunteer.entities.User;
import com.volunteer.repo.AttendanceRepository;
import com.volunteer.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	private static final double ALLOWED_DISTANCE_METERS = 200; // 200 meters

	@Autowired
	private AttendanceRepository attendanceRepository;

	@Override
	public String markAttendance(Event event, User volunteer, double userLat, double userLon) {
		if(!(event.getDate().equals(LocalDate.now()))) {
			return "Event Date And Current Date is Different";
		}
		Optional<Attendance> existing = attendanceRepository.findByEventAndVolunteer(event, volunteer);
		System.out.println("mark attendence");
		if (existing.isPresent()) {
			return "Attendance already marked";
		}

		double distance = calculateDistance(userLat, userLon, event.getLatitude(), event.getLongitude());
		Attendance attendance = new Attendance();
		attendance.setEvent(event);
		attendance.setVolunteer(volunteer);
		attendance.setUserLatitude(userLat);
		attendance.setUserLongitude(userLon);
		attendance.setMarkedAt(LocalTime.now());
		attendance.setDistanceFromEvent(distance);

		if (distance <= ALLOWED_DISTANCE_METERS) {
			attendance.setPresent(true);
		} else {
			
			attendance.setPresent(false);
		}
		attendanceRepository.save(attendance);

		return "✅ Attendance marked successfully";
	}

	@Override
	public List<Attendance> getVolunteerAttendance(User volunteer) {
		return attendanceRepository.findByVolunteerAndPresentTrue(volunteer);
	}

	@Override
	public List<Attendance> getEventAttendance(Event event) {
		return attendanceRepository.findByEventAndPresentTrue(event);
	}

	@Override
	public long getPresentCount(Event event) {
		return attendanceRepository.countByEventAndPresentTrue(event);
	}
	
	public List<Attendance> getAllAttendance(User volunteer){
		List<Attendance> byVolunteer = attendanceRepository.findByVolunteer(volunteer);
		return byVolunteer;
	}

	// 🌍 Distance calculation using Haversine Formula
	private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {

		final int R = 6371000; // Earth radius in meters

		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);

		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
				* Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);

		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

		return R * c;
	}

	@Override
	public Attendance findByAttendanceId(Long id) {
		 Attendance attend = attendanceRepository.findById(id).get();
		return attend;
	}
}
