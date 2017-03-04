package com.sample.util;

/**
 * This interface is used for common application constant or property value.
 * 
 * @author shyam.pareek
 *
 */
public interface AppConstant {

	String MANAGER = "MANAGER";
	String USER = "USER";
	int ERROR_CODE = 100;
	int SUCCESS_CODE = 200;

	enum UserRole {

		ROLE_USER("ROLE_USER"), ROLE_APP_MANAGER("ROLE_APP_MANAGER");

		private UserRole(String role) {
			this.role = role;
		}

		private final String role;

		public String toString() {
			return this.role;
		}
	}

}
