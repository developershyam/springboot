package com.sample.data.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sample.data.model.User;

/**
 * This interface is designed for user operations.
 * 
 * @author shyam.pareek
 *
 */
@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	User findByEmail(String email);
}
