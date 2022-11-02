package com.koreait.cleaninglab.manager.dao;

public class ManagerDTO {
	private String manageremail;
	private String managerpw;
	private String managername;
	private String managerphone;
	private String managerbirth;
	private String managerbank;
	private String manageraccount;
	private String addr;
	private String addrdetail;
	private String workspace;
	private int educount;

	public int getEducount() {
		return educount;
	}

	public void setEducount(int educount) {
		this.educount = educount;
	}

	public String getManageremail() {
		return manageremail;
	}

	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
	}

	public String getManagerpw() {
		return managerpw;
	}

	public void setManagerpw(String managerpw) {
		this.managerpw = managerpw;
	}

	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	public String getManagerphone() {
		return managerphone;
	}

	public void setManagerphone(String managerphone) {
		this.managerphone = managerphone;
	}

	public String getManagerbirth() {
		return managerbirth;
	}

	public void setManagerbirth(String managerbirth) {
		this.managerbirth = managerbirth;
	}

	public String getManagerbank() {
		return managerbank;
	}

	public void setManagerbank(String managerbank) {
		this.managerbank = managerbank;
	}

	public String getManageraccount() {
		return manageraccount;
	}

	public void setManageraccount(String manageraccount) {
		this.manageraccount = manageraccount;
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

	public String getWorkspace() {
		return workspace;
	}

	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}

}
