package com.volunteer.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.volunteer.entities.User;
import com.volunteer.repo.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo userRepo;

	public User createUsers(User user) {
		User byEmail = userRepo.findByEmail(user.getEmail());
		if(byEmail != null) {
			return null;
		}
		userRepo.save(user);
		return user;
	}
	public User login(String email,String password)  {
		User user = userRepo.findByEmail(email);
		if(user==null) {
			return null;
		}
		else if(!user.getPassword().equals(password)) {
			return null;
		}
		return user;
	}
	public List<User> findAllVolunteer(String volunteerId) {
		
		List<User> allVolunteer = userRepo.findByRole(volunteerId);
		if(allVolunteer==null) {
			return null;
		}
		return allVolunteer;
		
	}
	public Optional<User> findVolunteer(Long volunteerId) {
		Optional<User> allVolunteer =  userRepo.findById(volunteerId);
		if(allVolunteer==null) {
			return null;
		}
		return allVolunteer;
	}
	public User findUser(String email) {
		User byEmail = userRepo.findByEmail(email);
		if(byEmail==null) {
			return null;
		}
		return byEmail;
		
	}
	
	
}
