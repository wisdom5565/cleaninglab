package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;
import com.koreait.cleaninglab.mypage.dao.MypageDTO;

public class RegionModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		HttpSession session = req.getSession();
		
		ActionForward forward = new ActionForward();
		String useremail = (String) session.getAttribute("useremail");
		MypageDTO SessionMypage = mdao.getHome(useremail);
		
		
		req.setAttribute("addr", SessionMypage.getAddr());
		req.setAttribute("addrdetail", SessionMypage.getAddrdetail());

		forward.setRedirect(false);
		forward.setPath("/cleaninglab/mypage/myinformation_region.jsp");
		return forward;
	}

}
