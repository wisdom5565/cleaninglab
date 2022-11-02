package com.koreait.cleaninglab.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.gift.dao.GiftDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;
import com.koreait.cleaninglab.reservation.dao.ResDTO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class ResLastCalcPage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String email = (String)req.getSession().getAttribute("useremail");
		String point = req.getParameter("point");
		String giftnum = req.getParameter("giftnum"); 
		System.out.println(giftnum);
		System.out.println("dd"+Integer.parseInt(point));
		ResDTO rdto = new ResDTO();
		UserDTO udto = new  UserDTO();
		GiftDTO gdto = new GiftDTO();
		
		if(email!=null) {
			
			if(point!=null&&point!="") {
				udto.setUseremail(email);
				udto.setPoint(Integer.parseInt(point));
				boolean res = new ResDAO().giftuse(udto);
				System.out.println(res);
			}
		
			if(giftnum!=null&&giftnum!="") {
				gdto.setGiftnum(Integer.parseInt(giftnum));
				gdto.setGifttype("쿠폰");
				gdto.setEmail(email);
				gdto.setUse("사용");
				new ResDAO().userMod(gdto);
			}
		
			rdto.setAddrnum(Integer.parseInt(req.getParameter("addrnum")));
			rdto.setEmail(email);
			rdto.setNotice(req.getParameter("notice"));
			rdto.setPaystate("결제완료");
			rdto.setPrice(req.getParameter("price"));
			rdto.setRedate(req.getParameter("redate")+" "+req.getParameter("retime") );
			rdto.setRetime(req.getParameter("runtime"));
			rdto.setRetype(req.getParameter("retype"));
			rdto.setServicearea(req.getParameter("servicearea"));
			rdto.setServicecnt(Integer.parseInt(req.getParameter("servicecnt")));
			rdto.setTrashway(req.getParameter("trashway"));
		
			boolean rr = new ResDAO().presinsert(rdto);
			if(rr) {
				new ResDAO().matchinsert(rdto);
				
			}
		}
		
		forward.setPath("/index.jsp");
		System.out.println("야"+rdto);
		return forward;
	}

}
