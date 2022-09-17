package com.qbank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.qbank.entity.TestMetaData;

@Repository
public interface TestMetaDataRepository extends JpaRepository<TestMetaData, Integer>{

	@Query(value = "SELECT COUNT(testMetaDataId) FROM testMetaData", nativeQuery = true)
	public int countTestReport();
}
