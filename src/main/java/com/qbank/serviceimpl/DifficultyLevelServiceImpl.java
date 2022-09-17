package com.qbank.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qbank.entity.DifficultyLevelMaster;
import com.qbank.repository.DifficultyLevelRepository;
import com.qbank.service.DifficultyLevelService;

import lombok.extern.java.Log;

@Service
@Log
public class DifficultyLevelServiceImpl implements DifficultyLevelService{

	@Autowired
	private DifficultyLevelRepository difficultyLevelRepository;
	
	@Override
	public void createLevel(DifficultyLevelMaster difficultyLevelMaster) {
		
		difficultyLevelRepository.save(difficultyLevelMaster);
	}

	@Override
	public List<DifficultyLevelMaster> getAllLevel() {
		
		return difficultyLevelRepository.findAll();
	}

	@Override
	public DifficultyLevelMaster getLevelById(int levelId) {
		
		DifficultyLevelMaster difficultyLevelMaster=difficultyLevelRepository.findById(levelId).get();
		return difficultyLevelMaster;
	}

	@Override
	public void updateLevel(int levelId, DifficultyLevelMaster difficultyLevelMaster) {
		
		DifficultyLevelMaster difficultyLevelMaster2=difficultyLevelRepository.findById(levelId).get();
		difficultyLevelMaster2.setLevelName(difficultyLevelMaster.getLevelName());
	}

	@Override
	public void deleteLevel(int levelId) {
		
		difficultyLevelRepository.deleteById(levelId);
	}
	
	@Override
	public int findLevelByName(String levelName) {
		
		int result=0;
		Optional<Integer> res =difficultyLevelRepository.findLevelByName(levelName);
		if(res.isPresent()) {
			result=1;
		} else {
			result=0;
		}
		return result;
	}
}