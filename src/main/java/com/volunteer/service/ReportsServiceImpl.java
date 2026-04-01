package com.volunteer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.volunteer.repo.AdminEventRepo;
import com.volunteer.repo.UserRepo;
import com.volunteer.repo.VolunteerEventResponseRepository;

@Service
public class ReportsServiceImpl implements ReportsService {

	@Autowired
	private AdminEventRepo eventRepo;

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private VolunteerEventResponseRepository responseRepo;

	@Override
	public long totalEvents() {
		return eventRepo.count();
	}

	@Override
	public long totalVolunteers() {
		return userRepo.countVolunteerUsers();
	}

	public long agreedCount(Long id) {
		return responseRepo.countByEventIdAndResponse(id, "Yes");
	}

	public long disagreedCount(Long id) {
		return responseRepo.countByEventIdAndResponse(id, "No");
	}

	public long pendingCount(Long id) {
		return responseRepo.countByEventIdAndResponse(id, null);
	}

	public List<Object[]> eventWiseVolunteerCount() {
		return responseRepo.getEventWiseAgreedCount();
	}

	public Long totalAgreed() {
		return responseRepo.agreedCount();
	}

	public Long totalDisagreed() {
		return responseRepo.disagreedCount();
	}

	public Long totalPending() {
		return responseRepo.pendingCount();
	}

}
