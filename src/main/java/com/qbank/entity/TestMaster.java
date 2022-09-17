package com.qbank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "test")
public class TestMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int testId;

	// Test Details
	@Column(name = "testName")
	private String testName;

	@Column(name = "duration")
	private int duration;

	@Column(name = "totalMarks")
	private int totalMarks;

	@Column(name = "totalNoOfQuestion")
	private int totalNoOfQuestion;

	@Column(name = "totalNoOfHardQuestion")
	private int totalNoOfHardQuestion;

	@Column(name = "totalNoOfMediumQuestion")
	private int totalNoOfMediumQuestion;

	@Column(name = "totalNoOfLowQuestion")
	private int totalNoOfLowQuestion;

	@Column(name = "testDate")
	private Date testDate;	

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "subjectId", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private SubjectMaster subjectMaster;
	
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "topicId", nullable = true)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private TopicMaster topicMaster;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;

	public TestMaster() {
		super();
	}

	public TestMaster(int testId, String testName, int duration, int totalMarks, int totalNoOfQuestion,
			int totalNoOfHardQuestion, int totalNoOfMediumQuestion, int totalNoOfLowQuestion, Date testDate,
			SubjectMaster subjectMaster, TopicMaster topicMaster, Date createdDate, Date modifyDate) {
		super();
		this.testId = testId;
		this.testName = testName;
		this.duration = duration;
		this.totalMarks = totalMarks;
		this.totalNoOfQuestion = totalNoOfQuestion;
		this.totalNoOfHardQuestion = totalNoOfHardQuestion;
		this.totalNoOfMediumQuestion = totalNoOfMediumQuestion;
		this.totalNoOfLowQuestion = totalNoOfLowQuestion;
		this.testDate = testDate;
	
		this.subjectMaster = subjectMaster;
		this.topicMaster = topicMaster;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
	}

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getTotalMarks() {
		return totalMarks;
	}

	public void setTotalMarks(int totalMarks) {
		this.totalMarks = totalMarks;
	}

	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}

	public SubjectMaster getSubjectMaster() {
		return subjectMaster;
	}

	public void setSubjectMaster(SubjectMaster subjectMaster) {
		this.subjectMaster = subjectMaster;
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

	public int getTotalNoOfQuestion() {
		return totalNoOfQuestion;
	}

	public void setTotalNoOfQuestion(int totalNoOfQuestion) {
		this.totalNoOfQuestion = totalNoOfQuestion;
	}

	public TopicMaster getTopicMaster() {
		return topicMaster;
	}

	public void setTopicMaster(TopicMaster topicMaster) {
		this.topicMaster = topicMaster;
	}

	public int getTotalNoOfHardQuestion() {
		return totalNoOfHardQuestion;
	}

	public void setTotalNoOfHardQuestion(int totalNoOfHardQuestion) {
		this.totalNoOfHardQuestion = totalNoOfHardQuestion;
	}

	public int getTotalNoOfMediumQuestion() {
		return totalNoOfMediumQuestion;
	}

	public void setTotalNoOfMediumQuestion(int totalNoOfMediumQuestion) {
		this.totalNoOfMediumQuestion = totalNoOfMediumQuestion;
	}

	public int getTotalNoOfLowQuestion() {
		return totalNoOfLowQuestion;
	}

	public void setTotalNoOfLowQuestion(int totalNoOfLowQuestion) {
		this.totalNoOfLowQuestion = totalNoOfLowQuestion;
	}

	@Override
	public String toString() {
		return "TestMaster [testId=" + testId + ", testName=" + testName + ", duration=" + duration + ", totalMarks="
				+ totalMarks + ", totalNoOfQuestion=" + totalNoOfQuestion + ", totalNoOfHardQuestion="
				+ totalNoOfHardQuestion + ", totalNoOfMediumQuestion=" + totalNoOfMediumQuestion
				+ ", totalNoOfLowQuestion=" + totalNoOfLowQuestion + ", testDate=" + testDate + ", subjectMaster=" 
				+ subjectMaster + ", topicMaster=" + topicMaster + ", createdDate=" + createdDate + ", modifyDate=" + modifyDate + "]";
	}
}