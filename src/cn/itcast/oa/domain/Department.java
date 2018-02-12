package cn.itcast.oa.domain;

import java.util.HashSet;
import java.util.Set;
/*
 * 部门实体
 * 
 */
public class Department {
	private Long id;//id
	private String name; //部门名字
	private String description;//部门描述 
	private Department parent;//上级部门（一个上级）
	private Set<Department> children=new HashSet<Department>();//下级部门（可能多个下级
	private Set<User> users=new HashSet<User>();
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
	public Department getParent() {
		return parent;
	}
	public void setParent(Department parent) {
		this.parent = parent;
	}
	public Set<Department> getChildren() {
		return children;
	}
	public void setChildren(Set<Department> children) {
		this.children = children;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
}
