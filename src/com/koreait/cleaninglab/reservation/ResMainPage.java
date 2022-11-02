package com.koreait.cleaninglab.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

import java.util.List;

public class ResMainPage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/reservation/reservation.jsp");
		
		String email = (String)req.getSession().getAttribute("useremail");
		
		if(email!=null) {
			
			List<AddrDTO> addr = new ResDAO().addrlist(email);
			
			if(addr.size()>0) {
				req.setAttribute("addr", addr.get(0));
			}
		}
		
		
		return forward;
	}
	
}
