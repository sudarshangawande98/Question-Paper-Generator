package com.qbank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
public class QbankApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(QbankApplication.class, args);
	}
	
	 @Override
	 protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	  return application.sources(QbankApplication.class);
	 }
	 
//	@RequestMapping(value = "/")
//	public ModelAndView viewLogin(ModelAndView mv, Model m) {
//		mv = new ModelAndView("login");
//		return mv;
//	}
}