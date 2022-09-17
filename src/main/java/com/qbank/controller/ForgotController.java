package com.qbank.controller;

/**
 * @author Sudarshan Gawande
 * @date 20/09/2022
 */

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.qbank.entity.UserMaster;
import com.qbank.repository.UserRepository;
import com.qbank.service.UserService;
import com.qbank.serviceimpl.EmailService;

@Controller
public class ForgotController {
	
	@Autowired
	 private EmailService emailService;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserService userservice;
	
	Random random=new Random(1000);
	
	@RequestMapping("/park")
	public ModelAndView openEmailForm1(ModelAndView mv) {
		return mv;
	}
	
	// email id from open handler
	@RequestMapping("/ForgetPassword")
	public ModelAndView openEmailForm(ModelAndView mv) {
		return mv;
	}

	@PostMapping("/send-otp")
	public ModelAndView sendOTP(@RequestParam("email") String email, HttpSession sessionOTP, ModelAndView mv, Model m) {

		// genrating otp of 4 digit
		int otp = random.nextInt(999999);
		
		// write code for send otp to email
		String subject = "OTP From Bhonsala Military School , Nashik  ";
		String message = "" + "<div style='border:1px solid #e2e2e2;padding:20px'>" + "<h1>" + "OTP is :" + "<b>" + otp
				+ "</b>" + "</h1>" + "</div>";
		String to = email;

		UserMaster user = this.userRepo.getUserByUserEmail(email);
		if (user == null) {
			// send error message
			m.addAttribute("message2", "User Does Not Exits with this email..!!");
			mv = new ModelAndView("ForgetPassword");
			return mv;
		} else {
			boolean flag=this.emailService.sendEmail(subject, message, to);

			if (flag) {
				sessionOTP.setAttribute("myotp", otp);
				sessionOTP.setAttribute("email", email);
				mv = new ModelAndView("VerifyOtp");
				return mv;
			} else {
				m.addAttribute("message1", "Check your Email id");
				mv = new ModelAndView("ForgetPassword");
				return mv;
			}
		}
	}

	// verify otp
	@PostMapping("/verify-otp")
	public ModelAndView verifyOtp(@RequestParam("otp") int otp, HttpSession sessionOTP, ModelAndView mv, Model m) {

		int myOtp = (Integer) sessionOTP.getAttribute("myotp");
		String email = (String) sessionOTP.getAttribute("email");
		if (myOtp == otp) {
			
			// Password change form
			UserMaster user = this.userRepo.getUserByUserEmail(email);
			if (user == null) {
				// send error message
				m.addAttribute("message2", "User Does Not Exits with this email..!!");
				mv = new ModelAndView("ForgetPassword");
				return mv;
			} else {
				// send change password form
			}
			mv = new ModelAndView("ChangePassword");
			return mv;
		} else {

			m.addAttribute("message1", "YOU Have Enter Wrong otp");
			mv = new ModelAndView("VerifyOtp");
			return mv;
		}
	}

	// change password
	@PostMapping("/change-password")
	public ModelAndView changePassword(@RequestParam("newpassword") String newpassword, HttpSession sessionOTP,
			ModelAndView mv, Model m) {
		String email = (String) sessionOTP.getAttribute("email");
		UserMaster user = this.userRepo.getUserByUserEmail(email);
		user.setPassword(newpassword);
		this.userRepo.save(user);
		m.addAttribute("message", "Change password succesfully..!!");
		mv = new ModelAndView("login");
		return mv;
	}
}
