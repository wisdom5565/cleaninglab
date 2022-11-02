package com.koreait.cleaninglab.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.user.dao.UserDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class UserChangePwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO changeUser = new UserDTO();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		changeUser.setUseremail(req.getParameter("useremail"));
		changeUser.setUserphone(req.getParameter("userphone"));
		changeUser.setUserpw(req.getParameter("userpw"));
		
		if(udao.changePw(changeUser)) {
			forward.setPath(req.getContextPath() + "/user/UserLogin.us?change=OK");
		} else {
			forward.setPath(req.getContextPath() +  "/user/UserIndex.us?change=NO");
		}
		
		
		return forward;
	}

}
