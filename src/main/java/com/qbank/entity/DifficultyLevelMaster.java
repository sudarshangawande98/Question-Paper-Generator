package com.qbank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="difficultyLevelMaster")
public class DifficultyLevelMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int levelId;
	
	@Column(name="levelName")
	private String levelName;
	
	@Column(name="percentage")
	private float percentage;
	
	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public DifficultyLevelMaster(int levelId, String levelName) {
		super();
		this.levelId = levelId;
		this.levelName = levelName;
	}

	public DifficultyLevelMaster() {
		super();
	}

	@Override
	public String toString() {
		return "LevelMaster [levelId=" + levelId + ", levelName=" + levelName + "]";
	}
	
	public float getPercentage() {
		return percentage;
	}
	
	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}
}