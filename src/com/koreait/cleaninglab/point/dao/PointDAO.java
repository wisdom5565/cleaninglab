package com.koreait.cleaninglab.point.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class PointDAO {
	SqlSession sqlsession;

	public PointDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean pointcharge(PointDTO point) {
		return 1 == sqlsession.update("Point.pointCharge", point);
	}
	
	public boolean pointUsed(PointDTO point) {
		return 1 == sqlsession.update("Point.pointUsed", point);
	}
	
}
