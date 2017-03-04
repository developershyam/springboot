package com.sample.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sample.data.model.Employee;
import com.sample.data.repository.EmployeeRepository;
import com.sample.dto.DataWrapper;

/**
 * This class is used for write employee business.
 * 
 * @author shyam.pareek
 *
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	
	@Override
	public List<Employee> getEmployees() {

		List<Employee> employees = new ArrayList<>();

		employeeRepository.findAll().forEach(employees::add);

		return employees;
	}

	@Override
	public DataWrapper getEmployeesPage(Pageable pageable) {

		Page<Employee> employeePages = employeeRepository.getEmployess(pageable);
		DataWrapper dataWrapper = new DataWrapper();
		dataWrapper.setPageNumber(employeePages.getNumber() + 1);
		dataWrapper.setPageSize(employeePages.getSize());
		dataWrapper.setTotalElement(employeePages.getTotalElements());
		dataWrapper.setTotalPages(employeePages.getTotalPages());

		List<Employee> employees = employeePages.getContent();
		dataWrapper.setData(employees);

		// employeeRepository.findAll().forEach(employees::add);

		return dataWrapper;
	}

	@Override
	public Employee findByEmail(String email) {

		Employee employee = employeeRepository.findByEmailIgnoreCase(email);

		return employee;
	}

	@Override
	public Employee getEmployee(Long id) {

		Employee employee = employeeRepository.findOne(id);

		return employee;
	}

	@Override
	public Employee addEmployee(Employee employee) {

		employee = employeeRepository.save(employee);

		return employee;
	}

	@Override
	public Employee updateEmployee(Employee employee) {

		employee = employeeRepository.save(employee);

		return employee;
	}

	@Override
	public void deleteEmployee(Long id) {

		employeeRepository.delete(id);

	}

}
