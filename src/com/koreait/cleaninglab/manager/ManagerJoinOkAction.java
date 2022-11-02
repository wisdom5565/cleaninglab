package com.koreait.cleaninglab.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;

public class ManagerJoinOkAction {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDTO newManager = new ManagerDTO();
		ManagerDAO mdao = new ManagerDAO();
		
		newManager.setManageremail(req.getParameter("manageremail"));
		newManager.setManagerpw(req.getParameter("managerpw"));
		newManager.setManagername(req.getParameter("managername"));
		newManager.setManagerphone(req.getParameter("managerphone"));
		newManager.setManagerbirth(req.getParameter("managerbirth"));
		newManager.setManagerbank(req.getParameter("managerbank"));
		newManager.setManageraccount(req.getParameter("manageraccount"));
		newManager.setAddr(req.getParameter("addr") + req.getParameter("addretc"));
		newManager.setAddrdetail(req.getParameter("addrdetail"));
		newManager.setWorkspace("");
		newManager.setEducount(0);

		ActionForward forward = null;
		if (mdao.join(newManager)) {
			forward = new ActionForward();
			forward.setRedirect(true);
		}

		forward.setPath(
				req.getContextPath() + "/manager/ManagerLogin.ma?manageremail=" + req.getParameter("manageremail"));
		return forward;
	}
}
