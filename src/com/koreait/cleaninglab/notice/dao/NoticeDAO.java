package com.koreait.cleaninglab.notice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.cleaninglab.faq.dao.FaqDTO;
import com.koreait.mybatis.SqlMapConfig;

public class NoticeDAO {
	SqlSession sqlsession;

	public NoticeDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public List<NoticeDTO> getNoticeList(int startRow, int endRow) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		return sqlsession.selectList("Notice.getNoticeList", datas);
	}

	public int getNoticeCnt() {
		return sqlsession.selectOne("Notice.getNoticeCnt");
	}

	public NoticeDTO getNoticeDetail(String title) {
		return sqlsession.selectOne("Notice.getNoticeDetail", title);
	}
}
