package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;
import com.koreait.cleaninglab.mypage.dao.MypageDTO;

public class InformationModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		HttpSession session = req.getSession();
		
		ActionForward forward = new ActionForward();
		String useremail = (String) session.getAttribute("useremail");
		MypageDTO Sessionmypage = mdao.getData(useremail);
		
		req.setAttribute("useremail", Sessionmypage.getUseremail());
		req.setAttribute("username", Sessionmypage.getUsername());
		req.setAttribute("userphone", Sessionmypage.getUserphone());
		
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/mypage/myinformation_modify.jsp");
		return forward;
	}

}
