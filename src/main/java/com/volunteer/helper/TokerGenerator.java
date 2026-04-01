package com.volunteer.helper;

import java.util.UUID;

public class TokerGenerator {
	public static String tokenGenerator() {
		String token = UUID.randomUUID().toString();
		return token;
	}
}
