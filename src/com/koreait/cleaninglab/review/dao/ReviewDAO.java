package com.koreait.cleaninglab.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.cleaninglab.faq.dao.FaqDTO;
import com.koreait.mybatis.SqlMapConfig;

public class ReviewDAO {
	SqlSession sqlsession;

	public ReviewDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public ReviewDTO getMyReview(ReviewDTO review) {
		return sqlsession.selectOne("Review.getMyReview", review);
	}
	
	public boolean insertReview(ReviewDTO review) {
		return 1 == sqlsession.insert("Review.insertReview", review);
	}

	public boolean updateReview(ReviewDTO review) {
		return 1 == sqlsession.update("Review.updateReview", review);
	}

	public boolean deleteReview(ReviewDTO review) {
		return 1 == sqlsession.delete("Review.deleteReview", review);
	}

	public int getReviewCnt() {
		return sqlsession.selectOne("Review.getReviewCnt");
	}

	public List<ReviewDTO> getReviewList(int startRow, int endRow) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<ReviewDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		result = sqlsession.selectList("Review.getReviewList", datas);
		return result;
	}
	public ReviewDTO getReviewDetail(String title) {
		return sqlsession.selectOne("Review.getReviewDetail", title);
	}
	
}
