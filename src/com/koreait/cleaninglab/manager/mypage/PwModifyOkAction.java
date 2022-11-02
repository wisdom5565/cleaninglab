package com.koreait.cleaninglab.manager.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;

public class PwModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();
		ManagerDTO updateManager = new ManagerDTO();
		HttpSession session = req.getSession();

		String manageremail = (String) session.getAttribute("manageremail");
		updateManager.setManageremail(manageremail);
		updateManager.setManagerpw(req.getParameter("managerpw"));

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (mdao.updatepw(updateManager)) {
			forward.setPath(req.getContextPath() + "/manager/infoModify.mmy?update=PO");
		} else {
			forward.setPath(req.getContextPath() + "/manager/infoModify.mmy?update=PN");
		}
		return forward;
	}

}
