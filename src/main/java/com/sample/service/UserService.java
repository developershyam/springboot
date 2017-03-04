package com.sample.service;

import java.util.List;

import com.sample.data.model.User;

/**
 * This interface is designed for user business.
 * 
 * @author shyam.pareek
 *
 */
public interface UserService {

	User findByEmail(String email);

	void save(User user);

	List<User> getUsers();
}
