package com.koreait.cleaninglab.gift;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.gift.dao.GiftDAO;
import com.koreait.cleaninglab.gift.dao.GiftDTO;

public class GiftOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int giftprice = Integer.parseInt(req.getParameter("gift"));
		String phone = req.getParameter("phone");
		String name = req.getParameter("name2");
		GiftDAO gdao = new GiftDAO();
		GiftDTO gift = new GiftDTO();
		
		gift.setPhone(phone);
		gift.setPrice(giftprice);
		
		req.setAttribute("gift", gdao.sendGift(gift));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/gift/GiftResult.gi");
		return forward;
	}
}
