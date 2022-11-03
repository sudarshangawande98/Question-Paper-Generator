package com.qbank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="TopicMaster")
public class TopicMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int topicId;
	
	@Column(name="topicName")
	private String topicName;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;
	
    @JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(foreignKey = @ForeignKey(name="subjectId"), name="subjectId")
	private SubjectMaster subjectMaster;

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
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

	public SubjectMaster getSubjectMaster() {
		return subjectMaster;
	}

	public void setSubjectMaster(SubjectMaster subjectMaster) {
		this.subjectMaster = subjectMaster;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	@Override
	public String toString() {
		return "TopicMaster [topicId=" + topicId + ", topicName=" + topicName + ", createdDate=" + createdDate
				+ ", modifyDate=" + modifyDate + ", subjectMaster=" + subjectMaster + "]";
	}

	public TopicMaster(String topicName, Date createdDate, Date modifyDate, SubjectMaster subjectMaster) {
		super();
		this.topicName = topicName;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
		this.subjectMaster = subjectMaster;
	}

	public TopicMaster() {
		super();
	}
}
