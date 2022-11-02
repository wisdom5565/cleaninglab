package com.koreait.cleaninglab.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.review.dao.ReviewDAO;
import com.koreait.cleaninglab.review.dao.ReviewDTO;

public class ReviewUpdateOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int renum = Integer.parseInt(req.getParameter("renum"));
		String retype = req.getParameter("retype");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO review = new ReviewDTO();
		
		review.setRenum(renum);
		review.setRetype(retype);
		review.setTitle(title);
		review.setContent(content);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(rdao.updateReview(review)) {
			forward.setPath(req.getContextPath() + "/mypage/My_reservation2.my?update=true");
		} else {
			forward.setPath(req.getContextPath() + "/mypage/My_reservation2.my?update=false");
		}
		return forward;
	}
}
