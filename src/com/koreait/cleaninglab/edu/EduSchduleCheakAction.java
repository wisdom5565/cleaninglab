package com.koreait.cleaninglab.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.edu.dao.EducateDAO;
import com.koreait.cleaninglab.edu.dao.EducateDTO;

public class EduSchduleCheakAction implements Action{

@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		String manageremail = (String)session.getAttribute("manageremail");
		EducateDAO edao = new EducateDAO();
		EducateDTO edto =  edao.getMyEdu(manageremail);
		req.setAttribute("EduDetail", edto);
		ActionForward forword = new ActionForward();
		forword.setRedirect(false);
		forword.setPath("/cleaninglab/manager/educate/manager_reservationedu.jsp");
		return forword;

	}

}
