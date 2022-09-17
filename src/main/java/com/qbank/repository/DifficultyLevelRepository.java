package com.qbank.repository;

import java.util.Optional;

/**
 * Repository for DifficultyLevel to provide functionality of all database related queries
 * @author Sudarshan 
 * @Date 10/03/2022
 */
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.qbank.entity.DifficultyLevelMaster;

@Repository
public interface DifficultyLevelRepository extends JpaRepository<DifficultyLevelMaster, Integer>{

	@Query(value="SELECT * FROM difficultyLevelMaster WHERE levelName=?",nativeQuery = true)
	public Optional<Integer> findLevelByName(String levelName);
}