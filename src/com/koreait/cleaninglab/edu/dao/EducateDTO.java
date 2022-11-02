package com.koreait.cleaninglab.edu.dao;

public class EducateDTO {
	private int edudatenum;
	private String[] location;
	private String edudate;
   	private String edutime;
   	private String locationstr;
	private String mappoint;
	private String parking;
	
	public int getEdudatenum() {
		return edudatenum;
	}
	public void setEdudatenum(int edudatenum) {
		this.edudatenum = edudatenum;
	}
	public String getMappoint() {
		return mappoint;
	}
	public void setMappoint(String mappoint) {
		this.mappoint = mappoint;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	
	public String getEdudate() {
		return edudate;
	}
	public void setEdudate(String edudate) {
		this.edudate = edudate;
	}
	public String getEdutime() {
		return edutime;
	}
	public void setEdutime(String edutime) {
		this.edutime = edutime;
	}
	public String[] getLocation() {
		return location;
	}
	public void setLocation(String locationstr) {
		this.location = locationstr.split(",");
		this.locationstr = locationstr;
	}
	public String getLocationstr() {
		return locationstr;
	}
	public void setLocationstr(String[] location) {
		this.location = location;
		String locationstr = "";
		if(location.length>0) {
			locationstr = location[0];
			for(int i=0;i<location.length;i++) {
				locationstr+=","+location[i];
			}
		}
		this.locationstr = locationstr;
	}
}
