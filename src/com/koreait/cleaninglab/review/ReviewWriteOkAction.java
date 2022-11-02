package com.koreait.cleaninglab.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.review.dao.ReviewDAO;
import com.koreait.cleaninglab.review.dao.ReviewDTO;

public class ReviewWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		int renum = Integer.parseInt(req.getParameter("renum"));
		String retype = req.getParameter("retype");
		String useremail = (String)session.getAttribute("useremail");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String name = req.getParameter("name");
		
		ReviewDTO review = new ReviewDTO();
		
		review.setRenum(renum);
		review.setRetype(retype);
		review.setEmail(useremail);
		review.setTitle(title);
		review.setContent(content);
		review.setM_name(name);
		
		ReviewDAO rdao = new ReviewDAO();
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(rdao.insertReview(review)) {
			forward.setPath(req.getContextPath() + "/mypage/My_reservation2.my?write=true");
		} else {
			forward.setPath(req.getContextPath() + "/review/MyReview.re?write=false");
		}
		return forward;
	}
	
}
