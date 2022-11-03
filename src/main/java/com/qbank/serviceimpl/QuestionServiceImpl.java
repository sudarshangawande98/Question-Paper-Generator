package com.qbank.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.QuestionMaster;
import com.qbank.repository.QuestionRepository;
import com.qbank.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	QuestionRepository questionRepository;

	@Override
	public QuestionMaster getQuestionById(int questionId) {
		
		return questionRepository.findById(questionId).get();
	}

	@Override
	public List<QuestionMaster> getAllQuestion() {
		
		return questionRepository.findAll();
	}

	@Override
	public void createQuestion(QuestionMaster questionMaster) {
		
		questionMaster.setCreatedDate(new Date());
		questionMaster.setModifiedDate(new Date());
		
		questionRepository.save(questionMaster);	
	}

	@Override
	public QuestionMaster updateQuestion(int questionId, QuestionMaster questionMaster) {
		
		QuestionMaster question = questionRepository.findById(questionId).get();
		question.setQuestion(questionMaster.getQuestion());
		question.setCorrectAnswer(questionMaster.getCorrectAnswer());
		question.setMarks(questionMaster.getMarks());
		question.setOption1(questionMaster.getOption1());
		question.setOption2(questionMaster.getOption2());
		question.setOption3(questionMaster.getOption3());
		question.setOption4(questionMaster.getOption4());
		question.setModifiedDate(new Date());
		return questionRepository.save(question);
	}

	@Override
	public void deleteQuestion(int questionId) {
		
		Optional<QuestionMaster> questionMaster=questionRepository.findById(questionId);
		if(questionMaster.isPresent()) {
			QuestionMaster questionMaster1=questionMaster.get();
			questionRepository.delete(questionMaster1);
		}
	}

	@Override
	public int findQuestionByName(String question) {
		
		int count = questionRepository.findQuestionByName(question);
		return count;
	}
	
	@Override
	public int countQuestionReport() {
		
		int result = questionRepository.countQuestionReport();
		return result;
	}
}