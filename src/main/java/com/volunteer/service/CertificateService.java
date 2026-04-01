package com.volunteer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.volunteer.DTO.CertificateDTO;
import com.volunteer.entities.Attendance;

@Service
public class CertificateService {

	@Autowired
	private AttendanceService attendanceService;

	public CertificateDTO setCertificateData(long id) {
		CertificateDTO crt = new CertificateDTO();
		Attendance attendance = attendanceService.findByAttendanceId(id);
		if (attendance == null) {
			return null;
		}
		crt.setEventName(attendance.getEvent().getTitle());
		crt.setEventLocatioin(attendance.getEvent().getLocation());
		crt.setCompletionDate(attendance.getEvent().getDate());
		crt.setEventDiscription(attendance.getEvent().getDescription());
		crt.setVolunteerName(attendance.getVolunteer().getName());
		crt.setVolunteerEmail(attendance.getVolunteer().getEmail());
		crt.setCity(attendance.getVolunteer().getCity());
		crt.setPhone(attendance.getVolunteer().getPhone());
		return crt;
	}

}
