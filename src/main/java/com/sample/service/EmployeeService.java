package com.sample.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.sample.data.model.Employee;
import com.sample.dto.DataWrapper;

/**
 * This interface is used for design employee business.
 * 
 * @author shyam.pareek
 *
 */
public interface EmployeeService {

	List<Employee> getEmployees();

	DataWrapper getEmployeesPage(Pageable pageable);

	Employee getEmployee(Long id);

	Employee findByEmail(String email);

	Employee addEmployee(Employee employee);

	Employee updateEmployee(Employee employee);

	void deleteEmployee(Long id);

}
