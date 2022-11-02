package com.koreait.cleaninglab.reservation;

import java.util.List;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.gift.dao.GiftDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;

public class ResdataCoupon implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String email = req.getParameter("email");
		
		JSONObject d;
		JSONArray t = new JSONArray();
		
		if(email!=null) {
			
			List<GiftDTO> gdto = new ResDAO().coupon(email);
			
			if(gdto!=null) {
				for (GiftDTO a : gdto) {
					d = new JSONObject();
					
					d.put("giftnum", a.getGiftnum());
					d.put("price", a.getPrice());
					d.put("usedate", a.getUsedate());
					d.put("gifttype", a.getGifttype());
					d.put("use", a.getUse());
					
					t.add(d);System.out.println("zn"+gdto);
				} 
			}
		}
		
		PrintWriter re = resp.getWriter();
		re.print(t);
		return null;
	}
}
