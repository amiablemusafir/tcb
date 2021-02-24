package com.tcb.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;  

import org.hibernate.annotations.Proxy;
@Entity @Table(name = "tcb_user_quiz_details") @Proxy(lazy=false)

public class UserQuizDetailsDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_id") public Integer tnum_id;
	@Column(name = "tbl_ajaxdata") public String tbl_ajaxdata;
	@Column(name = "tstr_question") public String tstr_question;
	@Column(name = "tstr_app_id") public String tstr_app_id;
	@Column(name = "tstr_date") public String tstr_date;
	@Column(name = "tnum_is_active") public Integer tnum_is_active;
	@Column(name = "tdt_entry_date") public Date tdt_entry_date;
	
	public Integer getTnum_id() {
		return tnum_id;
	}
	public void setTnum_id(Integer tnum_id) {
		this.tnum_id = tnum_id;
	}
	public String getTbl_ajaxdata() {
		return tbl_ajaxdata;
	}
	public void setTbl_ajaxdata(String tbl_ajaxdata) {
		this.tbl_ajaxdata = tbl_ajaxdata;
	}
	public String getTstr_question() {
		return tstr_question;
	}
	public void setTstr_question(String tstr_question) {
		this.tstr_question = tstr_question;
	}
	public String getTstr_app_id() {
		return tstr_app_id;
	}
	public void setTstr_app_id(String tstr_app_id) {
		this.tstr_app_id = tstr_app_id;
	}
	public String getTstr_date() {
		return tstr_date;
	}
	public void setTstr_date(String tstr_date) {
		this.tstr_date = tstr_date;
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
