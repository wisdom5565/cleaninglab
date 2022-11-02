package com.koreait.cleaninglab.mypage.dao;

public class MyReservationDTO {
	private int servicenum;
	private String redate;
	private String retype;
	private String state;
	private String name;
	private String useremail;

	public MyReservationDTO() {}

	public int getServicenum() {
		return servicenum;
	}

	public void setServicenum(int servicenum) {
		this.servicenum = servicenum;
	}

	public String getRetype() {
		return retype;
	}

	public void setRetype(String retype) {
		this.retype = retype;
	}

	public String getRedate() {
		return redate;
	}

	public void setRedate(String redate) {
		this.redate = redate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
}
