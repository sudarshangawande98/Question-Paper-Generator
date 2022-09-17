package com.qbank.service;

import java.util.List;

import com.qbank.entity.SubjectMaster;

public interface SubjectService {
	
//	Method to return student details according to student Id	
	SubjectMaster getSubjectById(int subjectId);
	
//	Method to return all student details	
	List<SubjectMaster> getAllSubject();
	
//	Method to save subject details	
	void createSubject(SubjectMaster subjectMaster);
	
//	Method to update student details	
	void updateSubject(SubjectMaster subjectMaster);
	
//	Method to delete student details	
	void deleteSubject(int subjectId);

	public int findSubjectByName(String subjectName);
	
	public int countSubjectReport();
}