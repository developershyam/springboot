package com.sample.data.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sample.data.model.Role;

/**
 * This interface is designed for user role operations.
 * 
 * @author shyam.pareek
 *
 */
@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {

	Role findByRole(String role);
}
