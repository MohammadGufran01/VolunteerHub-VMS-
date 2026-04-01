package com.volunteer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.volunteer.entities.User;
import com.volunteer.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@ControllerAdvice
@RequestMapping("/auth")
public class UserController {
	@Autowired
	private UserService userService;

	@PostMapping("/loginUsers")
	public String loginUsers(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes ra) {
		System.out.println("inside login controller checking");
		User user = userService.login(email, password);
		System.out.println(user);
		if (user == null) {
			ra.addFlashAttribute("error", "Something went Wrong Email or Password");
			return "redirect:/login";
		}

		session.setAttribute("user", user);

		return "index";
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		if (user != null
				&& (user.getRole().equalsIgnoreCase("ADMIN") || user.getRole().equalsIgnoreCase("ORGANIZER"))) {
			return "redirect:/admin/dashboard";
		} else {
			return "redirect:/volunteer/dashboard";
		}
	}

	@PostMapping("/checkAlreadyExists")
	public String checkAlreadyExists(@ModelAttribute User user, Model model, RedirectAttributes ra) {

		String email = user.getEmail();
		User existingUser = userService.findUser(email);

		if (existingUser == null) {
			model.addAttribute("user", user);
			return "auth/saveUsers";
		}

		ra.addFlashAttribute("msg", "You already have an account. Please login.");
		ra.addFlashAttribute("toastType", "info");

		return "redirect:/register";
	}

	@PostMapping("/saveUsers")
	public String saveUsers(@ModelAttribute User user, RedirectAttributes ra) {
		User users = userService.createUsers(user);
		if (users == null) {
			ra.addFlashAttribute("msg", "user already Exists Please Login");
		}
		ra.addFlashAttribute("msg", "Registered Successfully");
		return "redirect:/login";
	}
}
