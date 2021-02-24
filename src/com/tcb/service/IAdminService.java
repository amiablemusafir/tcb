package com.tcb.service;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tcb.model.AdminDetailDto;
import com.tcb.model.ArticleContentDetailsDto;
import com.tcb.model.ArticleDetailsDto;
import com.tcb.model.QuizDetailsDto;
import com.tcb.model.QuizDetailsOptionDto;
import com.tcb.model.UserQuizDetailsDto;


public interface IAdminService {

	public List<AdminDetailDto> getAdminDetailDto(String user_id) throws Exception;
	public List<QuizDetailsDto> getQuizDetailsDtoList(QuizDetailsDto detailsDto,int total, int pageStart) throws Exception;
	public List<QuizDetailsDto> getQuizDetailsDtoListOnlyThree(QuizDetailsDto detailsDto) throws Exception;
	
	public void updateQuizDetailsDto(QuizDetailsDto quizDetailsDto) throws Exception;
	public QuizDetailsDto findQuizDetailsDtoById(Integer id) throws Exception;	
	public void updateQuizDetailsOptionDto(QuizDetailsOptionDto quizDetailsOptionDto) throws Exception;
	public List<QuizDetailsOptionDto> findQuizDetailsOptionDtoByQuizId(Integer id) throws Exception;	
	
	public void updateArticleDetailsDto(ArticleDetailsDto ArticleDetailsDto) throws Exception;
	public ArticleDetailsDto findArticleDetailsDtoById(Integer id) throws Exception;
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll() throws Exception;	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(Integer pageid) throws Exception;	
	public List<ArticleDetailsDto> getArticleDetailsDtoList() throws Exception;	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(String articlename) throws Exception;	
	public List<ArticleDetailsDto> getArticleDetailsDtoPopularList() throws Exception;	
	
	public void updateArticleContentDetailsDto(ArticleContentDetailsDto articleContentDetailsDto) throws Exception;
	public List<ArticleContentDetailsDto> findArticleContentDetailsDtoByQuizId(Integer id) throws Exception;	

	public void updateUserQuizDetailsDto(UserQuizDetailsDto userQuizDetailsDto) throws Exception;
	public List<UserQuizDetailsDto> findUserQuizDetailsDto(String question, String app_id, String date) throws Exception;	
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll(String articlename) throws Exception;
}
