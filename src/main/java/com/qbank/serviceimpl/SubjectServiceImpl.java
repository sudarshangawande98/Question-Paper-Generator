package com.qbank.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.SubjectMaster;
import com.qbank.repository.SubjectRepository;
import com.qbank.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectRepository subjectRepository;

	@Override
	public SubjectMaster getSubjectById(int subjectId) {
		
		return subjectRepository.findById(subjectId).get();
	}

	@Override
	public List<SubjectMaster> getAllSubject() {
		
		return subjectRepository.findAll();
	}

	@Override
	public void createSubject(SubjectMaster subjectMaster) {
		
		subjectMaster.setCreatedDate(new Date());
		subjectMaster.setModifyDate(new Date());
		subjectRepository.save(subjectMaster);
	}

	@Override
	public void updateSubject(SubjectMaster subjectMaster) {
		
		Optional<SubjectMaster> subject=subjectRepository.findById(subjectMaster.getSubjectId());
		if(subject.isPresent()) {
			SubjectMaster subMaster=subject.get();
			subjectRepository.save(subMaster);
		}	
	}

	@Override
	public void deleteSubject(int subjectId) {
		
		Optional<SubjectMaster> subjectMaster=subjectRepository.findById(subjectId);
		if(subjectMaster.isPresent()) {
			SubjectMaster subjectMaster1=subjectMaster.get();
			subjectRepository.delete(subjectMaster1);
		}
	}

	public int findSubjectByName(String subjectName) {
		
		int result=0;
		Optional<Integer> res =subjectRepository.findSubjectByName(subjectName);
		if(res.isPresent()) {
			result=1;
		} else {
			result=0;
		}
		return result;
	}
	
	@Override
	public int countSubjectReport() {
		
		int result = subjectRepository.countSubjectReport();
		return result;
	}
}