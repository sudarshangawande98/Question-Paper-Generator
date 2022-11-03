package com.qbank.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.qbank.entity.QuestionMaster;
import com.qbank.entity.TopicMaster;

@Repository
public interface QuestionRepository extends JpaRepository<QuestionMaster, Integer>{

	@Query(value="SELECT count(*) FROM questionMaster WHERE question=?",nativeQuery = true)
	public int findQuestionByName(String question);
	
	@Query(value="select topicName from topicMaster,subjectMaster where subjectMaster.subjectId=topicMaster.subjectId AND subjectName=?",nativeQuery = true)
	public List<TopicMaster> getTopicList(@Param("subjectName") String subjectName);

	@Query(value="SELECT * FROM questionMaster where subjectId = ?1 and levelId= ?2  ORDER BY rand() LIMIT ?3",nativeQuery=true)
	public List<QuestionMaster> findRandQuestions(int subjectId,int levelId,int noofquestions);
	
	@Query(value = "SELECT COUNT(questionId) FROM questionMaster", nativeQuery = true)
	public int countQuestionReport();
	
	//@Query(value="select * from questionMaster where questionId NOT IN(Select questionId from pdfQuestion as p Join  (Select testId from test as t where subjectId=?1 and topicId=?2 order by testId desc limit 3) as d on p.testId IN (d.testId)) and subjectId=?1 and topicId=?2  and levelId=?3 ORDER BY rand() LIMIT ?4",nativeQuery=true)	
	@Query(value="select * from questionMaster where subjectId=?1 and topicId=?2 and levelId =?3  ORDER BY rand() LIMIT ?4" ,nativeQuery=true)
	public List<QuestionMaster> findRandMediumQuestions(int subjectId,int topicId,int levelId,int noofMediumquestions);
 
	//@Query(value="select * from questionMaster where questionId NOT IN(Select questionId from pdfQuestion as p Join  (Select testId from test as t where subjectId=?1 and topicId=?2 order by testId desc limit 3) as d on p.testId IN (d.testId)) and subjectId=?1 and topicId=?2  and levelId=?3 ORDER BY rand() LIMIT ?4",nativeQuery=true)
	@Query(value="select * from questionMaster where subjectId=?1 and topicId=?2 and levelId =?3  ORDER BY rand() LIMIT ?4" ,nativeQuery=true)
	public List<QuestionMaster> findRandHardQuestions(int subjectId,int topicId,int levelId,int noofHardquestions);

	//@Query(value="select * from questionMaster where questionId NOT IN(Select questionId from pdfQuestion as p Join  (Select testId from test as t where subjectId=?1 and topicId=?2 order by testId desc limit 3) as d on p.testId IN (d.testId)) and subjectId=?1 and topicId=?2  and levelId=?3 ORDER BY rand() LIMIT ?4",nativeQuery=true)
	@Query(value="select * from questionMaster where subjectId=?1 and topicId=?2 and levelId =?3  ORDER BY rand() LIMIT ?4" ,nativeQuery=true)
	public List<QuestionMaster> findRandLowQuestions(int subjectId,int topicId,int levelId,int noofLowquestions);

	@Query(value ="SELECT COUNT(questionId) FROM questionmaster where subjectId=:subjectId and topicId=:topicId and levelId=:levelId ", nativeQuery = true)
	public int countHardQuestion(Integer subjectId,Integer topicId,Integer levelId);
	
	@Query(value ="SELECT COUNT(questionId) FROM questionmaster where subjectId=:subjectId and topicId=:topicId and levelId=:levelId ", nativeQuery = true)
	public int countMediumQuestion(Integer subjectId,Integer topicId,Integer levelId);
	
	@Query(value ="SELECT COUNT(questionId) FROM questionmaster where subjectId=:subjectId and topicId=:topicId and levelId=:levelId ", nativeQuery = true)
	public int countLowQuestion(Integer subjectId,Integer topicId,Integer levelId);
}
