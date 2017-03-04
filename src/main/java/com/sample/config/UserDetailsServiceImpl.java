package com.sample.config;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.data.model.Role;
import com.sample.data.model.User;
import com.sample.data.repository.UserRepository;

/**
 * This class is designed security authentic and authorize security
 * implementation.
 * 
 * @author shyam.pareek
 *
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = userRepository.findByEmail(email);

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		if (user != null) {

			// Add one default role for ACTUATOR, If you want to see Health,
			// Matrices etc.
			// grantedAuthorities.add(new
			// SimpleGrantedAuthority("ROLE_APP_MANAGER"));

			for (Role role : user.getRoles()) {
				grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
			}

			return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
					grantedAuthorities);
		} else {
			return new org.springframework.security.core.userdetails.User(email, "", grantedAuthorities);
		}
	}

}