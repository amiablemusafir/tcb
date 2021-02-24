

package com.tcb.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tcb.bean.QuizDetailsBean;
import com.tcb.bean.UserDetailsBean;
import com.tcb.model.AdminDetailDto;
import com.tcb.service.IAdminService;
import com.tcb.serviceimpl.AdminServiceImpl;


@Controller
public class AdminCommonAction {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private String randomString;
	
	@Autowired  
	private IAdminService adminService; 
	
	
	@RequestMapping(value = "/homepage")  
	public String loginPage(UserDetailsBean userDetailsBean, HttpServletRequest request, HttpServletResponse response) {  
		
		try {
			Map<String, Object> model = new HashMap<String, Object>();
			String randomString =  this.randomGeneratedString();
			request.getSession().setAttribute("user_authentication_error", null);
			request.getSession().setAttribute("randomString", randomString);
			
			System.out.println("Hello Sumit");
			model.put("randomstring", randomString);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return "login-page";  
	} 
	
	//@RequestMapping(value = "/authentication")  
	@RequestMapping("/authentication")  
    public ModelAndView authentication(@ModelAttribute("command")QuizDetailsBean quizDetailsBean, BindingResult result, HttpServletRequest request, HttpServletResponse response) {   
		Map<String, Object> model = new HashMap<String, Object>();
		quizDetailsBean = new QuizDetailsBean();
		String flag = "login-page";
		try {
			String login_id = request.getParameter("loginId");			
			login_id = login_id.replaceAll("\\s", "");
			
			String pstr_password = request.getParameter("password");			
			
			List<AdminDetailDto> adminDetailDtoList = new ArrayList<AdminDetailDto>();
			adminDetailDtoList = this.adminService.getAdminDetailDto(login_id);
			if(adminDetailDtoList!=null && adminDetailDtoList.size()>0) {
				for(AdminDetailDto adminDetailDto : adminDetailDtoList) {
				
					   String pstr_login_id = adminDetailDto.getTstr_username();
					   if(login_id.equalsIgnoreCase(pstr_login_id)) {
						
							  String password = adminDetailDto.getTstr_password();
							  String random_string = (String) request.getSession().getAttribute("randomString");
							
							  password = password + random_string;
							  // Md5 Algo convert password into Hash code
							  password = this.Md5value(password);
							  
							  System.out.println(password);
							  System.out.println(pstr_password);
							  
							  // Check Password is equal or not
							  if(pstr_password.equalsIgnoreCase(password)) {
								 // Authentication Done
								 model.put("message_details", "");
								 model.put("quizDetailsDtoBean", null);
								 flag = "createQuiz"; 
							  } else {
								 flag = "login-page"; 
							  }
				       }
				}
			}		
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView(flag, model); 
    } 

	
	// this method is used for generating string
	public String randomGeneratedString() {

		final int PASSWORD_LENGTH = 8;
		StringBuffer sb = new StringBuffer();
		for (int x = 0; x < PASSWORD_LENGTH; x++) {
			sb.append((char) ((int) (Math.random() * 26) + 97));
		}
		String a = sb.toString();
		System.out.println(a);

		return a;
	}

	// Method Of MD5 algorithm...........
	public String Md5value(String pass) throws Exception, NoSuchAlgorithmException {
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.reset();

		m.update(pass.getBytes());
		byte[] digest = m.digest();
		BigInteger bigInt = new BigInteger(1, digest);
		String hashtext = bigInt.toString(16);
		while (hashtext.length() < 32) {
			hashtext = "0" + hashtext;
		}

		return hashtext;
	}
		
		
		
}
