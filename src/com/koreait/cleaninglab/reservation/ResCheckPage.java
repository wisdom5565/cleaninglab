package com.koreait.cleaninglab.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;
import com.koreait.cleaninglab.reservation.dao.ResDTO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class ResCheckPage implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String email = (String)req.getSession().getAttribute("useremail");
		String addrnum = req.getParameter("addrnum");
		
		if(email!=null && addrnum!=null) {
			
			ResDTO rdto = new ResDTO();
			AddrDTO adto = new ResDAO().addrlist2(addrnum, email).get(0);
			
			rdto.setAddrnum(Integer.parseInt(req.getParameter("addrnum")));
			rdto.setEmail(email);
			rdto.setRetype(req.getParameter("retype"));
			rdto.setServicecnt(Integer.parseInt(req.getParameter("servicecnt")));
			rdto.setServicearea(req.getParameter("servicearea"));
			rdto.setNotice(req.getParameter("notice"));
			rdto.setTrashway(req.getParameter("trashway"));
			rdto.setPrice(req.getParameter("price"));
			rdto.setRuntime(req.getParameter("runtime"));
			
			req.setAttribute("rdto", rdto);
			req.setAttribute("adto", adto);
		}
		
		
		forward.setPath("/cleaninglab/reservation/last.jsp");
		
		return forward;
	}
}
