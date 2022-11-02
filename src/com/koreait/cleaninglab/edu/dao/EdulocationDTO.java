package com.koreait.cleaninglab.edu.dao;

public class EdulocationDTO {
	private int edupeolplenum;
	private String city;
	private String[] location;
	private String locationstr;
	private String mappoint;
	private String parking;
	public int getEdupeolplenum() {
		return edupeolplenum;
	}
	public void setEdupeolplenum(int edupeolplenum) {
		this.edupeolplenum = edupeolplenum;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
