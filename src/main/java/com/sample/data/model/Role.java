package com.sample.data.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Entity which represent roles table.
 * 
 * @author shyam.pareek
 *
 */
@Entity
@Table(name = "roles", uniqueConstraints = { @UniqueConstraint(columnNames = { "role" }) })
public class Role implements Serializable {

	private static final long serialVersionUID = 9928712342L;

	@Id
	@GeneratedValue
	private Long id;

	private String role;

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roles")
	private Set<User> users;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@JsonIgnore
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
