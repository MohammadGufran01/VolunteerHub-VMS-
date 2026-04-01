package com.volunteer.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.volunteer.DTO.InvitationDTO;
import com.volunteer.entities.Event;
import com.volunteer.entities.VolunteerEventResponse;
import com.volunteer.repo.AdminEventRepo;
import com.volunteer.repo.VolunteerEventResponseRepository;

@Service
public class VolunteerEventResponseService {

    @Autowired
    private VolunteerEventResponseRepository responseRepo;

    @Autowired
    private AdminEventRepo adminEventRepo;

    // -----------------------------
    // SAVE RESPONSE ENTRIES
    // -----------------------------
    public void createResponseEntries(List<VolunteerEventResponse> list) {
        responseRepo.saveAll(list);
    }

    // -----------------------------
    // GET BY TOKEN
    // -----------------------------
    public VolunteerEventResponse getByToken(String token) {
        return responseRepo.findByToken(token).orElse(null);
    }

    // -----------------------------
    // UPDATE RESPONSE (ACCEPT / REJECT)
    // -----------------------------
    public String updateResponse(String token, String response) {

        VolunteerEventResponse entry = getByToken(token);

        if (entry == null) {
            return "Invalid token! Request not found.";
        }

        if (entry.getResponse() != null) {
            return "You have already responded.";
        }

        responseRepo.updateResponseByToken(
                response,
                LocalDateTime.now(),
                token
        );

        return "Thanks! Your response '" + response.toUpperCase() + "' has been recorded.";
    }

    // -----------------------------
    // UPCOMING EVENTS (ADMIN / HOME)
    // -----------------------------
    public List<Event> getUpcomingEvents() {
        return adminEventRepo.findByDateAfter(LocalDate.now());
    }

    // -----------------------------
    // GET RAW RESPONSES (OPTIONAL)
    // -----------------------------
    public List<VolunteerEventResponse> findVolunteer(Long volunteerId) {
        return responseRepo.findByVolunteerId(volunteerId);
    }

    // ❌ REMOVED: findMyEvent()
    // Reason: causes N+1 problem & unsafe casting

    // -----------------------------
    // ✅ MAIN METHOD – INVITATIONS PAGE
    // -----------------------------
    public List<InvitationDTO> findInvitationsByVolunteerId(Long volunteerId) {
        return responseRepo.findInvitationsByVolunteerId(volunteerId);
    }
    
    public List<InvitationDTO> acceptedInvitation(Long volunteerId) {
        return responseRepo.acceptedInvitation(volunteerId);
    }

	public VolunteerEventResponse findByToken(String token) {
		responseRepo.findByToken(token);
		return null;
	}
}
