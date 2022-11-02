package com.koreait.cleaninglab.reservation;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.gift.dao.GiftDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class ResCalcPage implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		GiftDTO gdto = new GiftDTO();
		UserDTO udto = new UserDTO();
		
		String type = req.getParameter("type");
		String email = (String)req.getSession().getAttribute("useremail");
		String giftnum = req.getParameter("giftnum"); 
		String point = req.getParameter("point"); 
		String form = req.getParameter("formdata");
		String use = req.getParameter("use");
		String[] formdata = null ;
		System.out.println(req.getParameter("use"));
		System.out.println(point);
		HashMap<String, String> hs = new HashMap<String, String>();
		
		if(form!=null) {

			formdata = req.getParameter("formdata").split("&");
			
			for (int i = 0; i < formdata.length; i++) {
				String va = "";
				if(formdata[i].split("=").length != 1) {
					va = formdata[i].split("=")[1];
				}
				hs.put(formdata[i].split("=")[0], va);
			}
		}
		
		JSONObject d;
		JSONArray t = new JSONArray();
		PrintWriter re = resp.getWriter();
		
		if(type!=null && giftnum!=null&&email!=null) {
			
			gdto.setGiftnum(Integer.parseInt(giftnum));
			gdto.setGifttype(type);
			gdto.setEmail(email);
			
			if(use!=null) {
				gdto.setUse(use);
			}else {
				gdto.setUse("사용");
			}

			if(req.getParameter("check")!=null) {
				boolean ff = new ResDAO().userMod(gdto);
				t.add(ff);
				
				if(point!=null&&Integer.parseInt(point) > 0&& ff) {
					udto.setUseremail(email);
					udto.setPoint(Integer.parseInt(point));
					
					if(new ResDAO().giftuse(udto)) {
						t.add(new ResDAO().giftuse(udto));
						t.add(Integer.parseInt(point));
					}
				}
				
			}else {
				
				GiftDTO res = new ResDAO().usechk(gdto);
				
				if(res!=null) {
					
					d = new JSONObject();
					d.put("giftnum", res.getGiftnum());
					d.put("use", res.getUse());
					d.put("price", res.getPrice());
					t.add(d);
				}
			}
			
		}else if(type!=null&&type.equals("카드")&&formdata!=null) {
			
			udto.setCarddate(hs.get("carddate"));
			udto.setCardnum(hs.get("cardnum"));
			udto.setCardpw(Integer.parseInt(hs.get("cardpw")));
			udto.setCvc(Integer.parseInt(hs.get("cvc")));
			udto.setUseremail(email);
			
			boolean ff = new ResDAO().giftuse(udto);
			System.out.println("Tl"+udto);
			t.add(ff);
			
		}
		
		
		re.print(t);
		
		return null;
	}
}
