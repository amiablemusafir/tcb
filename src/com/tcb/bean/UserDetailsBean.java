package com.tcb.bean;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

public class UserDetailsBean {
	
	private String username;
	private String password;
	private String messages;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	
	
}
