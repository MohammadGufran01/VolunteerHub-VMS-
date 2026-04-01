package com.volunteer.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.volunteer.entities.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {

	User findByEmail(String email);

	List<User> findByRole(String role);
	
	Optional findById(Long role);
	
	@Query("SELECT COUNT(u) FROM User u WHERE u.role = 'VOLUNTEER'")
	long countVolunteerUsers();



}
