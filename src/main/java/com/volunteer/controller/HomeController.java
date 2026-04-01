package com.volunteer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.volunteer.entities.User;

import jakarta.servlet.http.HttpSession;
@Controller
public class HomeController {
	
	
	@RequestMapping("/home")
	public String home() {
		System.out.println("inside home conroller");
		return "index";
	}

	@RequestMapping("/register")
	public String register() {
		System.out.println("inside register conroller");
		return "auth/register";
	}

	@RequestMapping("/login")
	public String login() {
		System.out.println("inside login conroller");
		return "auth/login";

	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null ) {
			session.invalidate();
		}

		return "redirect:/login";
	}

}
