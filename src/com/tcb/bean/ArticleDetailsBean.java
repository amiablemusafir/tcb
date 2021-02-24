package com.tcb.bean;

public class ArticleDetailsBean {
	
	private Integer article_id;
	private String headline;
	private String image_url;
	private String share_image_url;
	private String sort_content;
	private String article_type;
	
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getSort_content() {
		return sort_content;
	}
	public void setSort_content(String sort_content) {
		this.sort_content = sort_content;
	}
	public String getArticle_type() {
		return article_type;
	}
	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}
	public String getShare_image_url() {
		return share_image_url;
	}
	public void setShare_image_url(String share_image_url) {
		this.share_image_url = share_image_url;
	}
	
}
