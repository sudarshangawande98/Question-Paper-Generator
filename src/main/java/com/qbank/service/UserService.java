package com.qbank.service;

import java.util.List;
import com.qbank.entity.UserMaster;

public interface UserService {
	
//	Method to save  details User	
	void createUser(UserMaster userMaster);
	
//	Method return all User  details 	
	List<UserMaster > getAllUser();

//	Method return all Faculty details 	
	List<UserMaster > getAllFaculty(String role);
	
//	Method to return User details according to User By userId
	UserMaster  getUserbyId(int userId);

//	Method to Update details User	
	void updateUser(int userId,UserMaster  userMaster );

//	Method to Delete details User	
	void deleteUser(int userId);
	
	public UserMaster findByUserNameAndPassword(String userName, String password);

	void createAdmin(UserMaster userMaster);
}