package com.koreait.cleaninglab.match;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.match.dao.MatchDAO;
import com.koreait.cleaninglab.match.dao.MatchDTO;

public class MatchingAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MatchDAO mdao = new MatchDAO();
		MatchDTO mdto = new MatchDTO();
		MatchDTO mdto1 = new MatchDTO();
		HttpSession session = req.getSession();
		String manageremail = (String)session.getAttribute("manageremail");
		System.out.println(session.getAttribute("loginuser.workspace"));
		
		String servicenum = req.getParameter("value");
		mdto = mdao.getMatchInfo(servicenum);
		ActionForward forword = null;
		String state = mdto.getState().trim();
		switch (state) {
		case "매칭중":
			System.out.println("false");
			mdto1.setServicenum(Integer.parseInt(servicenum));
			mdto1.setM_email(manageremail);
			mdto1.setState("매칭완료");
			if(mdao.setMatching(mdto1)) {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/Matchingsuccess.mac?servicenum="+servicenum+"&&retype="+mdto.getRetype());
			}else {
				forword = new ActionForward();
				forword.setRedirect(true);
				forword.setPath("/manager/matching/Matchingsuccess.mac?result=false");
			}
			break;

		default:
			forword = new ActionForward();
			forword.setRedirect(true);
			forword.setPath("/manager/matching/Matchingsuccess.mac?result=falseMatching");
			break;
		}
		
		
	
		return forword;
	}
}
