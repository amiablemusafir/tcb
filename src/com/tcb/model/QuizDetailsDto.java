package com.tcb.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;  

import org.hibernate.annotations.Proxy;
@Entity @Table(name = "tcb_quiz_details_mst") @Proxy(lazy=false)

public class QuizDetailsDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_id") public Integer tnum_id;
	@Column(name = "tstr_headline") public String tstr_headline;
	@Column(name = "tstr_image_url") public String tstr_image_url;
	@Column(name = "tstr_image_bg_url") public String tstr_image_bg_url;
	@Column(name = "tstr_content") public String tstr_content;
	@Column(name = "tnum_is_active") public Integer tnum_is_active;
	@Column(name = "tdt_entry_date") public Date tdt_entry_date;
	
	public Integer getTnum_id() {
		return tnum_id;
	}
	public void setTnum_id(Integer tnum_id) {
		this.tnum_id = tnum_id;
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
	public String getTstr_image_bg_url() {
		return tstr_image_bg_url;
	}
	public void setTstr_image_bg_url(String tstr_image_bg_url) {
		this.tstr_image_bg_url = tstr_image_bg_url;
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
