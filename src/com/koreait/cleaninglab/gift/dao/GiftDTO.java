package com.koreait.cleaninglab.gift.dao;

public class GiftDTO {
	private String email;
	private String gifttype;
	private int giftnum;
	private String use;
	private String usedate;
	private int price;
	private String phone;

	public GiftDTO() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGifttype() {
		return gifttype;
	}

	public void setGifttype(String gifttype) {
		this.gifttype = gifttype;
	}

	public int getGiftnum() {
		return giftnum;
	}

	public void setGiftnum(int giftnum) {
		this.giftnum = giftnum;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "email=" + email + ", gifttype=" + gifttype + ", giftnum=" + giftnum + ", use=" + use + ", usedate="
				+ usedate + ", price=" + price + ", phone=" + phone;
	}
}
