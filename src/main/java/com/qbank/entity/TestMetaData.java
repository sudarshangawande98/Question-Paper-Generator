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
@Table(name = "testMetaData")
public class TestMetaData {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer testMetaDataId;
	
	@Column(name = "testId")
	private Integer testId;
	
	@Column(name="testName")
	private String testName;
	
	@Column(name = "testPath")
	private String testPath;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;

	public Integer getTestMetaDataId() {
		return testMetaDataId;
	}

	public void setTestMetaDataId(Integer testMetaDataId) {
		this.testMetaDataId = testMetaDataId;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getTestPath() {
		return testPath;
	}

	public void setTestPath(String testPath) {
		this.testPath = testPath;
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
	
	public TestMetaData() {
		super();
	}

	public TestMetaData(Integer testMetaDataId, Integer testId, String testName, String testPath, Date createdDate,
			Date modifyDate) {
		super();
		this.testMetaDataId = testMetaDataId;
		this.testId = testId;
		this.testName = testName;
		this.testPath = testPath;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
	}

	public Integer getTestId() {
		return testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	@Override
	public String toString() {
		return "TestMetaData [testMetaDataId=" + testMetaDataId + ", testId=" + testId + ", testName=" + testName
				+ ", testPath=" + testPath + ", createdDate=" + createdDate + ", modifyDate=" + modifyDate + "]";
	}
}