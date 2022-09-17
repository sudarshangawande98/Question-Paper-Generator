package com.qbank.service;

import java.util.List;
import java.util.Optional;

import com.qbank.entity.TestMaster;

public interface TestService {

	public List<TestMaster> getAllTest();
	public TestMaster createTest(TestMaster test);
	TestMaster updateTest(int testId,TestMaster test);
	void deleteTest(int testId);
	public Optional<TestMaster> getTestById(int testId);
	public TestMaster getTestByName(String testName);
	public TestMaster getTestBySubject(String subjectName);
}
