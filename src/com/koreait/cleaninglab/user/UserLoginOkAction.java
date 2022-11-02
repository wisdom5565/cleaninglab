package com.koreait.cleaninglab.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.user.dao.UserDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		
		String useremail = req.getParameter("useremail");
		String userpw = req.getParameter("userpw");
		HttpSession session = req.getSession();
		
		ActionForward forward = null;
		UserDTO loginUser = udao.login(useremail,userpw);
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("useremail", useremail);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/UserIndex.us");
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/user/UserLogin.us?login=false");
		}
		return forward;
	}
}
