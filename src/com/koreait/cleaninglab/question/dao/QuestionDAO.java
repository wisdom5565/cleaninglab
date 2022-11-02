package com.koreait.cleaninglab.question.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.cleaninglab.question.dao.QuestionDAO;
import com.koreait.mybatis.SqlMapConfig;

public class QuestionDAO {
	SqlSession sqlsession;

		public QuestionDAO() {
			sqlsession = SqlMapConfig.getFactory().openSession(true);
			
		}
		
		public int getQuestionCnt() {
			return sqlsession.selectOne("Question.getQuestionCnt");
		}

		public List<QuestionDTO> getQuestionList(int startRow, int endRow) {
			HashMap<String, Integer> datas  = new HashMap<String, Integer>();
			datas.put("startRow", startRow);
			datas.put("endRow", endRow);
			
			
			List<QuestionDTO> result = sqlsession.selectList("Question.getQuestionList",datas);
			return result ;
		}
		
		
		
		
}
