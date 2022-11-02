package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;
import com.koreait.cleaninglab.mypage.dao.MypageDTO;

public class CardModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		MypageDTO updateMypage = new MypageDTO();
		HttpSession session = req.getSession();
		
		String useremail = (String) session.getAttribute("useremail");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		updateMypage.setUseremail(useremail);
		updateMypage.setCardnum(req.getParameter("newcardnum"));
		updateMypage.setCarddate(req.getParameter("newcarddate"));
		updateMypage.setCvc(Integer.parseInt(req.getParameter("newcvc")));
		updateMypage.setCardpw(Integer.parseInt(req.getParameter("cardpw")));
		if(mdao.updatecard(updateMypage)) {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=CO");
		}else {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=CN");
		}
		return forward;
	}

}
