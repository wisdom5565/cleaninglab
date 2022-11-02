package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MyReservationDAO;

public class MyReservation2Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MyReservationDAO mdao = new MyReservationDAO();

		HttpSession session = req.getSession();
		String useremail = (String) session.getAttribute("useremail");

		ActionForward forward = new ActionForward();
		req.setAttribute("reservation2", mdao.getReservation2(useremail));
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/mypage/my_reservation2.jsp");
		return forward;
	}

}
