package com.qbank.service;

import java.util.List;

import com.qbank.entity.DifficultyLevelMaster;

public interface DifficultyLevelService {

//	Method to save  details DifficultyLevel
	void createLevel(DifficultyLevelMaster  difficultyLevelMaster);

//	Method to return all  DifficultyLevel  details	
	List<DifficultyLevelMaster> getAllLevel();

//	Method to return DifficultyLevel details according to DifficultyLeve levelId	
	DifficultyLevelMaster getLevelById(int levelId);

//	Method to update DifficultyLevel  details	
	void updateLevel(int levelId,DifficultyLevelMaster difficultyLevelMaster);

//	Method to delete DifficultyLevel details	
	void deleteLevel(int levelId);
	public int findLevelByName(String levelName);
}