package com.qbank.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.PdfQuestion;
import com.qbank.repository.PdfQuestionRepository;
import com.qbank.service.PdfQuestionService;

@Service
public class PdfQuestionServiceImpl implements PdfQuestionService {

	@Autowired
	private PdfQuestionRepository pdfQuestionRepository;
	
	@Override
	public PdfQuestion createPdfQuestion(PdfQuestion question) {
	
		return pdfQuestionRepository.save(question);
	}
}