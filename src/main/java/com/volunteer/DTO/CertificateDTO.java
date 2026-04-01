package com.volunteer.DTO;

import java.time.LocalDate;

import com.volunteer.helper.CertificateIdGenerator;


public class CertificateDTO {
	private int id;
	private String eventName;
	private String volunteerName;
	private LocalDate completionDate;
	private String city;
	private String eventLocatioin;
	private String eventDiscription;
	private String phone;
	private String volunteerEmail;
	private String CertificateId = CertificateIdGenerator.generateCertificateId();

	public CertificateDTO() {
		super();
	}

	public CertificateDTO(int id, String eventName, String volunteerName, LocalDate completionDate, String city,
			String phone, String volunteerEmail, String certificateId) {
		super();
		this.id = id;
		this.eventName = eventName;
		this.volunteerName = volunteerName;
		this.completionDate = completionDate;
		this.city = city;
		this.phone = phone;
		this.volunteerEmail = volunteerEmail;
		CertificateId = certificateId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEventName() {
		return eventName;
	}
	
	public String getEventLocatioin() {
		return eventLocatioin;
	}

	public void setEventLocatioin(String eventLocatioin) {
		this.eventLocatioin = eventLocatioin;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getVolunteerName() {
		return volunteerName;
	}

	public void setVolunteerName(String volunteerName) {
		this.volunteerName = volunteerName;
	}

	public LocalDate getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(LocalDate completionDate) {
		this.completionDate = completionDate;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getVolunteerEmail() {
		return volunteerEmail;
	}

	public void setVolunteerEmail(String volunteerEmail) {
		this.volunteerEmail = volunteerEmail;
	}
	public String getEventDiscription() {
		return eventDiscription;
	}

	public void setEventDiscription(String eventDiscription) {
		this.eventDiscription = eventDiscription;
	}

	public String getCertificateId() {
		return CertificateId;
	}

	public void setCertificateId(String certificateId) {
		CertificateId = certificateId;
	}

}
