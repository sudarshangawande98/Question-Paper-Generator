package com.qbank.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.qbank.entity.DifficultyLevelMaster;
import com.qbank.entity.QuestionMaster;
import com.qbank.entity.SubjectMaster;
import com.qbank.entity.TestMaster;
import com.qbank.repository.QuestionRepository;
import com.qbank.repository.TopicRepository;
import com.qbank.service.DifficultyLevelService;
import com.qbank.serviceimpl.SubjectServiceImpl;
import com.qbank.serviceimpl.TestServiceImpl;

@RestController
@Component
public class TestController  {

	@Autowired
	TestServiceImpl testService;

	@Autowired
	SubjectServiceImpl subjectService;

	@Autowired
	QuestionRepository questionRepository;
	
	@Autowired
	TopicRepository topicRepository;

	@Autowired
	DifficultyLevelService difficultyLevelService;

	@RequestMapping(value = "/createTest")
	public ModelAndView createTest( Model m, @ModelAttribute("testMaster") TestMaster testMaster) throws Exception{
		
		ModelAndView mv = null;
		
		testService.createTest(testMaster);
		List<QuestionMaster> list = new ArrayList<QuestionMaster>();
		int subjectId = testMaster.getSubjectMaster().getSubjectId();
		int totalQuestions = testMaster.getTotalNoOfQuestion();

		List<DifficultyLevelMaster> difficultyLevelMaster = difficultyLevelService.getAllLevel();
		
		for (DifficultyLevelMaster level : difficultyLevelMaster) {

			int percentage = this.percentage(totalQuestions, level.getPercentage());
			int count=topicRepository.countTopic(subjectId);
			
			List<QuestionMaster> list1 = questionRepository.findRandQuestions(subjectId, 3, percentage);
		
			list.addAll(list1);
			Collections.shuffle(list);
			int index=0;
			m.addAttribute("list", list);
			m.addAttribute("index", index);

			mv = new ModelAndView("testGenrate");
		}
		return mv;
	}	
	
	@RequestMapping(value="/createTest1")
	public ModelAndView createTest1(@RequestParam(name="hiddenData") String hiddenData,ModelAndView mv,Model m) throws Exception {
		
		System.out.println("hiddenData"+hiddenData);
		final ObjectMapper objectMapper = new ObjectMapper();

		TestMaster[] testList = objectMapper.readValue(hiddenData, TestMaster[].class);
		
		List<TestMaster> testList1 = new ArrayList(Arrays.asList(testList));
		
		int sum1=0;
		int sum=0;
	    List<QuestionMaster> list = new ArrayList<QuestionMaster>();
	    for (TestMaster testMaster: testList1) {
			
	    	testService.createTest(testMaster);
			int subjectId = testMaster.getSubjectMaster().getSubjectId();
			int topicId = testMaster.getTopicMaster().getTopicId();
			int hardQuestions = testMaster.getTotalNoOfHardQuestion();
			int	lowQuestions = testMaster.getTotalNoOfLowQuestion();
			int mediumQuestions = testMaster.getTotalNoOfMediumQuestion();
			
			sum1=hardQuestions+lowQuestions+mediumQuestions;
			sum=sum+sum1;
	        
	        List<QuestionMaster> list1 = questionRepository.findRandHardQuestions(subjectId,topicId,3,hardQuestions);
			List<QuestionMaster> list2 = questionRepository.findRandLowQuestions(subjectId, topicId, 1, lowQuestions);
			List<QuestionMaster> list3 = questionRepository.findRandMediumQuestions(subjectId, topicId, 2, mediumQuestions);
				
			list.addAll(list1);
			list.addAll(list2);
			list.addAll(list3);

			m.addAttribute("duration", testMaster.getDuration());	
	    }

	    Collections.shuffle(list);
		int index=0;
		m.addAttribute("list", list);
		m.addAttribute("index", index);
		mv = new ModelAndView("testGenrate");
		return mv;
	}

	@GetMapping("/getAllTest")
	public List<TestMaster> getAllTest() {
		List<TestMaster> testMaster = testService.getAllTest();
		return testMaster;
	}

	public int percentage(int totalQuestions, float percentage) {
		float percentage1 =  ((percentage) * totalQuestions);
		int percent= (int) Math.ceil(percentage1);
		return percent;
	}

//	Method to get Test By Id
	@GetMapping("/getTestById/{testId}")
	public Optional<TestMaster> getTestById(@PathVariable(value = "testId") int testId) {
		return testService.getTestById(testId);
	}

//	Method to get Test By name
	@GetMapping("/getTestByName/{testName}")
	public TestMaster getTestByName(String testName) {
		return testService.getTestByName(testName);
	}

//	Method to update test
	@PutMapping("/updateTest/{testId}")
	public TestMaster updateTest(@PathVariable(value = "testId") int testId, @RequestBody TestMaster testMaster) {

		return testService.updateTest(testId, testMaster);
	}

//	Method to delete Test
	@DeleteMapping("/deleteTest/{testId}")
	public ResponseEntity<TestMaster> deleteTest(@PathVariable(value = "testId") int testId) {
		testService.deleteTest(testId);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "/generate_question", method = RequestMethod.GET)
	public ModelAndView generate_question(ModelAndView mv, Model model) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		return mv;
	}
	
	@RequestMapping(value = "/generate_question1", method = RequestMethod.GET)
	public ModelAndView generate_question1(ModelAndView mv, Model model) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		return mv;
	}	
}