package com.qbank.serviceimpl;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.TestMetaData;
import com.qbank.repository.TestMetaDataRepository;
import com.qbank.service.TestMetaDataService;

@Service
public class TestMetaDataServiceImpl implements TestMetaDataService {

	@Autowired
	public TestMetaDataRepository testMetaDataRepository;

	@Override
	public List<TestMetaData> getAllTestMetaData() {
		
		return testMetaDataRepository.findAll();
	}

	@Override
	public boolean deleteTest(Integer testMetaDataId) {
		
		TestMetaData testMetaData  = testMetaDataRepository.getById(testMetaDataId);
		File file = new File(testMetaData.getTestPath());
		if(file.delete()) {
			testMetaDataRepository.deleteById(testMetaDataId);
			return true;	
		}
		else {
			return false;
		}
	}

	@Override
	public Optional<TestMetaData> getTestMetaData(Integer testMetaDataId) {
		
		return testMetaDataRepository.findById(testMetaDataId);
	}
	
	@Override
	public TestMetaData save(TestMetaData testMetadata) {
		
		return testMetaDataRepository.save(testMetadata);
	}
	
//	@Override
//	public boolean uploadFile(MultipartFile file) {
//		
//		String uploadDir = "E:\\Uploaded Documents";
//		uploadDir =uploadDir+File.separator+"Test";
//		TestMetaData testMetaData= new TestMetaData();
//		testMetaData.setTestName(file.getOriginalFilename());
//		testMetaData.setTestPath(uploadDir+File.separator+file.getOriginalFilename());
//		testMetaData.setCreatedDate(new Date());
//		File f1 = new File(uploadDir);  
//	    boolean flag = false;
//		try {
//			
//			Files.copy(file.getInputStream(), Paths.get(f1 + File.separator + file.getOriginalFilename()),
//					StandardCopyOption.REPLACE_EXISTING);
//			flag = true;
//			testMetaDataRepository.save(testMetaData);
//		} catch (Exception e) {
//
//		}
//		return flag;
//	}
	
	@Override
	public int countTestReport() {
		
		int result = testMetaDataRepository.countTestReport();
		return result;
	}
}