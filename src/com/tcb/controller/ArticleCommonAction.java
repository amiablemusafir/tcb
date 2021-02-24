
package com.tcb.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;  
import java.io.ByteArrayInputStream;
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;

import com.tcb.bean.ArticleDetailsBean;
import com.tcb.bean.QuizDetailsBean;
import com.tcb.common.FTPLogger;
import com.tcb.common.Setup;
import com.tcb.model.ArticleContentDetailsDto;
import com.tcb.model.ArticleDetailsDto;
import com.tcb.model.QuizDetailsDto;
import com.tcb.model.QuizDetailsOptionDto;
import com.tcb.service.IAdminService;


@Controller
public class ArticleCommonAction {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private static final String UPLOAD_DIRECTORY ="/images";  
	 
	@Autowired  
	private IAdminService adminService; 
	
	@RequestMapping(value = "/termofservice")  
	public String termofservice() {  
		return "termofservice";  
	} 
	
	@RequestMapping(value = "/contactus")  
	public String contactus() {  
		return "contactus";  
	} 
	
	@RequestMapping(value = "/uploadimage")  
	public String uploadimage() {  
		return "uploadImage";  
	} 
	
	@RequestMapping(value = "/editArticlePage")  
	public String editArticlePage(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, BindingResult result, HttpServletRequest request, HttpServletResponse response) {   
		
		Map<String, Object> model = new HashMap<String, Object>();
		articleDetailsBean = new ArticleDetailsBean();
		model.put("message_details", "");
		model.put("articleDetailsBean", null);
		return "editArticle"; 
    } 
	
