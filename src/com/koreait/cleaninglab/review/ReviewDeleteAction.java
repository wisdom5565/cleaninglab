package com.koreait.cleaninglab.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.review.dao.ReviewDAO;
import com.koreait.cleaninglab.review.dao.ReviewDTO;

public class ReviewDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int renum = Integer.parseInt(req.getParameter("renum"));
		String retype = req.getParameter("retype");
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO review = new ReviewDTO();
		
		review.setRenum(renum);
		review.setRetype(retype);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(rdao.deleteReview(review)) {
			forward.setPath(req.getContextPath() + "/mypage/My_reservation2.my?delete=true");
		} else {
			forward.setPath(req.getContextPath() + "/mypage/My_reservation2.my?delete=false");
		}
		return forward;
	}
}
