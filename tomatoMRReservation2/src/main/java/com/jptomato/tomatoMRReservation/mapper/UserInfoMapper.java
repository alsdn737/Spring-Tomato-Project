package com.jptomato.tomatoMRReservation.mapper;

import java.util.List;

import com.jptomato.tomatoMRReservation.model.Department;
import com.jptomato.tomatoMRReservation.model.Role;
import com.jptomato.tomatoMRReservation.model.User;

public interface UserInfoMapper {

	public List<User> getList();

	public void insert(User user);
	public List<Role> getRole();
	public List<Department> getDepartment();

	public User getUser(int userId);
	public void update(User user);
	public void delete(Integer userId, boolean getisEnable);
}