	@RequestMapping(value = "/privecypolicy")  
	public String privecypolicy() {  
		return "privecy-policy";  
	} 
	@RequestMapping(value="/index/{page}/{pageid}")  
	public ModelAndView index(@PathVariable String page,@PathVariable Integer pageid, HttpServletRequest request){  
		
		List<ArticleDetailsDto> articleDetailsDtoList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoArticleList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoPopularPostList = new ArrayList<ArticleDetailsDto>();
		
		String pagename = "Welcome to The Coder Boy";
		try {
			if(page.equals("home")) {
				articleDetailsDtoList = this.adminService.getArticleDetailsDtoList();
			} else {
				articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(page);
			}
			if(articleDetailsDtoList.size()<=0) {
				pageid = 1;
				articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(pageid);				
			}
			if(page.equals("home")) {
				articleDetailsDtoArticleList = this.adminService.getArticleDetailsDtoList();
			} else {
				articleDetailsDtoArticleList = this.adminService.getArticleDetailsDtoList(page);
			}
			articleDetailsDtoPopularPostList =  this.adminService.getArticleDetailsDtoPopularList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<ArticleDetailsDto> articleDetailsDtoArticleListAll = new ArrayList<ArticleDetailsDto>();
		try {
			articleDetailsDtoArticleListAll = this.adminService.getArticleDetailsDtoListAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Integer prev = 0;
		Integer next = 0;		
		Integer page1 = 0;
		Integer page2 = 0;
		Integer page3 = 0;
		Integer page4 = 0;
		Integer page5 = 0;
		
		System.out.println("================="+pageid);
		Integer currentPage = pageid;
		
		Integer temp1 = currentPage*3;
		Integer total = articleDetailsDtoArticleListAll.size();
		if(total>temp1) {
			if(pageid.equals(1)) {
				page1 = 1;page2 = 2;page3 = 3;page4 = 4;page5 = 5;next = 6;					
			} else {
				prev = pageid-1;page1 = pageid;page2 = pageid+1;page3 = page2+1;page4 = page3+1;page5 = page4+1;
				Integer temp = page5*3;
				if(total>temp) {
					next = page5+1;	
				}
			}
		} else {
			page1 = 1;page2 = 2;page3 = 3;page4 = 4;page5 = 5;next = 6;
		}
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("pagename", pagename);
		model.put("pageaction", page);
		model.put("articleDetailsDtoList", articleDetailsDtoList);
		model.put("articleDetailsDtoArticleList", articleDetailsDtoArticleList);
		model.put("articleDetailsDtoPopularPostList", articleDetailsDtoPopularPostList);
		model.put("next", next);
		model.put("prev", prev);
		model.put("page1", page1);
		model.put("page2", page2);
		model.put("page3", page3);
		model.put("page4", page4);
		model.put("page5", page5);
		model.put("currentPage", currentPage);
		
		return new ModelAndView("index", model);  
	} 
	
	@RequestMapping(value="/showArticle/{page}/{pageid}")  
	public ModelAndView showArticle(@PathVariable String page, @PathVariable Integer pageid, HttpServletRequest request){  
		
		List<ArticleDetailsDto> articleDetailsDtoList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoArticleList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoPopularPostList = new ArrayList<ArticleDetailsDto>();
		
		String pagename = "Welcome to The Coder Boy";
		
		if(page.equals("home")) {
			pagename = "Welcome to The Coder Boy";
		} else if(page.equals("article")) {
			pagename = "Home/Article";
		} else if(page.equals("trending")) {
			pagename = "Home/Trending";
		} else if(page.equals("entertainment")) {
			pagename = "Home/Entertainment";
		} else if(page.equals("lifestyle")) {
			pagename = "Home/Life Style";
		}
		
		try {
			articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(page);
			if(articleDetailsDtoList.size()<=0) {
				pageid = 1;
				articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(pageid);				
			}
			articleDetailsDtoArticleList = this.adminService.getArticleDetailsDtoList(page);
			articleDetailsDtoPopularPostList =  this.adminService.getArticleDetailsDtoPopularList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<ArticleDetailsDto> articleDetailsDtoArticleListAll = new ArrayList<ArticleDetailsDto>();
		try {
			articleDetailsDtoArticleListAll = this.adminService.getArticleDetailsDtoListAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Integer prev = 0;
		Integer next = 0;		
		Integer page1 = 0;
		Integer page2 = 0;
		Integer page3 = 0;
		Integer page4 = 0;
		Integer page5 = 0;
		
		System.out.println("================="+pageid);
		Integer currentPage = pageid;
		
		Integer temp1 = currentPage*3;
		Integer total = articleDetailsDtoArticleListAll.size();
		if(total>temp1) {
			if(pageid.equals(1)) {
				page1 = 1;page2 = 2;page3 = 3;page4 = 4;page5 = 5;next = 6;					
			} else {
				prev = pageid-1;page1 = pageid;page2 = pageid+1;page3 = page2+1;page4 = page3+1;page5 = page4+1;
				Integer temp = page5*3;
				if(total>temp) {
					next = page5+1;	
				}
			}
		} else {
			page1 = 1;page2 = 2;page3 = 3;page4 = 4;page5 = 5;next = 6;
		}
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("pagename", pagename);
		model.put("pageaction", page);
		model.put("articleDetailsDtoList", articleDetailsDtoList);
		model.put("articleDetailsDtoArticleList", articleDetailsDtoArticleList);
		model.put("articleDetailsDtoPopularPostList", articleDetailsDtoPopularPostList);
		model.put("next", next);
		model.put("prev", prev);
		model.put("page1", page1);
		model.put("page2", page2);
		model.put("page3", page3);
		model.put("page4", page4);
		model.put("page5", page5);
		model.put("currentPage", currentPage);
		
		return new ModelAndView("index", model);  
	} 
	
	@RequestMapping(value="/showArticleDetails/{pageid}")  
	public ModelAndView showArticleDetails(@PathVariable Integer pageid, HttpServletRequest request){  
		
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		
		List<ArticleContentDetailsDto> articleContentDetailsDtoList = new ArrayList<ArticleContentDetailsDto>();
		
		List<ArticleDetailsDto> articleDetailsDtoList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoArticleList = new ArrayList<ArticleDetailsDto>();
		List<ArticleDetailsDto> articleDetailsDtoPopularPostList = new ArrayList<ArticleDetailsDto>();
		
		try {
			articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(pageid);
			System.out.println("1================="+articleDetailsDtoList.size());
			if(articleDetailsDtoList.size()<=0) {
				articleDetailsDtoList = this.adminService.getArticleDetailsDtoList(1);	
				System.out.println("2================="+articleDetailsDtoList.size());
				
			}
			articleDetailsDtoPopularPostList =  this.adminService.getArticleDetailsDtoPopularList();
			articleContentDetailsDtoList =  this.adminService.findArticleContentDetailsDtoByQuizId(pageid);
			articleDetailsDto = this.adminService.findArticleDetailsDtoById(pageid);
			articleDetailsDtoArticleList = this.adminService.getArticleDetailsDtoList(articleDetailsDto.getTstr_article_type());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String pagename = "Welcome to The Coder Boy";
		if(articleDetailsDto != null) {
			if(articleDetailsDto.getTstr_article_type() != null) {
				if(articleDetailsDto.getTstr_article_type().equals("home")) {
					pagename = "Welcome to The Coder Boy";
				} else if(articleDetailsDto.getTstr_article_type().equals("article")) {
					pagename = "Home/Article";
				} else if(articleDetailsDto.getTstr_article_type().equals("trending")) {
					pagename = "Home/Trending";
				} else if(articleDetailsDto.getTstr_article_type().equals("entertainment")) {
					pagename = "Home/Entertainment";
				} else if(articleDetailsDto.getTstr_article_type().equals("lifestyle")) {
					pagename = "Home/LifeStyle";
				}
			}
		}
		
		Integer next = pageid+1;
		Integer prev = pageid-1;
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("pagename", pagename);
		model.put("next", next);
		model.put("prev", prev);
		model.put("articleDetailsDtoList", articleDetailsDtoList);
		model.put("articleDetailsDtoArticleList", articleDetailsDtoArticleList);
		model.put("articleDetailsDtoPopularPostList", articleDetailsDtoPopularPostList);
		model.put("articleContentDetailsDtoList", articleContentDetailsDtoList);
		model.put("articleDetailsDto", articleDetailsDto);
		
		return new ModelAndView("showArticleContent", model);  
	} 
	
	@RequestMapping("/createQuizPage")  
    public ModelAndView createQuizPage(@ModelAttribute("command")QuizDetailsBean quizDetailsBean, BindingResult result, HttpServletRequest request, HttpServletResponse response) {   
		
		Map<String, Object> model = new HashMap<String, Object>();
		quizDetailsBean = new QuizDetailsBean();
		model.put("message_details", "");
		model.put("quizDetailsDtoBean", null);
		return new ModelAndView("createQuiz", model); 
    } 
	
	@RequestMapping("/createArticlePage")  
    public ModelAndView createArticlePage(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, BindingResult result, HttpServletRequest request, HttpServletResponse response) {   
		
		Map<String, Object> model = new HashMap<String, Object>();
		articleDetailsBean = new ArticleDetailsBean();
		model.put("message_details", "");
		model.put("articleDetailsBean", null);
		return new ModelAndView("createArticle", model); 
    } 
	
	@RequestMapping(value = "/save_quiz_detail", method = RequestMethod.POST)   
	public ModelAndView saveQuizDetail(@ModelAttribute("command")QuizDetailsBean quizDetailsBean, BindingResult result, HttpServletRequest request, SessionStatus status) {   
		
		String loger = "";
		loger = loger.concat(new Date().toString());
		
		QuizDetailsDto quizDetailsDto = new QuizDetailsDto();
		
		quizDetailsDto.setTstr_headline(quizDetailsBean.getHeadline());
		quizDetailsDto.setTstr_image_url(quizDetailsBean.getImage_url());
		quizDetailsDto.setTstr_image_bg_url(quizDetailsBean.getImage_bg_url());
		quizDetailsDto.setTstr_content(quizDetailsBean.getContent());
		quizDetailsDto.setTnum_is_active(1);
		quizDetailsDto.setTdt_entry_date(new Date());
		
		try {
			this.adminService.updateQuizDetailsDto(quizDetailsDto);
			String option[] = request.getParameterValues("option");
			for(int i = 0; i<option.length; i++) {
				QuizDetailsOptionDto detailsOptionDto = new QuizDetailsOptionDto();
				detailsOptionDto.setQuizDetailsDto(quizDetailsDto);
				detailsOptionDto.setTdt_entry_date(new Date());
				detailsOptionDto.setTnum_is_active(1);
				detailsOptionDto.setTstr_option(option[i]);
				
				this.adminService.updateQuizDetailsOptionDto(detailsOptionDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			loger = loger.concat("Database Exception On Save Quiz ::"+e);			
		}	
		loger = loger.concat("Hello Sumit");	
		System.out.println("Hello Sumit");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("message_details", "Data insert successfully");
		model.put("quizDetailsDtoBean", null);

		FTPLogger.logUpload(loger);
		status.setComplete();
		return new ModelAndView("createQuiz", model);     
	} 
	
	@RequestMapping(value = "/save_article_detail", method = RequestMethod.POST)   
	public ModelAndView saveArticleDetail(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, BindingResult result, HttpServletRequest request, SessionStatus status) {   
		
		String loger = "";
		loger = loger.concat(new Date().toString());
		
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		
		articleDetailsDto.setTstr_headline(articleDetailsBean.getHeadline());
		articleDetailsDto.setTstr_image_url(articleDetailsBean.getImage_url());
		articleDetailsDto.setTstr_share_image_url(articleDetailsBean.getShare_image_url());
		articleDetailsDto.setTstr_sort_content(articleDetailsBean.getSort_content());
		articleDetailsDto.setTstr_article_type(articleDetailsBean.getArticle_type());		
		articleDetailsDto.setTnum_is_active(1);
		articleDetailsDto.setTdt_entry_date(new Date());
		
		SimpleDateFormat sf = new SimpleDateFormat("MMM");
		String mmm = sf.format(new Date());
		articleDetailsDto.setTdt_mmm(mmm);
		
		SimpleDateFormat sfd = new SimpleDateFormat("dd");
		String dd = sfd.format(new Date());
		articleDetailsDto.setTdt_dd(dd);
		
		
		try {
			this.adminService.updateArticleDetailsDto(articleDetailsDto);
			String content[] = request.getParameterValues("content");
			String sequence[] = request.getParameterValues("sequence");
			for(int i = 0; i<content.length; i++) {
				ArticleContentDetailsDto contentDetailsDto = new ArticleContentDetailsDto();
				contentDetailsDto.setArticleDetailsDto(articleDetailsDto);
				contentDetailsDto.setTdt_entry_date(new Date());
				contentDetailsDto.setTnum_is_active(1);
				contentDetailsDto.setTstr_content(content[i]);
				contentDetailsDto.setTstr_sequence(sequence[i]);
				
				this.adminService.updateArticleContentDetailsDto(contentDetailsDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			loger = loger.concat("Database Exception On Save Quiz ::"+e);			
		}	
		loger = loger.concat("Hello Sumit");	
		System.out.println("Hello Sumit");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("message_details", "Data insert successfully");
		model.put("articleDetailsDto", null);

		FTPLogger.logUpload(loger);
		status.setComplete();
		return new ModelAndView("createArticle", model);     
	} 
	
	@RequestMapping("/showArticlePage/{articletype}")  
    public ModelAndView showArticlePage(@PathVariable String articletype, HttpServletRequest request) {   
		
		Map<String, Object> model = new HashMap<String, Object>();
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		//Get Article according to page
		
		model.put("message_details", "");
		model.put("articleDetailsBean", null);
		return new ModelAndView("createArticle", model); 
    } 
	
	@RequestMapping(value="saveImageFile",method=RequestMethod.POST)  
	public ModelAndView saveimage(@RequestParam CommonsMultipartFile file, HttpSession session) throws Exception{  
		 
		String server = Setup.HOST_NAME;
        int port = Setup.PORT;
        String user = Setup.USERNAME;
        String pass = Setup.PASSWORD;
 
        FTPClient ftpClient = new FTPClient();
        try {
        	ftpClient.connect(server, port);
            ftpClient.login(user, pass);
            ftpClient.enterLocalPassiveMode();
 
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            String filename = file.getOriginalFilename();  
		  
            // create a buffered image
  			BufferedImage image = null;
  			byte[] imageByte;
  	
  			imageByte = file.getBytes();
  			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
  			image = ImageIO.read(bis);
  			bis.close();
  	
  			// write the image to a file
  			File outputfile = new File(filename);
  			ImageIO.write(image, "jpg", outputfile);
  			 
  			String firstRemoteFile = "/public_html/articleimg/"+filename;
			OutputStream outputStream = ftpClient.storeFileStream(firstRemoteFile);
  			outputStream.write(imageByte);
  			outputStream.close();
  			System.out.println("Start uploading file");
		            
		    boolean completed = ftpClient.completePendingCommand();
		    if (completed) {
		         System.out.println("The file is uploaded successfully.");
		    } 
        } catch (IOException ex) {
	        System.out.println("Error: " + ex.getMessage());
	        ex.printStackTrace();
	    } finally {
	        try {
	            if (ftpClient.isConnected()) {
	               ftpClient.logout();
	               ftpClient.disconnect();
	            }
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return new ModelAndView("uploadImage","filesuccess","File successfully saved!");  
	}
	
	
	@RequestMapping(value = "/search_article_detail", method = RequestMethod.POST)   
	public ModelAndView searchArticleDetail(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, BindingResult result, HttpServletRequest request, SessionStatus status) {   
		
		List<ArticleDetailsDto> articleDetailsDtoList = new ArrayList<ArticleDetailsDto>();
		try {
			System.out.println(articleDetailsBean.getArticle_type());
			articleDetailsDtoList = this.adminService.getArticleDetailsDtoListAll(articleDetailsBean.getArticle_type());			
		} catch (Exception e) {
			e.printStackTrace();			
		}	
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("articleDetailsDtoList", articleDetailsDtoList);

		return new ModelAndView("editArticle", model);     
	} 
	
	@RequestMapping(value="/deleteArticleDetails/{pageid}")  
	public ModelAndView deleteArticleDetails(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, @PathVariable Integer pageid, HttpServletRequest request){  
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		List<ArticleDetailsDto> articleDetailsDtoList = new ArrayList<ArticleDetailsDto>();
		try {		
			articleDetailsDto = this.adminService.findArticleDetailsDtoById(pageid);
			articleDetailsDto.setTnum_is_active(0);
				
			this.adminService.updateArticleDetailsDto(articleDetailsDto);
		} catch(Exception ex) {
			ex.printStackTrace();
		}		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("message_details", "Content Deleted Successfully");
		return new ModelAndView("editArticle", model);  
	} 
	
	@RequestMapping(value="/editArticleDetails/{pageid}")  
	public ModelAndView editArticleDetails(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, @PathVariable Integer pageid, HttpServletRequest request){  
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		List<ArticleContentDetailsDto> articleContentDetailsDtoList = new ArrayList<ArticleContentDetailsDto>();
		try {		
			articleDetailsDto = this.adminService.findArticleDetailsDtoById(pageid);
			
			articleDetailsBean.setArticle_id(articleDetailsDto.getTnum_article_id());
			articleDetailsBean.setHeadline(articleDetailsDto.getTstr_headline());
			articleDetailsBean.setImage_url(articleDetailsDto.getTstr_image_url());
			articleDetailsBean.setShare_image_url(articleDetailsDto.getTstr_share_image_url());
			articleDetailsBean.setSort_content(articleDetailsDto.getTstr_sort_content());
			articleDetailsBean.setArticle_type(articleDetailsDto.getTstr_article_type());
			
			articleContentDetailsDtoList =  this.adminService.findArticleContentDetailsDtoByQuizId(articleDetailsDto.getTnum_article_id());
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("articleDetailsBean", articleDetailsBean);
		model.put("articleDetailsDto", articleDetailsDto);
		model.put("articleContentDetailsDtoList", articleContentDetailsDtoList);
		return new ModelAndView("editArticleDetails", model);  
	} 
	
	@RequestMapping(value = "/update_article_detail", method = RequestMethod.POST)   
	public ModelAndView updateArticleDetail(@ModelAttribute("command")ArticleDetailsBean articleDetailsBean, BindingResult result, HttpServletRequest request, SessionStatus status) {   
		
		ArticleDetailsDto articleDetailsDto = new ArticleDetailsDto();
		
		articleDetailsDto.setTnum_article_id(articleDetailsBean.getArticle_id());
		articleDetailsDto.setTstr_headline(articleDetailsBean.getHeadline());
		articleDetailsDto.setTstr_image_url(articleDetailsBean.getImage_url());
		articleDetailsDto.setTstr_share_image_url(articleDetailsBean.getShare_image_url());
		articleDetailsDto.setTstr_sort_content(articleDetailsBean.getSort_content());
		articleDetailsDto.setTstr_article_type(articleDetailsBean.getArticle_type());		
		articleDetailsDto.setTnum_is_active(1);
		articleDetailsDto.setTdt_entry_date(new Date());
		
		SimpleDateFormat sf = new SimpleDateFormat("MMM");
		String mmm = sf.format(new Date());
		articleDetailsDto.setTdt_mmm(mmm);
		
		SimpleDateFormat sfd = new SimpleDateFormat("dd");
		String dd = sfd.format(new Date());
		articleDetailsDto.setTdt_dd(dd);		
		
		try {
			this.adminService.updateArticleDetailsDto(articleDetailsDto);
			String content[] = request.getParameterValues("content");
			String sequence[] = request.getParameterValues("sequence");
			String article_content_id[] = request.getParameterValues("article_content_id");
			for(int i = 0; i<content.length; i++) {
				ArticleContentDetailsDto contentDetailsDto = new ArticleContentDetailsDto();
				contentDetailsDto.setArticleDetailsDto(articleDetailsDto);
				if(i < article_content_id.length) {
					contentDetailsDto.setTnum_article_content_id(Integer.parseInt(article_content_id[i]));
				}
				contentDetailsDto.setTdt_entry_date(new Date());
				contentDetailsDto.setTnum_is_active(1);
				contentDetailsDto.setTstr_content(content[i]);
				contentDetailsDto.setTstr_sequence(sequence[i]);
				
				this.adminService.updateArticleContentDetailsDto(contentDetailsDto);
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}	
		System.out.println("Hello Sumit");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("message_details", "Content Updated Successfully");
		return new ModelAndView("editArticle", model);      
	} 
}
