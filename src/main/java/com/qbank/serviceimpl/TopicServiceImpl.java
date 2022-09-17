package com.qbank.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.TopicMaster;
import com.qbank.repository.TopicRepository;
import com.qbank.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService{
    
	@Autowired
	TopicRepository topicRepository;
	
	@Override
	public TopicMaster getTopicById(int topicId) {
		
		return topicRepository.findById(topicId).get();
	}

	@Override
	public List<TopicMaster> getAllTopic() {
		
		return topicRepository.findAll();
	}

	@Override
	public void createTopic(TopicMaster topicMaster) {
		
		topicMaster.setCreatedDate(new Date());
		topicMaster.setModifyDate(new Date());
		topicRepository.save(topicMaster);
	}

	@Override
	public TopicMaster updateTopic(int topicId, TopicMaster topicMaster) {
		TopicMaster topic = topicRepository.findById(topicId).get();
		topic.setTopicName(topicMaster.getTopicName());
		topic.setSubjectMaster(topicMaster.getSubjectMaster());
		topic.setModifyDate(new Date());
		return topicRepository.save(topic);	
	}

	@Override
	public void deleteTopic(int topicId) {
		
		Optional<TopicMaster> topicMaster=topicRepository.findById(topicId);
		if(topicMaster.isPresent()) {
			TopicMaster topicMaster1=topicMaster.get();
			topicRepository.delete(topicMaster1);
		}
	}
	
	public int findTopicByName(String topicName) {
		
		int result=0;
		Optional<Integer> res =topicRepository.findTopicByName(topicName);
		if(res.isPresent()) {
			result=1;
		}else {
			result=0;
		}
		return result;
	}
	
	public List<TopicMaster> findBySubject(int subjectId) {	
	
		return topicRepository.findBySubject(subjectId);		
	}
	
	@Override
	public int countTopicReport() {
		
		int result = topicRepository.countTopicReport();
		return result;
	}
}