package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;
import com.koreait.cleaninglab.mypage.dao.MypageDTO;

public class RegionModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		MypageDTO updateMypage = new MypageDTO();
		HttpSession session = req.getSession();
		
		
		String useremail = (String) session.getAttribute("useremail");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		updateMypage.setUseremail(useremail);
		updateMypage.setAddr(req.getParameter("region"));
		updateMypage.setAddrdetail(req.getParameter("regiondetail"));
		if (mdao.updateaddr(updateMypage)) {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=RO");
		} else {
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=RN");
		}
		return forward;
	}

}
