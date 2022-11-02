package com.koreait.cleaninglab.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.review.dao.ReviewDAO;
import com.koreait.cleaninglab.review.dao.ReviewDTO;

public class ReviewDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		String title = req.getParameter("title");
		ReviewDTO review = rdao.getReviewDetail(title);
		req.setAttribute("review", review);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/review/review_detail.jsp");
		return forward;
	}
}
