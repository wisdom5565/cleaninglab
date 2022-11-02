package com.koreait.cleaninglab.reservation;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;

public class Resdata implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String dd = (String)req.getSession().getAttribute("useremail");
		String dd2 = req.getParameter("addrnum");
		List<AddrDTO> addr = null;
		
		if(dd!=null&&dd2==null) {
			addr = new ResDAO().addrlist(dd);
		}else {
			addr = new ResDAO().addrlist2(dd2,dd);
			System.out.println("d"+new ResDAO().addrlist2(dd2,dd));
		}
		JSONObject d;
		JSONArray t = new JSONArray();
		
		if(addr!=null) {
		
			for (AddrDTO a : addr) {
				d = new JSONObject();
				d.put("addrnum", a.getAddrnum());
				d.put("addr", a.getAddr());
				d.put("addrdetail", a.getAddrdetail());
				d.put("homename", a.getHomename());
			
				if(dd2!=null){
					d.put("area", a.getArea());
					d.put("animal", a.getAnimal());
					d.put("animaldetail", a.getAnimaldetail());
					d.put("kids", a.getKids());
					d.put("cctv", a.getCctv());
					d.put("phone", a.getPhone());
					d.put("parking", a.getParking());
					d.put("frontkey", a.getFrontkey());
					d.put("homekey", a.getHomekey());
					d.put("cleantool", a.getCleantool());
					d.put("homeway", a.getHomeway());
				}
			t.add(d);
		}
			System.out.println(t);
		}
		PrintWriter re = resp.getWriter();
		re.print(t);
		return null;
	}
}
