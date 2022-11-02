package com.koreait.cleaninglab.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.mypage.dao.MypageDAO;

public class DeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MypageDAO mdao = new MypageDAO();
		HttpSession session = req.getSession();
		String useremail = (String) session.getAttribute("useremail");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(mdao.delete(useremail)) {
			forward.setPath(req.getContextPath() + "/user/UserIndex.us?loginUser=null&delete="+useremail);
		}else {
			forward = new ActionForward();
			forward.setPath(req.getContextPath() + "/mypage/MypageMain.my?modify=NO");
		}
		
		return forward;
	}

}
