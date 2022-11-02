package com.koreait.cleaninglab.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.cleaninglab.mypage.dao.MypageDTO;
import com.koreait.mybatis.SqlMapConfig;

public class MypageDAO {
	SqlSession sqlsession;

	public MypageDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);  //true로 설정시 오토커밋
	}
	
	//비밀번호 확인
	public MypageDTO checkpw(String userpw) {
		MypageDTO result =  sqlsession.selectOne("Mypage.checkpw", userpw);
		return result;
	}
	
	
	//지역 수정
	public boolean updateaddr (MypageDTO updateAddr) {
		return 1== sqlsession.update("Mypage.updateaddr", updateAddr);
	}

	
	//회원 탈퇴
	public boolean delete(String useremail) {
		int result = sqlsession.delete("Mypage.delete", useremail);
		return result == 1;
	}
	
	
	//정보 수정
	public boolean modify(MypageDTO updateUser) {
		int result = sqlsession.update("Mypage.modify", updateUser);
		return result == 1;
	}

	public MypageDTO getHome(String useremail) {
		MypageDTO result = sqlsession.selectOne("Mypage.getHome", useremail);
		return result;
	}
	public MypageDTO getData(String useremail) {
		MypageDTO result = sqlsession.selectOne("Mypage.getData", useremail);
		return result;
	}
	
	//카드 정보
	public boolean updatecard(MypageDTO updateCard) {
		int result = sqlsession.update("Mypage.card", updateCard);
		return result == 1;
	}



	
}
