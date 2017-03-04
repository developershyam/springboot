package com.sample.config;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.sample.data.model.Employee;
import com.sample.data.model.Role;
import com.sample.data.repository.EmployeeRepository;
import com.sample.data.repository.RoleRepository;
import com.sample.util.AppConstant;
import com.sample.util.AppUtils;

/**
 * This class is designed to setup initial configurations.
 * 
 * @author shyam.pareek
 *
 */
@Component
public class AppSetup {

	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	@Qualifier("transactionManager")
	protected PlatformTransactionManager transactionManager;

	@PostConstruct
	public void init() {

		TransactionTemplate tmpl = new TransactionTemplate(transactionManager);
		tmpl.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {

				tearUPDefaultSettings();
				addDefaultEmployee();
			}
		});

	}

	private void tearUPDefaultSettings() {

		// PUT YOUR CALL TO SERVICE HERE

		Set<Role> roles = new HashSet<>();
		Iterable<Role> iterator = roleRepository.findAll();
		if (iterator != null) {
			roleRepository.findAll().forEach(roles::add);
		}

		if (!AppUtils.hasValue(roles)) {
			Role role1 = new Role();
			role1.setId(1l);
			role1.setRole(AppConstant.UserRole.ROLE_APP_MANAGER.toString());
			roleRepository.save(role1);

			Role role2 = new Role();
			role2.setId(2l);
			role2.setRole(AppConstant.UserRole.ROLE_USER.toString());
			roleRepository.save(role2);
		}

		// Role role1 = new Role();
		// role1.setId(1l);
		// role1.setRole("ROLE_ADMIN");
		// roleRepository.save(role1);

		// Role role1 = roleRepository.findOne(1l);
		// User user1 = new User("Shyam", "shyam@g.com","123456", true);
		// Set<Role> roles = new HashSet<>();
		// roles.add(role1);
		// user1.setRoles(roles);
		// userRepository.save(user1);
	}

	private void addDefaultEmployee() {

		for (int i = 0; i < 13; i++) {

			SecureRandom random = new SecureRandom();
			String firstName = new BigInteger(130, random).toString(32).substring(0, 3);
			String lastName = new BigInteger(130, random).toString(32).substring(0, 3);
			String email = firstName + lastName + "@" + (new BigInteger(130, random).toString(32).substring(0, 3))
					+ ".com";

			Employee employee = new Employee(null, firstName, lastName, email);
			employeeRepository.save(employee);
		}

	}
}
