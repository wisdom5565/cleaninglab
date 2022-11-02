package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;
import com.koreait.cleaninglab.mypage.dao.MypageDTO;

public class InformationModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		MypageDTO updateMypage = new MypageDTO();
		HttpSession session = req.getSession();
		
		ActionForward forward = new ActionForward();
		String useremail = (String) session.getAttribute("useremail");
		updateMypage.setUseremail(useremail);
		updateMypage.setUserphone(req.getParameter("newphone"));
		updateMypage.setUserpw(req.getParameter("newpassword"));
		forward.setRedirect(true);
		
		if (mdao.modify(updateMypage)) {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=MO");
		} else {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=MN");
		}
		return forward;
	}

}
