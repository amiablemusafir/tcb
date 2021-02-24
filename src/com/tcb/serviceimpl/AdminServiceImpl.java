package com.tcb.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tcb.dao.IAdmindao;
import com.tcb.model.AdminDetailDto;
import com.tcb.model.ArticleContentDetailsDto;
import com.tcb.model.ArticleDetailsDto;
import com.tcb.model.QuizDetailsDto;
import com.tcb.model.QuizDetailsOptionDto;
import com.tcb.model.UserQuizDetailsDto;
import com.tcb.service.IAdminService;

@Service("adminDetailsService")   
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)   
public class AdminServiceImpl implements IAdminService {

	@Autowired 
	public IAdmindao adminManagementDao;

	
	public List<AdminDetailDto> getAdminDetailDto(String user_id) throws Exception {
		return this.adminManagementDao.getAdminDetailDto(user_id);
	}

	
	
	public List<QuizDetailsDto> getQuizDetailsDtoList(QuizDetailsDto blogDetailsDto,int total, int pageStart) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getQuizDetailsDtoList(blogDetailsDto, total, pageStart);
	}
	
	public List<QuizDetailsDto> getQuizDetailsDtoListOnlyThree(QuizDetailsDto blogDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getQuizDetailsDtoListOnlyThree(blogDetailsDto);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateQuizDetailsDto(QuizDetailsDto quizDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Service ::::"+quizDetailsDto.getTstr_headline());
		this.adminManagementDao.updateQuizDetailsDto(quizDetailsDto);
	}
	
	public QuizDetailsDto findQuizDetailsDtoById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.findQuizDetailsDtoById(id);
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateQuizDetailsOptionDto(QuizDetailsOptionDto quizDetailsOptionDto) throws Exception {
		// TODO Auto-generated method stub
		this.adminManagementDao.updateQuizDetailsOptionDto(quizDetailsOptionDto);
	}
	
	public List<QuizDetailsOptionDto> findQuizDetailsOptionDtoByQuizId(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.findQuizDetailsOptionDtoByQuizId(id);
	}

	
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateArticleDetailsDto(ArticleDetailsDto articleDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		this.adminManagementDao.updateArticleDetailsDto(articleDetailsDto);
	}
	
	public ArticleDetailsDto findArticleDetailsDtoById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.findArticleDetailsDtoById(id);
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(Integer pageid) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoList(pageid);
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList() throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoList();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll() throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoListAll();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(String articlename) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoList(articlename);
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoPopularList() throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoPopularList();
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void updateArticleContentDetailsDto(ArticleContentDetailsDto articleContentDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		this.adminManagementDao.updateArticleContentDetailsDto(articleContentDetailsDto);
	}
	
	public List<ArticleContentDetailsDto> findArticleContentDetailsDtoByQuizId(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.findArticleContentDetailsDtoByQuizId(id);
	}
	
	public void updateUserQuizDetailsDto(UserQuizDetailsDto userQuizDetailsDto) throws Exception{
		this.adminManagementDao.updateUserQuizDetailsDto(userQuizDetailsDto);
	}
	
	public List<UserQuizDetailsDto> findUserQuizDetailsDto(String question, String app_id, String date) throws Exception {
		return this.adminManagementDao.findUserQuizDetailsDto(question, app_id, date);
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll(String articlename) throws Exception {
		// TODO Auto-generated method stub
		return this.adminManagementDao.getArticleDetailsDtoListAll(articlename);
	}
}
