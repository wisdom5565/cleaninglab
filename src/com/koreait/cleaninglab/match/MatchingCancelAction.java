package com.koreait.cleaninglab.match;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.match.dao.MatchDAO;
import com.koreait.cleaninglab.match.dao.MatchDTO;

public class MatchingCancelAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MatchDAO mdao = new MatchDAO();
		String servicenum = req.getParameter("value");
		MatchDTO mdto =	mdao.getMatchInfo(servicenum);
		ActionForward forword = null;
		if(mdto.getState().equals("매칭완료")) {
			if(mdao.cancel(servicenum)) {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/progress.mac?result=successcan");
			}else {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/progress.mac?result=falsecan");
				
			}
		}else {
			forword = new ActionForward();
			forword.setRedirect(true);
			forword.setPath("/manager/matching/progress.mac?result=failcan");
			
		}
	return forword;
	}
}
