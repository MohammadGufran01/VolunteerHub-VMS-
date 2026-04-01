package com.volunteer.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.volunteer.entities.Event;
import com.volunteer.entities.Role;
import com.volunteer.entities.User;
import com.volunteer.entities.VolunteerEventResponse;
import com.volunteer.helper.TokerGenerator;
import com.volunteer.service.AdminEventService;
import com.volunteer.service.EmailService;
import com.volunteer.service.GeoService;
import com.volunteer.service.ReportsServiceImpl;
import com.volunteer.service.UserService;
import com.volunteer.service.VolunteerEventResponseService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired
	private AdminEventService adminEventService;

	@Autowired
	private UserService userService;
	@Autowired
	private VolunteerEventResponseService volunteerEventResponseService;

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private GeoService geoService;

	@GetMapping("/dashboard")
	public String dashboard() {
		System.out.println("inside admin dashboard");
		return "admin/dashboard";
	}

	@GetMapping("/eventForm")
	public String eventForm() {
		System.out.println("inside admin eventForm");
		return "admin/eventsForm";
	}

	@GetMapping("/manageEvents")
	public String manageEvens() {
		System.out.println("inside admin MangeEvents");
		return "admin/manageEvents";
	}

	@PostMapping("/events/create")
	public String createEvents(@ModelAttribute Event events, HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/login";
	    }
	    
	    if(events.getLocation() == null || events.getLocation().trim().isEmpty()) {
	       System.out.println("address is required");
	        return "admin/createEvent";
	    }

	    
	    double[] latlng = geoService.getLatLng(events.getLocation());
	    System.out.println("this is latlng : "+Arrays.toString(latlng));
	    events.setLatitude(latlng[0]);
	    events.setLongitude(latlng[1]);

	    events.setUser(user);

	    Event savedEvent = adminEventService.createEvents(events);

	    if (savedEvent == null) {
	        model.addAttribute("msg", "Error creating event! Try again.");
	        return "admin/createEvent"; // Show form again with message
	    }

	    model.addAttribute("msg", "Event created successfully!");
	 //return "Event Created Successfully";
	   return "admin/createEvent";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    binder.setDisallowedFields("latitude", "longitude");
	}


	@GetMapping("/allEvents")
	public String eventList(Model model, HttpSession session) {
		System.out.println("inside all events list");
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		Long id = user.getId();
		List<Event> allEvents = adminEventService.findAllEvents(id);
		if (allEvents == null) {
			session.setAttribute("event-msg", "no events found");
		}

		model.addAttribute("events", allEvents);
		return "admin/eventList";
	}

	@GetMapping("/events/delete/{id}")
	public String deleteEvent(@PathVariable("id") Long id) {
		System.out.println("inside delete event controller");
		System.out.println(id);
		adminEventService.deleteEvent(id);
		return "redirect:/admin/allEvents";
	}

	@GetMapping("/events/edit/{id}")
	public String editEvent(@PathVariable("id") Long id, Model model) {
		System.out.println("inside delete event controller");
		System.out.println(id);
		Event editEvent = adminEventService.editEvent(id);
		if (editEvent == null) {
			model.addAttribute("no event found");
		}
		model.addAttribute("event", editEvent);
		return "/admin/updateForm";
	}

	@PostMapping("/events/update/{id}")
	public String updateEvent(@ModelAttribute Event event, Model model, @PathVariable("id") Long id,
			HttpSession session) {
		
		   Event old = adminEventService.editEvent(id);

		    // GPS protection
		    if (event.getLatitude() == null) event.setLatitude(old.getLatitude());
		    if (event.getLongitude() == null) event.setLongitude(old.getLongitude());
		event.setId(id);
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		event.setUser(user);
		System.out.println("inside update controller");
		System.out.println(id);
		Event updateEvent = adminEventService.updateEvent(event);
		if (updateEvent != null) {
			model.addAttribute("msg", "Event update succefully");
		} else {
			model.addAttribute("msg", "Something went wrong");
		}
		return "redirect:/admin/allEvents";
	}

	@GetMapping("/events/assign")
	public String allVolunteers(HttpSession session) {
		System.out.println("inside assing contoller");
		String volunteer = Role.VOLUNTEER;
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		Long id = user.getId();

		List<User> allVolunteer = userService.findAllVolunteer(volunteer);
		List<Event> allEvents = adminEventService.findAllEvents(id);
		if (allVolunteer == null && allEvents == null) {
			session.setAttribute("msg", "no volunteers  and events found");
		}
		session.setAttribute("volunteers", allVolunteer);
		session.setAttribute("events", allEvents);
		return "admin/assignVolunteer";
	}

	@PostMapping("/assign-volunteers")
	public String sendEmailForSelectedVolunteer(@RequestParam("eventId") Long eventId,
			@RequestParam("volunteerIds") List<Long> volunteerIds) {

		Event event = adminEventService.findById(eventId);
		if (event == null) {
			return "redirect:/admin/assignVolunteer";
		}

		List<VolunteerEventResponse> responseList = new ArrayList<>();

		for (Long volunteerId : volunteerIds) {

			String token = TokerGenerator.tokenGenerator();

			VolunteerEventResponse ver = new VolunteerEventResponse();
			ver.setEventId(eventId);
			ver.setVolunteerId(volunteerId);
			ver.setToken(token);
			responseList.add(ver);

			Optional<User> volunteerOpt = userService.findVolunteer(volunteerId);
			
			if (!volunteerOpt.isPresent()) {
				System.out.println("Volunteer not found: " + volunteerId);
				continue;
			}
			
			User volunteer = volunteerOpt.get();//192.168.0.175/
			
			String baseUrl = "http://192.168.0.175:8080/volunteer/respond";

			String agreeLink = baseUrl + "?token=" + token + "&response=Yes";
			String disagreeLink = baseUrl + "?token=" + token + "&response=No";

			String html = "<h3>Event Approval Needed</h3>" + "<p>Hello <b>" + volunteer.getName() + "</b>,</p>"
					+ "<p>You are invited  to join event: <b>" + event.getTitle() + "</b></p>" + "<p>Location: <b>"
					+ event.getLocation() + "</b></p>" + "<p>Date: <b>" + event.getDate() + "</b></p>"
					+ "<p>Are you interested ?:</p>" + "<a href='" + agreeLink
					+ "' style='padding:10px;background:green;color:white;border-radius:5px; height:fit-content;padding-bottom:3px;'>Yes</a>"
					+ "&nbsp;&nbsp;" + "<a href='" + disagreeLink
					+ "' style='padding:10px;background:red;color:white;border-radius:5px; height:fit-content;padding-bottom:3px;'>NO</a>";

			emailService.sendHtmlMail(volunteer.getEmail(), "Event Approval - " + event.getTitle(), html);
		}
		
		volunteerEventResponseService.createResponseEntries(responseList);

		return "admin/manageEvents";
	}

	@Autowired
	private ReportsServiceImpl reportsService;

	@GetMapping("/reports")
	public String reports(Model model) {
		model.addAttribute("totalEvents", reportsService.totalEvents());
		model.addAttribute("totalVolunteers", reportsService.totalVolunteers());
	    model.addAttribute("agreedCount", reportsService.totalAgreed());
	    model.addAttribute("disagreedCount", reportsService.totalDisagreed());
	    model.addAttribute("pendingCount", reportsService.totalPending());
		model.addAttribute("eventWiseCount", reportsService.eventWiseVolunteerCount());
		return "admin/reports";
	}
	
	@GetMapping("/agreeDisagreeCount/{eventId}")
	public String agreeDisagreeCount(Model model,@PathVariable("eventId")Long eventId) {
		
		model.addAttribute("disagreedCount", reportsService.disagreedCount(eventId));
		model.addAttribute("pendingCount", reportsService.pendingCount(eventId));
		model.addAttribute("agreedCount", reportsService.agreedCount(eventId));
		return "admin/agreeDisagreeCount";
	}
	
	

}
