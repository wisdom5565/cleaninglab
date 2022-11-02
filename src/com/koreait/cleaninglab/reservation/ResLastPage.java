package com.koreait.cleaninglab.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.gift.dao.GiftDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;
import com.koreait.cleaninglab.reservation.dao.ResDTO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class ResLastPage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String email = (String)req.getSession().getAttribute("useremail");
		ResDTO rdto = new ResDTO();
		UserDTO udto = new UserDTO();
		int gsize = 0;
		
		if(email!=null) {
			udto = new ResDAO().userInfor(email);
			req.setAttribute("udto", udto);
			String card = udto.getCardnum();
			if(card!=""&&card!=null) {
				String cardSh = card.split("-")[0];
				req.setAttribute("cardSh", cardSh);
			}
			gsize = new ResDAO().coupon(email).size();
		}
		
		rdto.setAddrnum(Integer.parseInt(req.getParameter("addrnum")));
		rdto.setEmail(email);
		rdto.setRedate(req.getParameter("redate"));
		rdto.setRetime(req.getParameter("retime"));
		rdto.setRuntime(req.getParameter("runtime"));
		rdto.setRetype(req.getParameter("retype"));
		rdto.setServicearea(req.getParameter("servicearea"));
		rdto.setServicecnt(Integer.parseInt(req.getParameter("servicecnt")));
		rdto.setTrashway(req.getParameter("trashway"));
		rdto.setNotice(req.getParameter("notice"));
		rdto.setPrice(req.getParameter("price"));
	
		req.setAttribute("rdto", rdto);
		req.setAttribute("gsize", gsize);
		System.out.println(rdto);
		forward.setPath("/cleaninglab/reservation/lastCalc.jsp");
		return forward;
	}

}
