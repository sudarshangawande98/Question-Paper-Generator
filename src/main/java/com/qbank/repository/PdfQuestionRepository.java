package com.qbank.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.qbank.entity.PdfQuestion;

@Repository
public interface PdfQuestionRepository extends JpaRepository<PdfQuestion, Integer>{

}
