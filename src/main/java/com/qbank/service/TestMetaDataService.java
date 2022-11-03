package com.qbank.service;

import java.util.List;
import java.util.Optional;

import com.qbank.entity.TestMetaData;

public interface TestMetaDataService {
	
	//public boolean uploadFile(MultipartFile file);
	
	public Optional<TestMetaData> getTestMetaData(Integer testMetaDataId);
	
	public List<TestMetaData> getAllTestMetaData();
	
	public boolean deleteTest(Integer testMetaDataId);

	TestMetaData save(TestMetaData testMetadata);

	public int countTestReport();
}