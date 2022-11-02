package com.koreait.cleaninglab.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.faq.dao.FaqDAO;
import com.koreait.cleaninglab.faq.dao.FaqDTO;

public class FaqViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FaqDAO fdao = new FaqDAO();
		String title = req.getParameter("title");
		FaqDTO faq = fdao.getFaqDetail(title);
		req.setAttribute("faq", faq);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/faq/faq_view.jsp");
		return forward;
	}

}
