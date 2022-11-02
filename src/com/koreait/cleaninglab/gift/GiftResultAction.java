package com.koreait.cleaninglab.gift;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;

public class GiftResultAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int giftprice = Integer.parseInt(req.getParameter("giftprice"));
		String phone = req.getParameter("phone");
		String name = req.getParameter("name");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/gift/gift_result.jsp?name="+name+"&phone="+phone+"&gift="+giftprice);
		return forward;
	}
}
