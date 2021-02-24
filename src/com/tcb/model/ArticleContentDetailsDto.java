package com.tcb.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;  
import org.hibernate.annotations.Proxy;

@Entity @Table(name = "tcb_article_content_details_mst") @Proxy(lazy=false)

public class ArticleContentDetailsDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_article_content_id") public Integer tnum_article_content_id;
	
	@ManyToOne
	@JoinColumn(name = "inum_article_id") public ArticleDetailsDto articleDetailsDto;
	@Column(name = "tstr_content") public String tstr_content;
	@Column(name = "tstr_sequence") public String tstr_sequence;
	@Column(name = "tnum_is_active") public Integer tnum_is_active;
	@Column(name = "tdt_entry_date") public Date tdt_entry_date;
	
	public String getTstr_sequence() {
		return tstr_sequence;
	}
	public void setTstr_sequence(String tstr_sequence) {
		this.tstr_sequence = tstr_sequence;
	}
	public Integer getTnum_article_content_id() {
		return tnum_article_content_id;
	}
	public void setTnum_article_content_id(Integer tnum_article_content_id) {
		this.tnum_article_content_id = tnum_article_content_id;
	}
	public ArticleDetailsDto getArticleDetailsDto() {
		return articleDetailsDto;
	}
	public void setArticleDetailsDto(ArticleDetailsDto articleDetailsDto) {
		this.articleDetailsDto = articleDetailsDto;
	}
	public String getTstr_content() {
		return tstr_content;
	}
	public void setTstr_content(String tstr_content) {
		this.tstr_content = tstr_content;
	}
	public Integer getTnum_is_active() {
		return tnum_is_active;
	}
	public void setTnum_is_active(Integer tnum_is_active) {
		this.tnum_is_active = tnum_is_active;
	}
	public Date getTdt_entry_date() {
		return tdt_entry_date;
	}
	public void setTdt_entry_date(Date tdt_entry_date) {
		this.tdt_entry_date = tdt_entry_date;
	}
	
}
