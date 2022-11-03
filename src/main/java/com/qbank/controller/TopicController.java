package com.qbank.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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

import com.qbank.entity.SubjectMaster;
import com.qbank.entity.TopicMaster;
import com.qbank.repository.TopicRepository;
import com.qbank.service.SubjectService;
import com.qbank.serviceimpl.TopicServiceImpl;

@RestController
public class TopicController {
		
	@Autowired
	TopicServiceImpl topicService;
	
	@Autowired
	TopicRepository topicRepository;
	
	@Autowired
	SubjectService subjectService;
	
	@GetMapping("/getTopicById/{topicId}")
	public ResponseEntity<TopicMaster> getTopicById(@PathVariable(value = "topicId") int topicId) {
		TopicMaster topicMaster = topicService.getTopicById(topicId);
		return new ResponseEntity<>(topicMaster, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/TopicTable" ,method = RequestMethod.GET)
	public ModelAndView manageTopic(ModelAndView mv , Model model) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		List<TopicMaster> topicMaster = topicService.getAllTopic();
		model.addAttribute("topicMaster", topicMaster);
		System.out.println(subject);
		return mv;
	}
	
	@PostMapping("/save1")
	public ModelAndView save(TopicMaster t,ModelAndView mv,Model m) {
		topicRepository.save(t);
		manageTopic(mv, m);
		mv = new ModelAndView("redirect:TopicTable");
		return mv;
	}

	@RequestMapping(value = "/addTopicForm")
	public ModelAndView showAddTopic(ModelAndView mv, Model m) {	
		List<SubjectMaster> subject =subjectService.getAllSubject();
		System.out.println(subject);
		m.addAttribute("subject", subject);
		return mv;
	}
	
	@RequestMapping(value = "/saveTopic")
	public ModelAndView saveTopic(ModelAndView mv,Model m, @ModelAttribute("topicMaster") TopicMaster topicMaster,@ModelAttribute("SubjectMaster") SubjectMaster subjectMaster) throws Exception {
		String wrongmessage="";
		int result=topicService.findTopicByName(topicMaster.getTopicName());
		if(result>0) {
			wrongmessage="Topic AlReady Exits";
		}else {
			try {
				topicService.createTopic(topicMaster);
				System.out.println(topicMaster);
				wrongmessage="Topic Added SucessFully";
			}catch(Exception e) {
				mv = new ModelAndView("TopicTable");
			}
		}
		m.addAttribute("msg",wrongmessage);
		System.out.println(wrongmessage);
		manageTopic(mv, m);
		mv = new ModelAndView("TopicTable");
		return mv;
	}
	
	@PutMapping("/updateTopic/{topicId}")
	public ResponseEntity<TopicMaster> updateTopic(@PathVariable(value = "topicId") int topicId,
			@RequestBody TopicMaster topicMaster) {
		topicService.updateTopic(topicId, topicMaster);
		topicMaster.setModifyDate(new Date());
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteTopic/{topicId}")
	public ModelAndView deleteTopic(@PathVariable(value = "topicId") Integer topicId,Model m,ModelAndView mv) {
		topicService.deleteTopic(topicId);
		manageTopic(mv, m);
		mv = new ModelAndView("redirect:/TopicTable");
		return mv;
	}

	@GetMapping("/findOne1/{topicId}")
	@ResponseBody
	public Optional<TopicMaster> findOne(@PathVariable("topicId") Integer topicId,Model model) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		System.out.println(topicId);
		return topicRepository.findById(topicId);
		
	}
}
