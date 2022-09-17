package com.qbank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pdfQuestion")
public class PdfQuestion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer pdfQuestionId;
	
	@Column(name = "pdfQuestion")
	private String pdfQuestion;
	
	@Column(name = "questionId")
	private Integer questionId;
	
	@Column(name = "testId")
	private Integer testId;
	
	@Column(name = "testMetaDataId")
	private Integer testMetaDataId;
	
	public Integer getPdfQuestionId() {
		return pdfQuestionId;
	}
	public void setPdfQuestionId(Integer pdfQuestionId) {
		this.pdfQuestionId = pdfQuestionId;
	}
	public String getPdfQuestion() {
		return pdfQuestion;
	}
	
	public void setPdfQuestion(String pdfQuestion) {
		this.pdfQuestion = pdfQuestion;
	}
	
	public Integer getQuestionId() {
		return questionId;
	}
	
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	
	public PdfQuestion() {
		super();
	}
	
	public Integer getTestMetaDataId() {
		return testMetaDataId;
	}
	
	public void setTestMetaDataId(Integer testMetaDataId) {
		this.testMetaDataId = testMetaDataId;
	}
	
	public Integer getTestId() {
		return testId;
	}
	
	public void setTestId(Integer testId) {
		this.testId = testId;
	}
	
	public PdfQuestion(Integer pdfQuestionId, String pdfQuestion, Integer questionId, Integer testId, Integer testMetaDataId) {
		super();
		this.pdfQuestionId = pdfQuestionId;
		this.pdfQuestion = pdfQuestion;
		this.questionId = questionId;
		this.testId = testId;
		this.testMetaDataId = testMetaDataId;
	}
	
	@Override
	public String toString() {
		return "PdfQuestion [pdfQuestionId=" + pdfQuestionId + ", pdfQuestion=" + pdfQuestion + ", questionId="
				+ questionId + ", testId=" + testId + ", testMetaDataId=" + testMetaDataId + "]";
	}
}