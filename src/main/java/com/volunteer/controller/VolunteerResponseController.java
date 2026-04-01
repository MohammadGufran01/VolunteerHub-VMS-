package com.volunteer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.volunteer.service.VolunteerEventResponseService;

@Controller
@RequestMapping("/vol/response")
public class VolunteerResponseController {

    @Autowired
    private VolunteerEventResponseService volunteerEventResponseService;

    @GetMapping("/agree")
    public String agreeVolunteer(@RequestParam("token") String token, Model model) {   	
       
        model.addAttribute("msg", "Thank you for agreeing to join the event!");
        return "volunteer/profile";
    }
    
    @GetMapping("/disagree")
    public String disagreeVolunteer(@RequestParam("token") String token, Model model) {

     

        model.addAttribute("msg", "You have declined the event request.");
        return "volunteer/profile";
    }
}
