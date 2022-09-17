package com.qbank.service;

import java.util.List;

import com.qbank.entity.QuestionMaster;

public interface QuestionService {
	
//	Method to return Question details according to Question I	
	QuestionMaster getQuestionById(int questionId);
	
//	Method to return all Question details	
	List<QuestionMaster> getAllQuestion();
	
//	Method to save Question details
	void createQuestion(QuestionMaster questionMaster);
	
//	Method to update Question details	
	QuestionMaster updateQuestion(int questionId, QuestionMaster questionMaster);
	
//	Method to delete Question details	
	void deleteQuestion(int questionId);
	
	public int findQuestionByName(String question);

	int countQuestionReport();
}
