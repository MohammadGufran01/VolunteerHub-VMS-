package com.volunteer.DTO;

import java.time.LocalDate;

public class InvitationDTO {

    private Long id;
    private String title;
    private LocalDate date;
    private String location;
    private String description;
    private String response;
    private Long eventId;
 //   private boolean present;
    private String token;
    

    public InvitationDTO(Long id, String title, LocalDate date,
                         String location, String description,
                         String response, Long eventId,String token) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.location = location;
        this.description = description;
        this.response = response;
        this.eventId = eventId;
        this.token = token;
        //this.present = present;
    }
//    public void setPresent(boolean present) {
//    	this.present = present;
//    }
//    public boolean getPresent() {
//    	return present;
//    }
    public void setToken(String token) {
    	this.token = token;
    }
    public String getToken() {
		return token;
	}

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public LocalDate getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }

    public String getDescription() {
        return description;
    }

    // JSP uses ${inv.status}
    public String getStatus() {
        return response;
    }

    public Long getEventId() {
        return eventId;
    }
	
}
