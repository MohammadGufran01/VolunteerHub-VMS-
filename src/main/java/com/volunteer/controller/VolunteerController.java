package com.volunteer.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.volunteer.DTO.AttendanceRequest;
import com.volunteer.DTO.CertificateDTO;
import com.volunteer.DTO.InvitationDTO;
import com.volunteer.entities.Attendance;
import com.volunteer.entities.Event;
import com.volunteer.entities.Role;
import com.volunteer.entities.User;
import com.volunteer.service.AdminEventService;
import com.volunteer.service.AttendanceService;
import com.volunteer.service.CertificateService;
import com.volunteer.service.VolunteerEventResponseService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

	@Autowired
	private VolunteerEventResponseService volunteerEventResponseService;

	@Autowired
	private AdminEventService adminEventService;

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private CertificateService certificateService;
	@RequestMapping("/dashboard")
	public String dashboard(HttpSession session ) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		return "volunteer/dashboard";
	}

	@GetMapping("/upcomming")
	public String allEvents(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) return "redirect:/login";
		
		if (user.getRole().equalsIgnoreCase(Role.VOLUNTEER)) {
			List<Event> upcomingEvents = volunteerEventResponseService.getUpcomingEvents();
			session.setAttribute("upcomming", upcomingEvents);
			return "volunteer/upcomming-events";
		}
		
		return "index";
	}

	@GetMapping("/invitations")
	public String allInvitations(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/login";

		List<InvitationDTO> invitations = volunteerEventResponseService.findInvitationsByVolunteerId(user.getId());

		model.addAttribute("invitation", invitations);
		return "volunteer/invitation";
	}

	@GetMapping("/acceptedInvitation")
	public String acceptedInvitation(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/login";

		List<InvitationDTO> invitations = volunteerEventResponseService.acceptedInvitation(user.getId());

		model.addAttribute("invitation", invitations);
		return "volunteer/acceptedRequest";
	}

	@PostMapping("/respond")
	public String respondFromApp(@RequestParam String token, @RequestParam String response, Model model) {
		String msg = volunteerEventResponseService.updateResponse(token, response);
		model.addAttribute("msg", msg);
		return "volunteer/dashboard";
	}

	@GetMapping("/respond")
	public String respondFromEmail(@RequestParam String token, @RequestParam String response, Model model) {
		String msg = volunteerEventResponseService.updateResponse(token, response);
		model.addAttribute("msg", msg);
		return "volunteer/dashboard";
	}

	@PostMapping("/attendance/mark")
	@ResponseBody
	public String markAttendence(HttpSession session, @RequestBody AttendanceRequest request) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/login";
		Event event = adminEventService.findById(request.getEventId());
		if (event == null)
			return "volunteer/dashboard";
		String markAttendance = attendanceService.markAttendance(event, user, request.getLatitude(), request.getLongitude());
		return markAttendance;
	}
	
	// finding my attendance details
	
	@GetMapping("/myAttendance")
	public String getAttendanceDetails(HttpSession session,Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		List<Attendance> allAttendance = attendanceService.getAllAttendance(user);
		model.addAttribute("myAttendance",allAttendance);
		return "volunteer/myAttendanceHistory";
	}
	
	@GetMapping("/profile")
	public String seeProfile(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		session.setAttribute("user",user);
		return "volunteer/profile";
	}
	
	@GetMapping("/certificateDetails/{id}")
	public String certificateDetails(@PathVariable Long id,Model model) {
		System.out.println("inside details of certificate controller...");
		CertificateDTO crt = certificateService.setCertificateData(id);
		if(crt == null) {
			return "no data found";
		}
		
		model.addAttribute("certificateDetail", crt);
	
		return "volunteer/certificate";
	}
//	public String downloadCertificate() {
//		return null;
//	}
//	// certificate download
//	@GetMapping("/downloadCertificate")
//	public String downloadCertificate() {
//		return null;
//	}
	
}
