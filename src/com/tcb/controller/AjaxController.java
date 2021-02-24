package com.tcb.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;
import com.tcb.bean.AjaxData;
import com.tcb.bean.AjaxResponseBody;
import com.tcb.bean.Views;
import com.tcb.model.UserQuizDetailsDto;
import com.tcb.service.IAdminService;

@RestController
public class AjaxController {
	
	@Autowired  
	private IAdminService adminService; 	
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/search/api/getSearchResult")
	public AjaxResponseBody getSearchResultViaAjax(@RequestBody AjaxData data, HttpServletRequest request) {

		 AjaxResponseBody result = new AjaxResponseBody();
		 
		 String imgval = data.getAjdata();
		 String question = data.getQuestion();
		 String app_id = data.getApp_id_image();
		 String dtr_date = data.getTstr_date();
		 //String sourceData = imgval;
		 
		 /*UserQuizDetailsDto userQuizDetailsDto = new UserQuizDetailsDto();
		 userQuizDetailsDto.setTbl_ajaxdata(imgval);
		 userQuizDetailsDto.setTnum_is_active(1);
		 userQuizDetailsDto.setTdt_entry_date(new Date());
		 userQuizDetailsDto.setTstr_question(question);
		 userQuizDetailsDto.setTstr_date(dtr_date);
		 userQuizDetailsDto.setTstr_app_id(app_id);
		 
		 try {
			this.adminService.updateUserQuizDetailsDto(userQuizDetailsDto);
		 } catch (Exception e) {
			e.printStackTrace();
		 }*/
		 
		 
		 // tokenize the data
		 //String parts[] = sourceData.tokenize(",");
		 String imageString = imgval.replace("data:image/png;base64,", "");
		 ContentUploader uploader = new ContentUploader();
		 uploader.uploadImage(app_id, "dataimage/"+question, imageString, dtr_date);

		 result.setCode("200");
		 result.setMsg("data uploaded successfully");
		 result.setResult("success");
		 
		 return result;

	}
}
