package com.koreait.cleaninglab.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;

public class FindEmailOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();

		String managername = req.getParameter("managername");
		String managerphone = req.getParameter("managerphone");

		String findemail = mdao.findEmail(managername, managerphone);

		req.setAttribute("managername", managername);
		req.setAttribute("manageremail", findemail);

		ActionForward forward = null;
		if (findemail != null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/manager/manager_finalfindemail.jsp");
		}
	
		return forward;
	}

}
