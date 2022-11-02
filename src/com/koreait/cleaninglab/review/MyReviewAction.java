package com.koreait.cleaninglab.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.review.dao.ReviewDAO;
import com.koreait.cleaninglab.review.dao.ReviewDTO;

public class MyReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int renum = Integer.parseInt(req.getParameter("renum"));
		String retype = req.getParameter("retype");
		String redate = req.getParameter("redate");
		String name = req.getParameter("name");
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO review = new ReviewDTO();
		
		review.setRenum(renum);
		review.setRetype(retype);
		req.setAttribute("review", rdao.getMyReview(review));
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/review/myreview.jsp?redate="+redate+"&name="+name);
		return forward;
	}


}
