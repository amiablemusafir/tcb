package com.tcb.model;

import java.io.Serializable;
import javax.persistence.*;  

import org.hibernate.annotations.Proxy;
@Entity @Table(name = "tcb_admin_user_mst") @Proxy(lazy=false)

public class AdminDetailDto implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)    
	@Column(name = "tnum_user_id") public Integer tnum_user_id;
	@Column(name = "tstr_username") public String tstr_username;
	@Column(name = "tstr_password") public String tstr_password;
	public Integer getTnum_user_id() {
		return tnum_user_id;
	}
	public void setTnum_user_id(Integer tnum_user_id) {
		this.tnum_user_id = tnum_user_id;
	}
	public String getTstr_username() {
		return tstr_username;
	}
	public void setTstr_username(String tstr_username) {
		this.tstr_username = tstr_username;
	}
	public String getTstr_password() {
		return tstr_password;
	}
	public void setTstr_password(String tstr_password) {
		this.tstr_password = tstr_password;
	}
	    
}
