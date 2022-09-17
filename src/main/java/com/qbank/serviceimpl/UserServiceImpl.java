package com.qbank.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.UserMaster;
import com.qbank.repository.UserRepository;
import com.qbank.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;

//	Method to save  User Deatails	
	@Override
	public void createUser(UserMaster userMaster) {
		
		userMaster.setCreatedDate(new Date());
		userMaster.setModifyDate(new Date());
		userRepository.save(userMaster);
	}

//	Method return All User Details
	@Override
	public List<UserMaster> getAllUser() {
		
		return userRepository.findAll();
	}

//	Method Return User By Id details from database 
	@Override
	public UserMaster getUserbyId(int userId) {
		
		UserMaster userMaster=userRepository.findById(userId).get();
		return userMaster;
	}

//	Method Update User Details
	@Override
	public void updateUser(int userId, UserMaster userMaster) {
		
		UserMaster userMaster2=userRepository.findById(userId).get();
		userMaster2.setUserName(userMaster.getUserName());
		userMaster2.setPassword(userMaster.getPassword());
		userMaster2.setEmail(userMaster.getEmail());
		userMaster2.setFirstName(userMaster.getFirstName());
		userMaster2.setLastName(userMaster.getLastName());
		userMaster2.setModifyDate(new Date());
		userRepository.save(userMaster2);
	}

//	Method Delete User Details
	@Override
	public void deleteUser(int userId) {
		
		userRepository.deleteById(userId);
	}

	@Override
	public UserMaster findByUserNameAndPassword(String userName, String password) {
		
		UserMaster userMaster=userRepository.findByUserNameAndPassword(userName, password);
		return userMaster;
	}
}