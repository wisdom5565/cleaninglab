package com.koreait.cleaninglab.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class MyReservationDAO {
	SqlSession sqlsession;

	public MyReservationDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public List<MyReservationDTO> getReservation(String useremail) {
		return sqlsession.selectList("Mypage.getReservation", useremail);
	}
	public List<MyReservationDTO> getReservation2(String useremail) {
		return sqlsession.selectList("Mypage.getReservation2", useremail);
	}
	
}
