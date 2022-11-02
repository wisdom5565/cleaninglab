package com.koreait.cleaninglab.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.edu.dao.EducateDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;

public class EduChangeAction implements Action{
 @Override
 	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	EducateDAO edao = new EducateDAO();
	ManagerDAO mdao = new ManagerDAO();
	HttpSession session = req.getSession();
	String manageremail = (String)session.getAttribute("manageremail");
		
		ActionForward forward = null;
		if (edao.deleteEdu(manageremail)) {
			if (mdao.setEducountUpdate(manageremail)) {
				session.setAttribute("edunum", 3);
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("/manager/educate/manager_areachoice.edu");
				
			}
		} else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/manager/educate/manager_reservationedu.edu?change=false");
		}
		
		return forward;
 	}
}
