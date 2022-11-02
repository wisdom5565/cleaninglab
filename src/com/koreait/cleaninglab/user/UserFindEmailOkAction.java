package com.koreait.cleaninglab.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.user.dao.UserDAO;

public class UserFindEmailOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		
		String findemail = udao.findEmail(username, userphone);
		
		req.setAttribute("username", username);
		req.setAttribute("useremail", findemail);
		
		ActionForward forward = null;
		if(findemail != null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/user/user_finalfindemail.jsp");
		}
		
		return forward;
	}

}
