package com.qbank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.qbank.entity.TestMaster;

@Repository
public interface TestRepository extends JpaRepository<TestMaster, Integer> {

	TestMaster findBytestName(String testName);
}
