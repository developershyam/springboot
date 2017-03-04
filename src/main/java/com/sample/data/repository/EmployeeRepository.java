
package com.sample.data.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sample.data.model.Employee;

/**
 * This interface is designed for employee operations.
 * 
 * @author shyam.pareek
 *
 */
@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long> {

	Employee findByEmailIgnoreCase(String email);

	@Query("Select e from Employee e")
	Page<Employee> getEmployess(Pageable pageable);
}
