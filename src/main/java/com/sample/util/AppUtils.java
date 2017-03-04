package com.sample.util;

import java.util.Collection;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * This class is used for common or utility application methods.
 * 
 * @author shyam.pareek
 *
 */
@Component
public class AppUtils {

	/**
	 * Used for check string object should have non empty string If object is
	 * null or empty it gives you false otherwise returns true
	 * 
	 * @param value
	 * @return condition
	 */
	public static boolean hasValue(String value) {
		return StringUtils.hasText(value);
	}

	/**
	 * Used for check collection should have non empty. If collection is null or
	 * empty it gives you false otherwise returns true
	 * 
	 * @param value
	 * @return condition
	 */
	public static boolean hasValue(Collection value) {
		boolean flag = false;
		if (value != null && value.size() > 0) {
			flag = true;
		}
		return flag;
	}
}
