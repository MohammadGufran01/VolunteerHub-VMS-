package com.volunteer.helper;

import java.security.SecureRandom;

public class CertificateIdGenerator {
	public static String generateCertificateId() {
	    SecureRandom random = new SecureRandom();
	    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    String id = "CERT-";

	    for (int i = 0; i < 9; i++) {
	        id += chars.charAt(random.nextInt(chars.length()));
	    }

	    return id;
	}

}
