package com.koreait.cleaninglab.match;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.match.dao.MatchDAO;

public class MatchHistoryAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MatchDAO mdao = new MatchDAO();
		HttpSession session = req.getSession();
		String manageremail = (String)session.getAttribute("manageremail");
		req.setAttribute("MatchList", mdao.getHistory(manageremail));
		ActionForward forword = new ActionForward();
		forword.setRedirect(false);
		forword.setPath("/cleaninglab/manager/match/manager_matchinghistory.jsp");
		return forword;
	}
}
