package com.qbank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "userMaster")
public class UserMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int userId;
	
	@Column(name="userName")
	private String userName;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="LastName")
	private String LastName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

//	It is Default Constructor
	public UserMaster() {
		super();	
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public UserMaster(int userId, String userName, String firstName, String lastName, String password, String email,
			Date createdDate, Date modifyDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.firstName = firstName;
		LastName = lastName;
		this.password = password;
		this.email = email;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "UserMaster [userId=" + userId + ", userName=" + userName + ", firstName=" + firstName + ", LastName="
				+ LastName + ", password=" + password + ", email=" + email + ", createdDate=" + createdDate 
				+ ", modifyDate=" + modifyDate + "]";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}
}
