package com.koreait.cleaninglab.match;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.match.dao.MatchDAO;


public class MatchingListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			MatchDAO mdao = new MatchDAO();
			String workspace = req.getParameter("workspace");
			req.setAttribute("MatchList", mdao.getMatchList(workspace));
			ActionForward forword = new ActionForward();
			forword.setRedirect(false);
			forword.setPath("/cleaninglab/manager/match/manager_matching.jsp");
			return forword;

	}
}
