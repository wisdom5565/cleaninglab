package com.koreait.cleaninglab.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;

public class ResTypePage implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String type = req.getParameter("resType");
		String addr = req.getParameter("nowAddr");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(type.equals("부분")) {

			forward.setPath("/cleaninglab/reservation/part.jsp");
		}
		
		req.setAttribute("addrnum", addr);
		req.setAttribute("type", type);
		return forward;
	}
}
