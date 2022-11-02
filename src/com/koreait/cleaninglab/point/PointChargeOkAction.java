package com.koreait.cleaninglab.point;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.point.dao.PointDAO;
import com.koreait.cleaninglab.point.dao.PointDTO;
import com.koreait.cleaninglab.user.dao.UserDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class PointChargeOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		PointDAO pdao = new PointDAO();
		PointDTO point = new PointDTO();
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		
		int giftnum = Integer.parseInt(req.getParameter("giftnum"));
		
		HttpSession session = req.getSession();
		String useremail = (String)session.getAttribute("useremail");//현재 로그인되어있는 이메일
		
		point.setUseremail(useremail);
		point.setGiftnum(giftnum);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(pdao.pointcharge(point)) {
			pdao.pointUsed(point);
			user = (UserDTO) session.getAttribute("loginUser");
			user.setPoint(udao.getpoint(useremail));
			forward.setPath(req.getContextPath() + "/point/PointView.po?charge=Ok");
		} else {
			forward.setPath(req.getContextPath() + "/point/PointView.po?charge=Not");
			
		}
		return forward;
	}

}
