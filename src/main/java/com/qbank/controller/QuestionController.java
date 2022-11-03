package com.qbank.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.qbank.entity.DifficultyLevelMaster;
import com.qbank.entity.QuestionMaster;
import com.qbank.entity.SubjectMaster;
import com.qbank.entity.TopicMaster;
import com.qbank.repository.QuestionRepository;
import com.qbank.repository.SubjectRepository;
import com.qbank.service.DifficultyLevelService;
import com.qbank.service.QuestionService;
import com.qbank.service.SubjectService;
import com.qbank.service.TopicService;
import com.qbank.serviceimpl.QuestionServiceImpl;
import com.qbank.serviceimpl.TopicServiceImpl;

import lombok.extern.java.Log;

@Log
@RestController
public class QuestionController {

	@Autowired
	QuestionServiceImpl questionServiceImpl;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	QuestionRepository questionRepository;
	
	@Autowired
	SubjectService subjectService;
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	TopicServiceImpl topicServiceimpl;
	
	@Autowired
	SubjectRepository subjectRepository;
	
	@Autowired
	DifficultyLevelService difficultyLevelService;
	
	@GetMapping("/getQuestionById/{questionId}")
	public ResponseEntity<QuestionMaster> getTopicById(@PathVariable(value = "questionId") int questionId) {
		QuestionMaster questionMaster = questionServiceImpl.getQuestionById(questionId);
		return new ResponseEntity<>(questionMaster, HttpStatus.OK);
	}
	
	@GetMapping("/getAllQuestion")
	public List<QuestionMaster> getAllQuestion() {
		List<QuestionMaster> questionMaster = questionServiceImpl.getAllQuestion();
		return questionMaster;
	}
	
	@PostMapping("/createQuestion")
	public ResponseEntity<QuestionMaster> createQuestion(@RequestBody QuestionMaster questionMaster) {
		questionServiceImpl.createQuestion(questionMaster);
		questionMaster.setCreatedDate(new Date());
		questionMaster.setModifiedDate(new Date());
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@PutMapping("/updateQuestion/{questionId}")
	public ResponseEntity<QuestionMaster> updateQuestion(@PathVariable(value = "questionId") int questionId,
			@RequestBody QuestionMaster questionMaster) {
		questionServiceImpl.updateQuestion(questionId, questionMaster);
		questionMaster.setModifiedDate(new Date());
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteQuestion/{questionId}")
	public ResponseEntity<QuestionMaster> deleteQuestion(@PathVariable(value = "questionId") int questionId) {
		questionServiceImpl.deleteQuestion(questionId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/questionTable" ,method = RequestMethod.GET)
	public ModelAndView manageQuestion(ModelAndView mv , Model model ) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		List<DifficultyLevelMaster> difficultyLevelMaster = difficultyLevelService.getAllLevel();
		model.addAttribute("difficultyLevelMaster", difficultyLevelMaster);
		List<TopicMaster> topicMaster = topicService.getAllTopic();
		model.addAttribute("topicMaster", topicMaster);
		List<QuestionMaster> questionMaster = questionService.getAllQuestion();
		model.addAttribute("questionMaster", questionMaster);
		
		return mv;
	}
	
	@RequestMapping(value = "/saveQuestion")
	public ModelAndView saveQuestion(ModelAndView mv,Model m, @ModelAttribute("questionMaster") QuestionMaster questionMaster,@ModelAttribute("SubjectMaster") SubjectMaster subjectMaster) throws Exception {
		String wrongmessage="";
		int result=questionService.findQuestionByName(questionMaster.getQuestion());
		System.out.println(result);
		if(result>0) {
			wrongmessage="Question AllReady Exits....!";
		}else {
			try{
				questionService.createQuestion(questionMaster);
				wrongmessage="Question Added SucessFully....!";
			}catch(Exception e) {
				mv = new ModelAndView("redirect:questionTable");
			}
		}
		
		m.addAttribute("wrongmessage",wrongmessage);
		manageQuestion(mv, m);
		mv = new ModelAndView("questionTable");
		
		return mv;
	}
	
	@Autowired
	JdbcTemplate template;
	public int updateMarks(String subjectName) {
	
		int no=4;
		String sql = "update questionMaster set marks=('"+no+"') where subjectName='" + subjectName+ "' ";
		
		return template.update(sql);
	}
	
	@RequestMapping(value = "/deleteQuestion/{questionId}")
	public ModelAndView deleteQuestion(@PathVariable(value = "questionId") Integer questionId,Model m,ModelAndView mv) {
		questionService.deleteQuestion(questionId);
		manageQuestion(mv, m);
		mv = new ModelAndView("redirect:/questionTable");
		return mv;
	}

	@PostMapping("/save2")
	public ModelAndView save(QuestionMaster q,ModelAndView mv,Model m) {
		
		questionRepository.save(q);
		manageQuestion(mv, m);
		mv = new ModelAndView("redirect:questionTable");
		return mv;
	}
	
	@GetMapping("/findOne2/{questionId}")
	@ResponseBody
	public Optional<QuestionMaster> findOne(@PathVariable("questionId") Integer questionId,Model model) {
		
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		
		List<TopicMaster> topicMaster = topicService.getAllTopic();
		model.addAttribute("topicMaster", topicMaster);
		
		List<DifficultyLevelMaster> difficultyLevelMaster = difficultyLevelService.getAllLevel();
		model.addAttribute("difficultyLevelMaster", difficultyLevelMaster);
		return questionRepository.findById(questionId);
	}
	
	@ResponseBody
	@RequestMapping(value = "getTopicDropdown/{subjectId}", method = RequestMethod.GET)
	public List<TopicMaster> getTopicDropdown(@PathVariable("subjectId") int subjectId) {
		return topicServiceimpl.findBySubject(subjectId);
	}	
}
