package cn.itcast.oa.domain;

import java.util.HashSet;
import java.util.Set;

/*
 * 岗位实体
 */
public class Role {
	private Long id; //id
	private String name; //岗位名字
	private String description; //岗位描述
	private Set<User> users =new HashSet<User>();
	private Set<Privilege> privileges = new HashSet<Privilege>();
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}
	
	
}
