package com.koreait.cleaninglab.gift.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class GiftDAO {
	SqlSession sqlsession;

	public GiftDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean sendGift(GiftDTO gift) {
		return 1 == sqlsession.insert("Gift.sendGift", gift);
	}
}
