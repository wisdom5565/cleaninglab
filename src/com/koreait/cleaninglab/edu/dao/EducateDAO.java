package com.koreait.cleaninglab.edu.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class EducateDAO {
	SqlSession sqlsession;
	public EducateDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	public List<EduDateDTO> getSchduleList(String city) {
		List<EduDateDTO> result = sqlsession.selectList("Educate.List", city);
		return result;
		
	}
	public EducateDTO getDetail(String edudatenum) {
		EducateDTO result = sqlsession.selectOne("Educate.Detail", Integer.parseInt(edudatenum.trim()));
		return result;
		
	}
	public boolean reservationEdu(EduListDTO ldto) {
		int result = sqlsession.insert("Educate.reservation", ldto);
		return result == 1;
	}
	public EducateDTO getMyEdu(String manageremail) {
		EducateDTO result = sqlsession.selectOne("Educate.MyEdu", manageremail);
		return result;
	}
	public boolean deleteEdu(String manageremail) {
		int result = sqlsession.delete("Educate.deleteEdu", manageremail);
		return result == 1;
	}

}
