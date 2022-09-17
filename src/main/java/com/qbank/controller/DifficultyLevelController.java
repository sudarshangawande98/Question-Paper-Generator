package com.qbank.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.qbank.entity.DifficultyLevelMaster;
import com.qbank.repository.DifficultyLevelRepository;
import com.qbank.service.DifficultyLevelService;
import com.qbank.serviceimpl.DifficultyLevelServiceImpl;

import lombok.extern.java.Log;

@Log
@RestController

public class DifficultyLevelController {
	
	@Autowired
	DifficultyLevelServiceImpl difficultyLevelServiceImpl;
	
	@Autowired
	DifficultyLevelRepository difficultyLevelRepository;
	
	@Autowired
	DifficultyLevelService difficultyLevelService;
	
//	API to return all DifficultyLeve details
	@PostMapping("/createDifficultyLevel")
	public ResponseEntity<DifficultyLevelMaster> createLevel(@RequestBody DifficultyLevelMaster difficultyLevelMaster) {
		
		difficultyLevelServiceImpl.createLevel(difficultyLevelMaster);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

//	API to Show DifficultyLevel Details	
	@GetMapping(value = "/levelTable" )
	public ModelAndView manageLevel(ModelAndView mv , Model model) {
		List<DifficultyLevelMaster> difficultyLevelMaster = difficultyLevelServiceImpl.getAllLevel();
		model.addAttribute("difficultyLevelMaster", difficultyLevelMaster);
		return mv;
	}

	@RequestMapping(value = "/saveLevel")
	public ModelAndView saveLevel(ModelAndView mv,Model m, @ModelAttribute("difficultyLevelMaster") DifficultyLevelMaster difficultyLevelMaster)  {
		String msg;
		int result=difficultyLevelServiceImpl.findLevelByName(difficultyLevelMaster.getLevelName());
		if(result>0) {
			msg="Level AlReady Exits";
		}else {
			
			difficultyLevelServiceImpl.createLevel(difficultyLevelMaster);
			msg="Level Added SucessFully";
		}
		m.addAttribute("msg",msg);
		manageLevel(mv, m);
		mv = new ModelAndView("redirect:levelTable");
		return mv;
	}
	
	@PostMapping("/save3")
	public ModelAndView save(DifficultyLevelMaster d,ModelAndView mv,Model m) {
		
		difficultyLevelRepository.save(d);
		manageLevel(mv, m);
		mv = new ModelAndView("redirect:levelTable");
		return mv;
	}
	
	@RequestMapping(value = "/deleteLevel/{levelId}")
	public ModelAndView deleteLevel(ModelAndView mv,@PathVariable("levelId") int levelId,Model m) {
		difficultyLevelService.deleteLevel(levelId);
		manageLevel(mv, m);
		mv = new ModelAndView("redirect:/levelTable");
		return mv;
	}
	
	@GetMapping("/findOne3/{levelId}")
	@ResponseBody
	public Optional<DifficultyLevelMaster> findOne(@PathVariable("levelId") Integer levelId) {
		
		return difficultyLevelRepository.findById(levelId);		
	}
	
//	API to show by Id DifficultyLevel Details
	@GetMapping("/getLevelById/{levelId}")
	public ResponseEntity<DifficultyLevelMaster> getDifficultLevelById(@PathVariable(value = "levelId") int levelId) {
		DifficultyLevelMaster difficultyLevelMaster = difficultyLevelServiceImpl.getLevelById(levelId);
		return new ResponseEntity<>(difficultyLevelMaster, HttpStatus.OK);
	}

//	API to update DifficultyLevel Details	
	@PutMapping("/updateDifficultyLevel/{levelId}")
	public ResponseEntity<DifficultyLevelMaster> updateDifficultyLevel(@PathVariable(value = "levelId") int levelId,
			@RequestBody DifficultyLevelMaster difficultyLevelMaster) {
		difficultyLevelServiceImpl.updateLevel(levelId, difficultyLevelMaster);
		return new ResponseEntity<>(HttpStatus.OK);
	}

//	API to delete DifficultyLevel Details	
	@DeleteMapping("/deleteDifficultyLevel/{levelId}")
	public ResponseEntity<DifficultyLevelMaster> DifficultyLevel(@PathVariable(value = "levelId") int levelId) {
		difficultyLevelServiceImpl.deleteLevel(levelId);
		return new ResponseEntity<>(HttpStatus.OK);
	}	
}
