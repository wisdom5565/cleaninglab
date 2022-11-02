package com.koreait.cleaninglab.faq.dao;

public class FaqDTO {
	private String etctype;
	private String title;
	private String content;
	private String regdate;
	private String enddate;
	
	public FaqDTO() {}
	
	public String getEtctype() {
		return etctype;
	}
	public void setEtctype(String etctype) {
		this.etctype = etctype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
}
