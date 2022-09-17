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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.qbank.entity.SubjectMaster;
import com.qbank.repository.SubjectRepository;
import com.qbank.serviceimpl.SubjectServiceImpl;

import lombok.extern.java.Log;

@Log
@RestController
public class SubjectController {

	@Autowired
	SubjectServiceImpl subjectService;
	
	@Autowired
	SubjectRepository subjectRepository;

	@GetMapping("/getSubjectById/{subjectId}")
	public ResponseEntity<SubjectMaster> getSubjectById(@PathVariable(value = "subjectId") int subjectId) {
		SubjectMaster subjectMaster = subjectService.getSubjectById(subjectId);
		return new ResponseEntity<>(subjectMaster, HttpStatus.OK);
	}

	@GetMapping("/getAllSubject")
	public List<SubjectMaster> getAllSubject() {
		List<SubjectMaster> subjectMaster = subjectService.getAllSubject();
		return subjectMaster;
	}
	
	@RequestMapping(value = "/subjectTable" ,method = RequestMethod.GET)
	public ModelAndView manageSubject(ModelAndView mv , Model model) {
		List<SubjectMaster> subject = subjectService.getAllSubject();
		model.addAttribute("subject", subject);
		return mv;
	}
	
	@RequestMapping(value = "/saveSubject")
	public ModelAndView saveSubject(ModelAndView mv,Model m, @ModelAttribute("subject") SubjectMaster subject) throws Exception {
		String msg;
		int result=subjectService.findSubjectByName(subject.getSubjectName());
		if(result>0) {
			msg="Subject AlReady Exits";
		}else {
			subject.setCreatedDate(new Date());
			subject.setModifyDate(new Date());
			subjectService.createSubject(subject);
			msg="Subject Added SucessFully";
		}
		m.addAttribute("msg",msg);
		manageSubject(mv, m);
		mv = new ModelAndView("redirect:subjectTable");
		return mv;
	}
	
	@PostMapping("/save")
	public ModelAndView save(SubjectMaster s,ModelAndView mv,Model m) {
		
		subjectRepository.save(s);
		manageSubject(mv, m);
		mv = new ModelAndView("redirect:subjectTable");
		return mv;
	}
	
	@RequestMapping(value = "/updateSubjectForm/{subjectId}" , method = RequestMethod.GET)
	public ModelAndView updateDeptForm(ModelAndView mv , Model model , @PathVariable("subjectId") int subjectId) {
		mv =  new ModelAndView("/updateSubjectForm");	
		SubjectMaster subjectMaster = subjectService.getSubjectById(subjectId);
		model.addAttribute("subjectMaster", subjectMaster);
		return mv;
	}
	
	@RequestMapping(value = "/updateSubject" , method = RequestMethod.GET)
	public ModelAndView updateDept(ModelAndView mv , @ModelAttribute("subjectMaster")
	SubjectMaster subjectMaster) {
		mv = new ModelAndView("redirect:subjectTable");
		subjectService.updateSubject(subjectMaster);
		return mv;
	}

	@RequestMapping(value = "/deleteSubject/{subjectId}")
	public ModelAndView deleteSubject(ModelAndView mv,@PathVariable("subjectId") int subjectId,Model m) {
		subjectService.deleteSubject(subjectId);
		manageSubject(mv, m);
		mv = new ModelAndView("redirect:/subjectTable");
		return mv;
	}
	
	@GetMapping("/findOne/{subjectId}")
	@ResponseBody
	public Optional<SubjectMaster> findOne(@PathVariable("subjectId") Integer subjectId) {
		return subjectRepository.findById(subjectId);		
	}
}
