package com.tcb.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;  

import org.hibernate.annotations.Proxy;
@Entity @Table(name = "tcb_article_details_mst") @Proxy(lazy=false)

public class ArticleDetailsDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_article_id") public Integer tnum_article_id;
	@Column(name = "tstr_headline") public String tstr_headline;
	@Column(name = "tstr_image_url") public String tstr_image_url;
	@Column(name = "tstr_share_image_url") public String tstr_share_image_url;
	@Column(name = "tstr_sort_content") public String tstr_sort_content;
	@Column(name = "tdt_dd") public String tdt_dd;
	@Column(name = "tdt_mmm") public String tdt_mmm;
	@Column(name = "tstr_article_type") public String tstr_article_type;
	@Column(name = "tnum_is_active") public Integer tnum_is_active;
	@Column(name = "tdt_entry_date") public Date tdt_entry_date;
	
	public Integer getTnum_article_id() {
		return tnum_article_id;
	}
	public void setTnum_article_id(Integer tnum_article_id) {
		this.tnum_article_id = tnum_article_id;
	}
	public String getTstr_headline() {
		return tstr_headline;
	}
	public void setTstr_headline(String tstr_headline) {
		this.tstr_headline = tstr_headline;
	}
	public String getTstr_image_url() {
		return tstr_image_url;
	}
	public void setTstr_image_url(String tstr_image_url) {
		this.tstr_image_url = tstr_image_url;
	}
	public String getTstr_share_image_url() {
		return tstr_share_image_url;
	}
	public void setTstr_share_image_url(String tstr_share_image_url) {
		this.tstr_share_image_url = tstr_share_image_url;
	}
	public String getTstr_sort_content() {
		return tstr_sort_content;
	}
	public void setTstr_sort_content(String tstr_sort_content) {
		this.tstr_sort_content = tstr_sort_content;
	}
	public String getTstr_article_type() {
		return tstr_article_type;
	}
	public void setTstr_article_type(String tstr_article_type) {
		this.tstr_article_type = tstr_article_type;
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
	public String getTdt_dd() {
		return tdt_dd;
	}
	public void setTdt_dd(String tdt_dd) {
		this.tdt_dd = tdt_dd;
	}
	public String getTdt_mmm() {
		return tdt_mmm;
	}
	public void setTdt_mmm(String tdt_mmm) {
		this.tdt_mmm = tdt_mmm;
	}   
	
}
