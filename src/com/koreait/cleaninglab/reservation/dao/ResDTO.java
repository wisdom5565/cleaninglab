package com.koreait.cleaninglab.reservation.dao;

public class ResDTO {
	
	private int renum,addrnum,servicecnt;
	private String retype,redate,retime,email,servicearea,notice,trashway,paystate,cadate,price,runtime;
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public int getAddrnum() {
		return addrnum;
	}
	public void setAddrnum(int addrnum) {
		this.addrnum = addrnum;
	}
	public int getServicecnt() {
		return servicecnt;
	}
	public void setServicecnt(int servicecnt) {
		this.servicecnt = servicecnt;
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
	public String getRetime() {
		return retime;
	}
	public void setRetime(String retime) {
		this.retime = retime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getServicearea() {
		return servicearea;
	}
	public void setServicearea(String servicearea) {
		this.servicearea = servicearea;
	}
	public String getTrashway() {
		return trashway;
	}
	public void setTrashway(String trashway) {
		this.trashway = trashway;
	}
	public String getPaystate() {
		return paystate;
	}
	public void setPaystate(String paystate) {
		this.paystate = paystate;
	}
	public String getCadate() {
		return cadate;
	}
	public void setCadate(String cadate) {
		this.cadate = cadate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	@Override
	public String toString() {
		return "renum=" + renum + ", addrnum=" + addrnum + ", servicecnt=" + servicecnt + ", retype=" + retype
				+ ", redate=" + redate + ", retime=" + retime + ", email=" + email + ", servicearea=" + servicearea
				+ ", notice=" + notice + ", trashway=" + trashway + ", paystate=" + paystate + ", cadate=" + cadate
				+ ", price=" + price + ", runtime=" + runtime;
	}

	
	
	  
	 
}
