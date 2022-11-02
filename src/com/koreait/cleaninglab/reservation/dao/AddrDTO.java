package com.koreait.cleaninglab.reservation.dao;

public class AddrDTO {

	private int addrnum;
	private String email, addr, addrdetail, area, animal,animaldetail, kids, 
	cctv, parking, homename,phone, frontkey ,homekey,cleantool,homeway;
	
	public AddrDTO() {
	
	}

	public int getAddrnum() {
		return addrnum;
	}

	public void setAddrnum(int addrnum) {
		this.addrnum = addrnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrdetail() {
		return addrdetail;
	}

	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAnimal() {
		return animal;
	}

	public void setAnimal(String animal) {
		this.animal = animal;
	}

	public String getAnimaldetail() {
		return animaldetail;
	}

	public void setAnimaldetail(String animaldetail) {
		this.animaldetail = animaldetail;
	}

	public String getKids() {
		return kids;
	}

	public void setKids(String kids) {
		this.kids = kids;
	}

	public String getCctv() {
		return cctv;
	}

	public void setCctv(String cctv) {
		this.cctv = cctv;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getHomename() {
		return homename;
	}

	public void setHomename(String homename) {
		this.homename = homename;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFrontkey() {
		return frontkey;
	}

	public void setFrontkey(String frontkey) {
		this.frontkey = frontkey;
	}

	public String getHomekey() {
		return homekey;
	}

	public void setHomekey(String homekey) {
		this.homekey = homekey;
	}

	public String getCleantool() {
		return cleantool;
	}

	public void setCleantool(String cleentool) {
		this.cleantool = cleentool;
	}

	public String getHomeway() {
		return homeway;
	}

	public void setHomeway(String homeway) {
		this.homeway = homeway;
	}
	
	@Override
	public String toString() {
		return "addrnum=" + addrnum + ", email=" + email + ", addr=" + addr + ", addrdetail=" + addrdetail
				+ ", area=" + area + ", animal=" + animal + ", animaldetail=" + animaldetail + ", kids=" + kids
				+ ", cctv=" + cctv + ", parking=" + parking + ", homename=" + homename + ", phone=" + phone
				+ ", frontkey=" + frontkey + ", homekey=" + homekey + ", cleentool=" + cleantool + ", homeway="
				+ homeway ;
	}

	
}
