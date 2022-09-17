package com.qbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.qbank.entity.SubjectMaster;

@Repository
public interface SubjectRepository extends JpaRepository<SubjectMaster, Integer>{

	@Query(value="SELECT * FROM subjectMaster WHERE subjectName=?",nativeQuery = true)
	public Optional<Integer> findSubjectByName(String subjectName);
	
	public SubjectMaster findBySubjectName(String subjectName);
	
	@Query(value = "SELECT count(subjectId) FROM subjectMaster", nativeQuery = true)
	public int countSubject();
	
	@Query(value = "SELECT COUNT(subjectId) FROM subjectMaster", nativeQuery = true)
	public int countSubjectReport();
}
