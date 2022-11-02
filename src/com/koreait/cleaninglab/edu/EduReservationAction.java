package com.koreait.cleaninglab.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.edu.dao.EduListDTO;
import com.koreait.cleaninglab.edu.dao.EducateDAO;
import com.koreait.cleaninglab.edu.dao.EducateDTO;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;


public class EduReservationAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		EduListDTO ldto = new EduListDTO();
		EducateDAO edao = new EducateDAO();
		String date = req.getParameter("edudatenum");
		String loca = req.getParameter("edulocation");
		EducateDTO edto = edao.getDetail(date);
		HttpSession session = req.getSession();
		String manageremail = (String)session.getAttribute("manageremail");
		ldto.setEmail(manageremail);
		ldto.setEdudatenum(Integer.parseInt(date));
		ldto.setLocation(loca);
		ActionForward forward = null;		
		if(edao.reservationEdu(ldto)) {
			ManagerDAO mdao = new ManagerDAO();
			if(mdao.setEducount((String)session.getAttribute("manageremail"))) {
			ManagerDTO loginManager = mdao.reLogin(manageremail);
			session.setAttribute("loginManager", loginManager);
			session.setAttribute("EduDetail", edto);
			session.setAttribute("edunum", 1);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/manager/educate/reservsuccess.edu");
			}else {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/cleaninglab/manager/educate/manager_educatemain.edu?result=false");
			}
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/manager/educate/manager_educatemain.edu?result=false");
			
		}
		return forward;
	}
}
