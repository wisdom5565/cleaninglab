package com.koreait.cleaninglab.manager;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;

public class ManagerLoginOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();

		String manageremail = req.getParameter("manageremail");
		String managerpw = req.getParameter("managerpw");
		HttpSession session = req.getSession();

		ActionForward forward = null;
		ManagerDTO loginManager = mdao.login(manageremail, managerpw);
		if (loginManager != null) {
			session.setAttribute("loginManager", loginManager);
			session.setAttribute("manageremail", manageremail);
			session.setAttribute("edunum", loginManager.getEducount());
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/manager/ManagerMain.ma");
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/manager/ManagerLogin.ma?login=false");
		}
		return forward;

	}

}
