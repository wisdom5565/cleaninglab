package com.koreait.cleaninglab.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.edu.dao.EducateDAO;
import com.koreait.cleaninglab.edu.dao.EducateDTO;

public class EduDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String edudatenum = req.getParameter("edudatenum");
		EducateDAO edao = new EducateDAO();
		EducateDTO edto = edao.getDetail(edudatenum);
		req.setAttribute("EduDetail", edto);
		ActionForward forword = new ActionForward();
		forword.setRedirect(false);
		forword.setPath("/cleaninglab/manager/educate/manager_edudetail.jsp");
		return forword;
	}
}
