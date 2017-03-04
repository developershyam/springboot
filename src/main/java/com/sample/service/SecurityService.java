package com.sample.service;

/**
 * This interface is designed for application related securities.
 * 
 * @author shyam.pareek
 *
 */
public interface SecurityService {

	String findLoggedInEmail();

	void autologin(String email, String password);
}
