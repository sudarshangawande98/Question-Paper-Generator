package com.qbank.service;

import java.util.List;

import com.qbank.entity.TopicMaster;

public interface TopicService {
	
//	Method to return topic details according to topic Id	
	TopicMaster getTopicById(int topicId);
	
//	Method to return all topic details	
	List<TopicMaster> getAllTopic();
	
//	Method to save Topic details		
	void createTopic(TopicMaster topicMaster);
	
//	Method to update topic details	
	TopicMaster updateTopic(int topicId,TopicMaster topicMaster);
	
//	Method to delete topic details	
	void deleteTopic(int topicId);

	public int findTopicByName(String topicName);
	public List<TopicMaster> findBySubject(int subjectId);

	int countTopicReport();
}