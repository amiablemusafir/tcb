package com.tcb.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tcb.common.FTPLogger;
import com.tcb.dao.IAdmindao;
import com.tcb.model.AdminDetailDto;
import com.tcb.model.ArticleContentDetailsDto;
import com.tcb.model.ArticleDetailsDto;
import com.tcb.model.QuizDetailsDto;
import com.tcb.model.QuizDetailsOptionDto;
import com.tcb.model.UserQuizDetailsDto;

@Repository("adminDetailsDao")  
public class AdminDaoImpl implements IAdmindao {
	
	private HibernateTemplate hibernateTemplate;
		
	@Autowired  
	private SessionFactory sessionFactory; 
	    
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public List<AdminDetailDto> getAdminDetailDto(String user_id) throws Exception {
		
		List<AdminDetailDto> adminList = null;		
		String query = "from AdminDetailDto as adminDetailDto where adminDetailDto.tstr_username = '"+user_id+"'";
		adminList = sessionFactory.getCurrentSession().find(query);
		return adminList;
	}	
	
	
	@Override
	public List<QuizDetailsDto> getQuizDetailsDtoList(QuizDetailsDto detailsDto,int total, int pageStart) throws Exception {
		// TODO Auto-generated method stub
		//String queryStringName = "from QuizDetailsDto as details where details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC";
		List<QuizDetailsDto> list = new ArrayList<QuizDetailsDto>();
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from QuizDetailsDto as details where details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC");
			pageStart = pageStart-1;
			query.setFirstResult(pageStart);
			query.setMaxResults(total);	 
			return (List<QuizDetailsDto>) query.list();	
		} catch(Exception e) {
			FTPLogger.logUpload("Inside DAO getQuizDetailsDtoList Impl Error"+e);
		}
		return list;		
	}
	
	@Override
	public List<QuizDetailsDto> getQuizDetailsDtoListOnlyThree(QuizDetailsDto detailsDto) throws Exception {
		// TODO Auto-generated method stub
		//String queryStringName = "from QuizDetailsDto as details where details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC LIMIT 3";
		
		Query query = sessionFactory.getCurrentSession().createQuery("from QuizDetailsDto as details where details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC");
		query.setFirstResult(detailsDto.getTnum_id());
		query.setMaxResults(3);	 
		
		List<QuizDetailsDto> detailsDtos = new ArrayList<QuizDetailsDto>();
		detailsDtos = (List<QuizDetailsDto>) query.list();	
		if(!(detailsDtos != null && detailsDtos.size()>0)) {
			query = sessionFactory.getCurrentSession().createQuery("from QuizDetailsDto as details where details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC");
			query.setMaxResults(3);	
		}
		return (List<QuizDetailsDto>) query.list();	
        
	}

	@Override
	public void updateQuizDetailsDto(QuizDetailsDto quizDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		try {
		sessionFactory.getCurrentSession().saveOrUpdate(quizDetailsDto);
		} catch(Exception e) {
			e.printStackTrace();
			FTPLogger.logUpload("Inside DAO updateQuizDetailsDto Impl Error"+e);
		}
	}

	@Override
	public QuizDetailsDto findQuizDetailsDtoById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		QuizDetailsDto dto = new QuizDetailsDto();
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from QuizDetailsDto as details where details.tnum_id = "+id);
			if(query.list() != null && query.list().size()>0) {
				dto = (QuizDetailsDto) query.list().get(0);
			}
		} catch (RuntimeException re) {
			throw re;
		}
		return dto;
	}	
	
	@Override
	public void updateQuizDetailsOptionDto(QuizDetailsOptionDto quizDetailsOptionDto) throws Exception {
		sessionFactory.getCurrentSession().saveOrUpdate(quizDetailsOptionDto);
	}
	
	@Override
	public List<QuizDetailsOptionDto> findQuizDetailsOptionDtoByQuizId(Integer id) throws Exception {
		// TODO Auto-generated method stub
		String queryName = "from QuizDetailsOptionDto as details where details.quizDetailsDto.tnum_id = "+id+" and details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC";
		return sessionFactory.getCurrentSession().find(queryName);	
	}
	
	
	

	@Override
	public void updateArticleDetailsDto(ArticleDetailsDto articleDetailsDto) throws Exception {
		// TODO Auto-generated method stub
		try {
		sessionFactory.getCurrentSession().saveOrUpdate(articleDetailsDto);
		} catch(Exception e) {
			e.printStackTrace();
			FTPLogger.logUpload("Inside DAO updateQuizDetailsDto Impl Error"+e);
		}
	}

	@Override
	public ArticleDetailsDto findArticleDetailsDtoById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		ArticleDetailsDto dto = new ArticleDetailsDto();
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as details where details.tnum_article_id = "+id);
			if(query.list() != null && query.list().size()>0) {
				dto = (ArticleDetailsDto) query.list().get(0);
			}
		} catch (RuntimeException re) {
			throw re;
		}
		return dto;
	}	
	
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll() throws Exception {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto");
		return (List<ArticleDetailsDto>) query.list();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(Integer pageid) throws Exception {
		
		Integer id = pageid+3;
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto where detailDto.tnum_is_active = 1 ORDER BY detailDto.tdt_entry_date DESC");
		query.setFirstResult(id);
		query.setMaxResults(3);	 
		
		return (List<ArticleDetailsDto>) query.list();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList() throws Exception {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto where detailDto.tnum_is_active = 1 ORDER BY detailDto.tdt_entry_date DESC");
		query.setMaxResults(3);	 
		
		return (List<ArticleDetailsDto>) query.list();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoList(String articlename) throws Exception {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto where detailDto.tnum_is_active = 1 and  detailDto.tstr_article_type = '"+articlename+"' ORDER BY detailDto.tdt_entry_date DESC");
		query.setMaxResults(3);	
		
		return (List<ArticleDetailsDto>) query.list();
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoPopularList() throws Exception {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto where detailDto.tnum_is_active = 2");
		query.setMaxResults(4);	
		
		return (List<ArticleDetailsDto>) query.list();
	}
	
	@Override
	public void updateArticleContentDetailsDto(ArticleContentDetailsDto articleContentDetailsDto) throws Exception {
		sessionFactory.getCurrentSession().saveOrUpdate(articleContentDetailsDto);
	}
	
	@Override
	public List<ArticleContentDetailsDto> findArticleContentDetailsDtoByQuizId(Integer id) throws Exception {
		// TODO Auto-generated method stub
		String queryName = "from ArticleContentDetailsDto as details where details.articleDetailsDto.tnum_article_id = "+id+" and details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC";
		return sessionFactory.getCurrentSession().find(queryName);	
	}
	
	public void updateUserQuizDetailsDto(UserQuizDetailsDto userQuizDetailsDto) throws Exception{
		sessionFactory.getCurrentSession().save(userQuizDetailsDto);
	}
	
	public List<UserQuizDetailsDto> findUserQuizDetailsDto(String question, String app_id, String date) throws Exception {
		String queryName = "from UserQuizDetailsDto as details where details.tstr_question = '"+question+"' and details.tstr_app_id = '"+app_id+"' and details.tstr_date = '"+date+"' and details.tnum_is_active = 1 ORDER BY details.tdt_entry_date DESC";
		return sessionFactory.getCurrentSession().find(queryName);	
	}
	
	public List<ArticleDetailsDto> getArticleDetailsDtoListAll(String articlename) throws Exception {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from ArticleDetailsDto as detailDto where detailDto.tnum_is_active = 1 and  detailDto.tstr_article_type = '"+articlename+"' ORDER BY detailDto.tdt_entry_date DESC");
		return (List<ArticleDetailsDto>) query.list();
	}
	

}
