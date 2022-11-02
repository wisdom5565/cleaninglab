package com.koreait.cleaninglab.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;

public class ChangePwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();
		ManagerDTO changeManager = new ManagerDTO();  
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		changeManager.setManageremail(req.getParameter("manageremail"));
		changeManager.setManagerphone(req.getParameter("managerphone"));
		changeManager.setManagerpw(req.getParameter("managerpw"));
		
		
		if(mdao.changePw(changeManager)) {
			forward.setPath(req.getContextPath()+"/manager/ManagerLogin.ma?change=OK");
		} else {
			forward.setPath(req.getContextPath()+"/manager/ManagerMain.ma?change=NO");
		}
		return forward;
	}

}
