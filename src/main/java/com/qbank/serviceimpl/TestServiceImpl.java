package com.qbank.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.TestMaster;
import com.qbank.repository.TestRepository;
import com.qbank.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestRepository testRepository;
	
	@Override
	public List<TestMaster> getAllTest() {
		
		return testRepository.findAll();
	}

	@Override
	public TestMaster createTest(TestMaster test) {
		
		test.setCreatedDate(new Date());
		test.setModifyDate(new Date());
		return testRepository.save(test);
	}

	@Override
	public TestMaster updateTest(int testId, TestMaster testMaster) {
		
		TestMaster test = testRepository.findById(testId).get();
		test.setTestName(testMaster.getTestName());
		test.setTotalMarks(testMaster.getTotalMarks());
		test.setDuration(testMaster.getDuration());
		test.setCreatedDate(testMaster.getCreatedDate());
		test.setModifyDate(new Date());
		test.setTestDate(testMaster.getTestDate());
			
		return testRepository.save(test);
	}

	@Override
	public void deleteTest(int testId) {
		
		testRepository.deleteById(testId);
	}

	@Override
	public Optional<TestMaster> getTestById(int testId) {
		return testRepository.findById(testId);
	}

	@Override
	public TestMaster getTestByName(String testName) {
		
		return testRepository.findBytestName(testName);
	}

	@Override
	public TestMaster getTestBySubject(String subjectName) {
		
		return null;
	}
}