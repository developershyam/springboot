package com.sample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sample.data.model.Employee;
import com.sample.data.model.User;
import com.sample.dto.AppResponse;
import com.sample.dto.DataWrapper;
import com.sample.service.EmployeeService;
import com.sample.service.UserService;
import com.sample.util.AppConstant;

/**
 * This class is designed for REST service end-points for Employee which take
 * incoming request and perform corresponding business logic.
 * 
 * @author shyam.pareek
 *
 */
@RestController
public class EmployeeController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/getUsers")
	public AppResponse getUsers() {

		List<User> usersList = userService.getUsers();

		AppResponse response = new AppResponse(AppConstant.SUCCESS_CODE, true, "Success", usersList);
		return response;
	}

	@GetMapping("/getEmployees")
	public DataWrapper getEmployees(@RequestParam(required = true) int currentPage) {

		int currentPageIndx = currentPage - 1;
		if (currentPageIndx < 0) {
			currentPageIndx = 0;
		}
		PageRequest pageRequest = new PageRequest(currentPageIndx, 5);
		DataWrapper dataWrapper = employeeService.getEmployeesPage(pageRequest);

		return dataWrapper;
	}

	@GetMapping("/getEmployee/{id}")
	public Employee getEmployee(@PathVariable Long id) {

		return employeeService.getEmployee(id);

	}

	@PostMapping(value = "/addEmployee")
	public AppResponse addEmployee(@RequestBody Employee employee) {
		try {
			if (employeeService.findByEmail(employee.getEmail()) != null) {
				AppResponse response = new AppResponse(AppConstant.ERROR_CODE, true, "Email already exist !!!", null);
				return response;
			}
			employeeService.addEmployee(employee);
			AppResponse response = new AppResponse(AppConstant.SUCCESS_CODE, true, "Add Success !!!", null);
			return response;
		} catch (Exception e) {
			AppResponse response = new AppResponse(AppConstant.ERROR_CODE, true, "Server Error !!!", null);
			return response;
		}
	}

	@PutMapping(value = "/updateEmployee")
	public AppResponse updateEmployee(@RequestBody Employee employee) {

		try {
			Employee employeeDB = employeeService.findByEmail(employee.getEmail());
			if (employeeDB!=null && !employeeDB.getId().equals(employee.getId())) {
				AppResponse response = new AppResponse(AppConstant.ERROR_CODE, true, "Email already exist !!!", null);
				return response;
			}
			employeeService.updateEmployee(employee);
			AppResponse response = new AppResponse(AppConstant.SUCCESS_CODE, true, "Update Success !!!", null);
			return response;
		} catch (Exception e) {
			AppResponse response = new AppResponse(AppConstant.ERROR_CODE, true, "Server Error !!!", null);
			return response;
		}
	}

	@DeleteMapping(value = "/deleteEmployee/{id}")
	public AppResponse deleteEmployee(@PathVariable Long id) {

		try {
			employeeService.deleteEmployee(id);
			AppResponse response = new AppResponse(AppConstant.SUCCESS_CODE, true, "Delete Success !!!", null);
			return response;
		} catch (Exception e) {
			AppResponse response = new AppResponse(AppConstant.ERROR_CODE, true, "Server Error !!!", null);
			return response;
		}
	}

}
