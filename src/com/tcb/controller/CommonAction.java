
package com.tcb.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import sun.misc.BASE64Decoder;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.tcb.bean.ArticleDetailsBean;
import com.tcb.bean.QuizDetailsBean;
import com.tcb.common.FTPLogger;
import com.tcb.common.FTPLoggerThread;
import com.tcb.common.Setup;
import com.tcb.model.QuizDetailsDto;
import com.tcb.model.QuizDetailsOptionDto;
import com.tcb.model.UserQuizDetailsDto;
import com.tcb.service.IAdminService;


@Controller
public class CommonAction {

	private HttpServletRequest request;
	private HttpServletResponse response;
	
	@Autowired  
	private IAdminService adminService; 
	
	@RequestMapping(value="/quiz/{pageid}")  
	public ModelAndView quiz(@PathVariable int pageid, HttpServletRequest request){  
		
		String loger = "";
		loger = loger.concat(new Date().toString());
		QuizDetailsDto detailsDto = new QuizDetailsDto();		
		List<QuizDetailsDto> quizDetailsDtoList = new ArrayList<QuizDetailsDto>();
		
		int total = 6; 
		try {
			loger = loger.concat("Database Hit");
			quizDetailsDtoList = this.adminService.getQuizDetailsDtoList(detailsDto, total, pageid);
			request.getSession().setAttribute("quizDetailsDtoList", quizDetailsDtoList);
			loger = loger.concat("Successsful return");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			loger = loger.concat("Database Exception On Index ::"+e);
		}
		int page_no = (pageid/6)+1;
		int next = pageid+total;
		int prev = 0;
		if(quizDetailsDtoList.size() != 6) {
			next = 0;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("next", next);
		model.put("prev", prev);
		model.put("page_no", page_no);
		model.put("list", quizDetailsDtoList);
		loger = loger.concat("Return Successfull");
		
		//FTPLogger.logUpload(loger);
		
	    return new ModelAndView("quiz", model);  
	} 
	
	@RequestMapping(value="/next/{pageid}")  
	public ModelAndView next(@PathVariable int pageid, HttpServletRequest request){  
		
		QuizDetailsDto detailsDto = new QuizDetailsDto();		
		List<QuizDetailsDto> quizDetailsDtoList = new ArrayList<QuizDetailsDto>();
		
		int total = 6; 
		try {
			quizDetailsDtoList = this.adminService.getQuizDetailsDtoList(detailsDto, total, pageid);
			request.getSession().setAttribute("quizDetailsDtoList", quizDetailsDtoList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int page_no = (pageid/6)+1;
		int next = pageid+total;
		int prev = pageid-total;
		if(prev<0) {
			prev = 0;
		}
		if(quizDetailsDtoList.size() != 6) {
			next = 0;
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("next", next);
		model.put("prev", prev);
		model.put("page_no", page_no);
		model.put("list", quizDetailsDtoList);
		
	    return new ModelAndView("quiz", model);  
	}
	
	@RequestMapping(value="/prev/{pageid}")  
	public ModelAndView prev(@PathVariable int pageid, HttpServletRequest request){  
		
		QuizDetailsDto detailsDto = new QuizDetailsDto();		
		List<QuizDetailsDto> quizDetailsDtoList = new ArrayList<QuizDetailsDto>();
		
		int total = 6; 
		try {
			quizDetailsDtoList = this.adminService.getQuizDetailsDtoList(detailsDto, total, pageid);
			request.getSession().setAttribute("quizDetailsDtoList", quizDetailsDtoList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int page_no = (pageid/6)+1;
		int next = pageid+total;
		int prev = pageid-total;
		if(prev<0) {
			prev = 0;
		}
		if(quizDetailsDtoList.size() != 6) {
			next = 0;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("next", next);
		model.put("prev", prev);
		model.put("page_no", page_no);
		model.put("list", quizDetailsDtoList);
		
	    return new ModelAndView("quiz", model);  
	}
	
	@RequestMapping(value="/showpagecontent/{question}/{pageid}/{app_id}/{tstr_date}")  
	public ModelAndView showpagecontent(@PathVariable String question,@PathVariable int pageid,@PathVariable String app_id,@PathVariable String tstr_date, HttpServletRequest request){  
		
		QuizDetailsDto detailsDto = new QuizDetailsDto();		
		List<QuizDetailsDto> quizDetailsDtoListOnlyThree = new ArrayList<QuizDetailsDto>();
		System.out.println("app_id ::::"+app_id);
		
		try {
			detailsDto = this.adminService.findQuizDetailsDtoById(pageid);
			quizDetailsDtoListOnlyThree = this.adminService.getQuizDetailsDtoListOnlyThree(detailsDto);
			if(!(quizDetailsDtoListOnlyThree != null && quizDetailsDtoListOnlyThree.size()>0)) {
				QuizDetailsDto detailsDtoTemp = new QuizDetailsDto();	
				detailsDtoTemp.setTnum_id(1);
				quizDetailsDtoListOnlyThree = this.adminService.getQuizDetailsDtoListOnlyThree(detailsDtoTemp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(app_id == null || app_id.equals("")) {
			app_id = (String) request.getSession().getAttribute("tstr_img_id");			
		}
		request.getSession().setAttribute("tstr_img_id", app_id);
		
		request.getSession().setAttribute("quizDetailsDto", detailsDto);
		request.getSession().setAttribute("quizDetailsDtoListOnlyThree", quizDetailsDtoListOnlyThree);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("tstr_date", tstr_date);
		model.put("tstr_img_id", app_id);
		model.put("question", question);
		model.put("quizDetailsDto", detailsDto);
		model.put("list", quizDetailsDtoListOnlyThree);
		
		return new ModelAndView("showContent", model);  
	} 
	
	@RequestMapping(value="/showfacebookcontent/{question}/{pageid}/{app_id}/{tstr_date}")  
	public ModelAndView showfacebookpagecontent(@PathVariable String question,@PathVariable int pageid,@PathVariable String app_id,@PathVariable String tstr_date, HttpServletRequest request){  
		
		QuizDetailsDto detailsDto = new QuizDetailsDto();	
		List<UserQuizDetailsDto> userQuizDetailsDtoList = new ArrayList<UserQuizDetailsDto>();
		String img_details = "";
		try {
			detailsDto = this.adminService.findQuizDetailsDtoById(pageid);
			userQuizDetailsDtoList = this.adminService.findUserQuizDetailsDto(question, app_id, tstr_date);
			if(userQuizDetailsDtoList != null && userQuizDetailsDtoList.size()>0) {
				img_details = userQuizDetailsDtoList.get(0).getTbl_ajaxdata();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("question", question);
		model.put("pageid", pageid);
		model.put("app_id", app_id);
		model.put("tstr_date", tstr_date);
		model.put("img_details", img_details);
		model.put("quizDetailsDto", detailsDto);
		
		return new ModelAndView("showFacebookContent", model);  
	} 
	
	@RequestMapping(value="/showpagecontentdetails/{pageid}")  
	public ModelAndView showpagecontentDetails(@PathVariable int pageid, HttpServletRequest request, HttpServletResponse response){  
		
		QuizDetailsDto quizDetailsDto = new QuizDetailsDto();	
		List<QuizDetailsOptionDto> quizDetailsOptionDtoList = new ArrayList<QuizDetailsOptionDto>();
		
		String first_name = "";
  		String last_name = "";
  		String email_id = "";
  		String gender = "";
  		String id = "";
  		String newdate = "";
  		String tstr_image_url = "profilepic";
  		int num = 0; 
  		
		try {
			String facebook_redirect_url = Setup.FACEBOOK_REDIRECT_URI;
			facebook_redirect_url = facebook_redirect_url.replace("page_id", ""+pageid);
		    String rid = request.getParameter("request_ids");
		    if (rid != null) {
		      response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id="+Setup.FACEBOOK_CLIENT_ID+"&redirect_uri="+facebook_redirect_url+"");
		    } else {
		    	String code = request.getParameter("code");
			    if (code != null) {
			    	URL url = new URL("https://graph.facebook.com/oauth/access_token?client_id="+Setup.FACEBOOK_CLIENT_ID+"&redirect_uri="+facebook_redirect_url+"&client_secret="+Setup.FACEBOOK_CLIENT_SECRET+"&code=" +code);
			    	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			    	conn.setRequestMethod("GET");
			    	conn.setConnectTimeout(20000);
			    	String outputString = "";
			    	BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			    	String line;
			    	while ((line = reader.readLine()) != null) {
			    		outputString = outputString + line;
			    	}
			    	System.out.println(outputString);
			    	String accessToken = null;
			    	System.out.println("outputString::::::::::::"+outputString);
			          	  
			    	if (outputString.indexOf("access_token") != -1) {
			    		JSONObject json = new JSONObject(outputString);
			    		accessToken = json.getString("access_token");
			          	System.out.println("accessToken ::::::::::::"+accessToken);
			          	//accessToken = outputString.substring(13, outputString.indexOf("&"));
			    	}
			    	System.out.println(accessToken);
			    	url = new URL("https://graph.facebook.com/me?locale=en_US&fields=id,email,gender,first_name,last_name&access_token=" +accessToken);
			    	System.out.println(url);
			    	URLConnection conn1 = url.openConnection();
			    	conn1.setConnectTimeout(7000);
			      	outputString = "";
			      	reader = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
				          
			      	while ((line = reader.readLine()) != null) {
			      		outputString = outputString + line;
			      	}
			      	reader.close();
			      	System.out.println(outputString);
			      	try {
			      		JSONObject json = new JSONObject(outputString);
			      		
			      		try {
			      			first_name = json.getString("first_name");
			      		} catch(Exception ex) {
			      			first_name = "The Coder";
			      		}
			      		try {
			      			last_name = json.getString("last_name");
			      		} catch(Exception ex) {
			      			last_name = "Boy";
			      		}
			      		
			      		try {
			      			email_id = json.getString("email");
			      		} catch(Exception ex) {
			      			email_id = "mailnotfount@thecoderboy.com";
			      		}
			      		try {
			      			gender = json.getString("gender");	
			      		} catch(Exception ex) {
			      			gender = "both";	
			      		}
			      		
			      		try {
			      			id = json.getString("id");
			      		} catch(Exception ex) {
			      			id = "both";	
			      		}
			      		
			      		request.getSession().setAttribute("first_name", first_name);
			      		request.getSession().setAttribute("last_name", last_name);
			      		request.getSession().setAttribute("email_id", email_id);
			      		request.getSession().setAttribute("gender", gender);
			      		request.getSession().setAttribute("id", id);
			      		request.getSession().setAttribute("tstr_img_id", id);	
			      		
			      		
			      	} catch (JSONException e) {
			      		e.printStackTrace();
			      		throw new RuntimeException("ERROR in parsing FB graph data. " + e);
			      	}
			     }
		    }
		} catch (Exception e) {
			e.printStackTrace();	
			id = "234567";
		}
		
		try {			
			quizDetailsDto = this.adminService.findQuizDetailsDtoById(pageid);
			System.out.println("Bean Id ::::"+quizDetailsDto.getTnum_id());
			
			quizDetailsOptionDtoList = this.adminService.findQuizDetailsOptionDtoByQuizId(quizDetailsDto.getTnum_id());
			if(quizDetailsOptionDtoList != null && quizDetailsOptionDtoList.size()>0) {
				num = this.randInt(0, (quizDetailsOptionDtoList.size()-1));
			}
			System.out.println("Random Number :==========: "+num);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		List<QuizDetailsDto> quizDetailsDtoListOnlyThree = new ArrayList<QuizDetailsDto>();
		try {
			SimpleDateFormat sf = new SimpleDateFormat("ddMMyyhhmmss");
			newdate = sf.format(new Date());
			
			System.out.println("New Date Is ::::"+newdate);
			quizDetailsDtoListOnlyThree = this.adminService.getQuizDetailsDtoListOnlyThree(quizDetailsDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		String question = "";
		try {
			model.put("quizDetailsDto", quizDetailsDto);
			if(quizDetailsOptionDtoList != null && quizDetailsOptionDtoList.size()>0) {
				model.put("quizDetailsOptionDto", quizDetailsOptionDtoList.get(num));
			}
			
			question = quizDetailsDto.getTstr_headline();
			question = question.replace(" ", "_");	
			question = question.replace("_?", "");
			question = question.replace("?", "");
			
			try {
				if(id.equals("234567")) {					
				} else {
					tstr_image_url = tstr_image_url+"/"+question+"/pc"+id+".jpg";
					System.out.println("tstr_image_url :::::"+tstr_image_url);
					ImageUploader th = new ImageUploader();
					int data = th.uploadImage(id, "profilepic",tstr_image_url);
				}
	      		System.out.println("Program is running.....");
				
			} catch(Exception ex) {
				
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		request.getSession().setAttribute("tstr_img_id", id);
		request.getSession().setAttribute("tstr_image_url", tstr_image_url);
		
		model.put("question", question);
		model.put("first_name", first_name);
		model.put("last_name", last_name);
		model.put("tstr_img_id", id);
		model.put("tstr_image_url", tstr_image_url);
		model.put("tstr_date", newdate);
		model.put("list", quizDetailsDtoListOnlyThree);
		
		return new ModelAndView("showContentDetails", model);  
	} 
	
	
	@RequestMapping(value="/myForm", method = RequestMethod.POST)  
	public void myform(HttpServletRequest request, HttpServletResponse response){  
		 try {
			 System.out.println("===="+request.getParameter("img_val"));
			 String imgval = request.getParameter("img_val");
			 //String sourceData = imgval;
	
			 // tokenize the data
			 //String parts[] = sourceData.tokenize(",");
			 String imageString = imgval.replace("data:image/png;base64,", "");
	
			 ContentUploader uploader = new ContentUploader();
			 String app_id = (String) request.getSession().getAttribute("id");
			 
			 uploader.uploadImage(app_id, "dataimage", imageString, "date");
			 
			 response.setContentType("text/html");
			 response.setHeader("Cache-Control", "no-cache");
			 try {
				response.getWriter().write("success");
			 } catch(IOException e) {
				e.printStackTrace();
			 } 	
			 
			 /* // create a buffered image
			 BufferedImage image = null;
			 byte[] imageByte;
	
			 BASE64Decoder decoder = new BASE64Decoder();
			 imageByte = decoder.decodeBuffer(imageString);
			 ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			 image = ImageIO.read(bis);
			 bis.close();
	
			 // write the image to a file
			 File outputfile = new File("image.png");
			 ImageIO.write(image, "png", outputfile);
			 
			 FileOutputStream fos = new FileOutputStream(new File("D:/abc.png")); 
			 fos.write(imageByte); 
			 fos.close();*/
		 } catch(Exception ex) {
			 ex.printStackTrace();
		 }	
	}  
	
	
	public int randInt(int min, int max) {

		Random rand = new Random();
	    int randomNum = rand.nextInt((max - min) + 1) + min;

	    return randomNum;
	}
}
