package com.koreait.cleaninglab.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.cleaninglab.gift.dao.GiftDTO;
import com.koreait.cleaninglab.user.dao.UserDTO;
import com.koreait.mybatis.SqlMapConfig;

public class ResDAO {
	SqlSession sqlsession;
	
	public ResDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public List<AddrDTO> addrlist(String email) {
		List<AddrDTO> data = null;
		
		data = sqlsession.selectList("Res.addrlist", email);
	
		return data;
	}
	
	public List<AddrDTO> addrlist2(String dd2,String email) {
		
		HashMap<String, Object> ha = new HashMap<String, Object>();
		ha.put("addrnum", dd2);
		ha.put("email", email);

		List<AddrDTO> data = sqlsession.selectList("Res.addrlist2", ha);
		
		return data;
	}
	
	public boolean addrInsert(AddrDTO dto) {
		
		int data = 0;
		
		data = sqlsession.insert("Res.addrinsert", dto);
		
		return data == 1;
	}
	
	public boolean addrMod(AddrDTO dto) {
		
		int data = 0;
		
		data = sqlsession.update("Res.addrmodify", dto);
		
		return data == 1;
	}
	
	public UserDTO userInfor(String email) {
		UserDTO data = null;
		
		data = sqlsession.selectOne("Res.userinfor", email);
	
		return data;
	}
	
	public List<GiftDTO> coupon(String email) {
		List<GiftDTO> data = null;
		
		data = sqlsession.selectList("Res.coupon", email);
		
		return data;
	}
	public GiftDTO usechk(GiftDTO dto) {
		GiftDTO data = null;
		
		data = sqlsession.selectOne("Res.usechk", dto);
		
		return data;
	}
	
	public boolean giftuse(UserDTO dto) {
		
		int data = 0;
		
		data = sqlsession.update("Res.giftuse", dto);
		
		return data == 1;
	}
	
	public boolean presinsert(ResDTO dto) {
		
		int data = 0;
		
		data = sqlsession.update("Res.presinsert", dto);
		
		return data == 1;
	}
	
	public boolean matchinsert(ResDTO dto) {
		
		int data = 0;
		
		data = sqlsession.update("Res.matchinsert", dto);
		
		return data == 1;
	}

	public boolean userMod(GiftDTO dto) {
		int data = 0;
		
		data = sqlsession.update("Res.userMod", dto);
		
		return data == 1;
	}
}
