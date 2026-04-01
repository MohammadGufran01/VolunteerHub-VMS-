package com.volunteer.repo;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.volunteer.DTO.CertificateDTO;
import com.volunteer.DTO.InvitationDTO;
import com.volunteer.entities.VolunteerEventResponse;

import jakarta.transaction.Transactional;

@Repository
public interface VolunteerEventResponseRepository extends JpaRepository<VolunteerEventResponse, Long> {

	Optional<VolunteerEventResponse> findByToken(String token);

	Optional<VolunteerEventResponse> findByEventIdAndVolunteerId(Long eventId, Long volunteerId);

	List<VolunteerEventResponse> findByVolunteerId(Long volunteerId);

	long countByResponseIsNull();

	@Modifying
	@Transactional
	@Query("""
			    UPDATE VolunteerEventResponse v
			    SET v.response = :response,
			        v.responseTime = :time
			    WHERE v.token = :token
			""")
	void updateResponseByToken(@Param("response") String response, @Param("time") LocalDateTime time,
			@Param("token") String token);

	long countByEventIdAndResponse(Long id,String response);

	// 🔥 MAIN QUERY (NO N+1 PROBLEM)
	@Query("""
		    SELECT new com.volunteer.DTO.InvitationDTO(
		        v.id,
		        e.title,
		        e.date,
		        e.location,
		        e.description,
		        v.response,
		        v.eventId,
		        v.token
		    )
		    FROM VolunteerEventResponse v
		    JOIN Event e ON v.eventId = e.id
		    WHERE v.volunteerId = :volunteerId
		""")
		List<InvitationDTO> findInvitationsByVolunteerId(Long volunteerId);

				
		
		
	@Query("""
		    SELECT new com.volunteer.DTO.InvitationDTO(
		        v.id,
		        e.title,
		        e.date,
		        e.location,
		        e.description,
		        v.response,
		        v.eventId,
		        v.token
		    )
		    FROM VolunteerEventResponse v
		    JOIN Event e ON v.eventId = e.id
		    WHERE v.volunteerId = :volunteerId
		      AND v.response = 'Yes'
		""")
		List<InvitationDTO> acceptedInvitation(Long volunteerId);

	
	
	// Global
	@Query("SELECT COUNT(r) FROM VolunteerEventResponse r WHERE r.response='Yes'")
	Long agreedCount();

	@Query("SELECT COUNT(r) FROM VolunteerEventResponse r WHERE r.response='No'")
	Long disagreedCount();

	@Query("SELECT COUNT(r) FROM VolunteerEventResponse r WHERE r.response IS NULL")
	Long pendingCount();

	@Query("""
			SELECT e.title,
			       COUNT(r.id)
			FROM Event e
			LEFT JOIN VolunteerEventResponse r
			       ON r.eventId = e.id
			       AND r.response = 'Yes'
			GROUP BY e.id, e.title
			ORDER BY e.title
			""")
			List<Object[]> getEventWiseAgreedCount();


}
