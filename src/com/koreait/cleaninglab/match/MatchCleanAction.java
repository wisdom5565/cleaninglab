package com.koreait.cleaninglab.match;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.match.dao.MatchDAO;
import com.koreait.cleaninglab.match.dao.MatchDTO;

public class MatchCleanAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MatchDAO mdao = new MatchDAO();
		String servicenum = req.getParameter("value");
		MatchDTO mdto =	mdao.getMatchInfo(servicenum);
		ActionForward forword = null;
		if(mdto.getState().equals("자택방문")) {
			if(mdao.clean(servicenum)) {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/progress.mac?result=successcle");
			}else {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/progress.mac?result=falsecle");
				
			}
		}else {
			forword = new ActionForward();
			forword.setRedirect(true);
			forword.setPath("/manager/matching/progress.mac?result=failcle");
			
		}
			return forword;
		}
}
