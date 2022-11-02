package com.koreait.cleaninglab.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.edu.dao.EducateDAO;

public class EducateSchduleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EducateDAO edao = new EducateDAO();
		String city = req.getParameter("city");
		req.setAttribute("EduDateList", edao.getSchduleList(city));
		if(city.equals("seoul")) {
			req.setAttribute("EduArea", "서울, 경기, 인천교육장");
			
		}else if(city.equals("gwangju")) {
			req.setAttribute("EduArea", "광주교육장");
			
		}else if(city.equals("daegu")) {
			req.setAttribute("EduArea", "대구교육장");
			
		}else if(city.equals("daejeon")) {
			req.setAttribute("EduArea", "대전교육장");
			
		}else if(city.equals("busan")) {
			req.setAttribute("EduArea", "부산교육장");
			
		}else if(city.equals("ulsan")) {
			req.setAttribute("EduArea", "울산교육장");
			
		}else if(city.equals("cheonan")) {
			req.setAttribute("EduArea", "천안교육장");
			
		}else {
			
		}
		ActionForward forword = new ActionForward();
		forword.setRedirect(false);
		forword.setPath("/cleaninglab/manager/educate/manager_eduschdule.jsp");
		return forword;
	}

}
