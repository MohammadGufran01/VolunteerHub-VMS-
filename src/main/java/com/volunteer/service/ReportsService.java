package com.volunteer.service;

import java.util.List;

public interface ReportsService {
    long totalEvents();
    long totalVolunteers();

    long agreedCount(Long id);
    long disagreedCount(Long id);
    long pendingCount(Long id);

    List<Object[]> eventWiseVolunteerCount();
}
