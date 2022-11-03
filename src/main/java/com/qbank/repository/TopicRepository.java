package com.qbank.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.qbank.entity.TopicMaster;

@Repository
public interface TopicRepository extends JpaRepository<TopicMaster, Integer>{

	@Query(value="SELECT * FROM topicMaster WHERE topicName=?",nativeQuery = true)
	public Optional<Integer> findTopicByName(String topicName);

	@Query(value="Select * From topicMaster WHERE subjectId= :subjectId",nativeQuery = true)
	public List<TopicMaster> findBySubject(Integer subjectId);
	
	@Query(value = "SELECT COUNT(topicId) FROM topicMaster", nativeQuery = true)
	public int countTopicReport();
	
	@Query(value = "SELECT COUNT(topicId) FROM topicMaster where subjectId=:subjectId", nativeQuery = true)
	public int countTopic(Integer subjectId );	
}