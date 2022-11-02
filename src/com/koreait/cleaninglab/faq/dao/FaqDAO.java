package com.koreait.cleaninglab.faq.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class FaqDAO {
	SqlSession sqlsession;

	public FaqDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public int getFaqCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("FAQ.getFaqCnt");
		} else {
			return sqlsession.selectOne("FAQ.getFaqCntWithKey", keyword);
		}
	}

	public List<FaqDTO> getFaqList(int startRow, int endRow, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<FaqDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if (keyword == null) {
			result = sqlsession.selectList("FAQ.getFaqList", datas);
		} else {
			datas.put("keyword", keyword);
			result = sqlsession.selectList("FAQ.getFaqListWithKey", datas);
		}
		return result;
	}

	public FaqDTO getFaqDetail(String title) {
		return sqlsession.selectOne("FAQ.getFaqDetail", title);
	}
}
