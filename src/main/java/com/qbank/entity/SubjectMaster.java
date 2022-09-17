package com.qbank.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "subjectMaster")
public class SubjectMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int subjectId;

	@Column(name = "subjectName")
	private String subjectName;

	@Column(name = "description")
	private String description;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifyDate;
	
	@JsonBackReference
	@OneToMany(mappedBy = "subjectMaster", cascade = CascadeType.ALL)
	private List<TopicMaster> topicMaster;
	
	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public List<TopicMaster> getTopicMaster() {
		return topicMaster;
	}

	public void setTopicMaster(List<TopicMaster> topicMaster) {
		this.topicMaster = topicMaster;
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

	public SubjectMaster(String subjectName, String description, Date createdDate, Date modifyDate,
			List<TopicMaster> topicMaster) {
		super();
		this.subjectName = subjectName;
		this.description = description;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
		this.topicMaster = topicMaster;
	}

	public SubjectMaster() {
		super();
	}

	@Override
	public String toString() {
		return "SubjectMaster [subjectName=" + subjectName + ", description=" + description + ", createdDate="
				+ createdDate + ", modifyDate=" + modifyDate + "]";
	}
}