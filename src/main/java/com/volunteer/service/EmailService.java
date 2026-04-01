package com.volunteer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	

	    @Autowired
	    private JavaMailSender mailSender;

	    public void sendHtmlMail(String to, String subject, String htmlContent) {
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);

	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(htmlContent, true);

	            mailSender.send(message);

	            System.out.println("Email sent successfully to: " + to);

	        } catch (Exception e) {
	            System.out.println("Error sending email to: " + to);
	            e.printStackTrace();
	        }
	    }

	
}
