package com.qbank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.qbank.entity.UserMaster;

@Repository
public interface UserRepository extends JpaRepository<UserMaster, Integer>{

	public UserMaster findByUserName(String userName);
	
	@Query(value = "SELECT * FROM  userMaster WHERE userName=:userName AND password=:password", nativeQuery = true)
	public UserMaster findByUserNameAndPassword (@Param("userName") String userName,@Param("password") String password);
	
	@Query(value="SELECT * FROM  userMaster WHERE email=:email ", nativeQuery = true)
	public UserMaster getUserByUserEmail(@Param("email") String email);
}
