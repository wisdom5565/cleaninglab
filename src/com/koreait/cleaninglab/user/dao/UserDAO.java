package com.koreait.cleaninglab.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;

	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean join(UserDTO newUser) {
		int result = sqlsession.insert("User.join", newUser);
		return result == 1;
	}
	public boolean joinHome(UserDTO newUser) {
		int result = sqlsession.insert("User.joinhome", newUser);
		return result == 1;
	}
	
	public boolean checkEmail (String useremail) {
		int result = 1;
		result = sqlsession.selectOne("User.checkEmail", useremail);
		return result == 0;
	}
	
	public UserDTO login (String useremail, String userpw) {
		UserDTO result = null;
		HashMap<String, String> datas = new HashMap<String, String>();
		
		datas.put("useremail", useremail);
		datas.put("userpw", userpw);
		result = sqlsession.selectOne("User.login", datas);
		
		return result;
	}

	public String findEmail(String username, String userphone) {
		String result;
		HashMap<String, String> datas = new HashMap<String, String>();

		datas.put("username", username);
		datas.put("userphone", userphone);
		result = sqlsession.selectOne("User.findEmail", datas);
		return result;
	}

	public boolean findPw(String useremail) {
		int result = 0;
		result = sqlsession.selectOne("User.findPw", useremail);
		return result == 1;
	}

	public boolean changePw(UserDTO changeUser) {
		int result = sqlsession.update("User.changePw", changeUser);
		return result == 1;
	}
	public int getpoint(String useremail) {
		return sqlsession.selectOne("User.getPoint", useremail);
	}
}
