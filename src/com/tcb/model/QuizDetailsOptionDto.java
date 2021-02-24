package com.tcb.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;  
import org.hibernate.annotations.Proxy;

@Entity @Table(name = "tcb_quiz_details_option_mst") @Proxy(lazy=false)

public class QuizDetailsOptionDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_id") public Integer tnum_id;
	
	@ManyToOne
	@JoinColumn(name = "inum_quiz_id") public QuizDetailsDto quizDetailsDto;
	@Column(name = "tstr_option") public String tstr_option;
	@Column(name = "tnum_is_active") public Integer tnum_is_active;
	@Column(name = "tdt_entry_date") public Date tdt_entry_date;
	
	public Integer getTnum_id() {
		return tnum_id;
	}
	public void setTnum_id(Integer tnum_id) {
		this.tnum_id = tnum_id;
	}
	public QuizDetailsDto getQuizDetailsDto() {
		return quizDetailsDto;
	}
	public void setQuizDetailsDto(QuizDetailsDto quizDetailsDto) {
		this.quizDetailsDto = quizDetailsDto;
	}
	public String getTstr_option() {
		return tstr_option;
	}
	public void setTstr_option(String tstr_option) {
		this.tstr_option = tstr_option;
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
