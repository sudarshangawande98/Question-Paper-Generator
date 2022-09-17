package com.qbank.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "QuestionMaster")
public class QuestionMaster implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int questionId;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String correctAnswer;
	private int marks;
	private Date createdDate;
	private Date modifiedDate;

//	 @manyToone Mapping - QuestionMaster to DifficultyLevelMaster

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "levelId", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private DifficultyLevelMaster difficultyLevelMaster;

//	@manyToone Mapping - QuestionMaster to SubjectMaster
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "subjectId", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private SubjectMaster subjectMaster;
	
//	@manyToone Mapping - QuestionMaster to TopicMaster
	
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "topicId", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	private TopicMaster topicMaster;

	public TopicMaster getTopicMaster() {
		return topicMaster;
	}

	public void setTopicMaster(TopicMaster topicMaster) {
		this.topicMaster = topicMaster;
	}

	public SubjectMaster getSubjectMaster() {
		return subjectMaster;
	}

	public void setSubjectMaster(SubjectMaster subjectMaster) {
		this.subjectMaster = subjectMaster;
	}

	public DifficultyLevelMaster getDifficultyLevelMaster() {
		return difficultyLevelMaster;
	}

	public void setDifficultyLevelMaster(DifficultyLevelMaster difficultyLevelMaster) {
		this.difficultyLevelMaster = difficultyLevelMaster;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Override
	public String toString() {
		return "QuestionMaster [questionId=" + questionId + ", question=" + question + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", correctAnswer="
				+ correctAnswer + ", marks=" + marks + ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate + "]";
	}

	public QuestionMaster(String question, String option1, String option2, String option3, String option4,
			String correctAnswer, String questionType, int marks, Date createdDate, Date modifiedDate) {
		super();
		this.question = question;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctAnswer = correctAnswer;
		this.marks = marks;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
	}

	public QuestionMaster() {
		
	}
}