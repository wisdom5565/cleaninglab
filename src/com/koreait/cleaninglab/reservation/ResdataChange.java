package com.koreait.cleaninglab.reservation;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;

public class ResdataChange implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String[] ty = req.getParameter("formdata").split("&");
		String email = (String)req.getSession().getAttribute("useremail");
		
		HashMap<String, String> hs = new HashMap<String, String>();
		System.out.println(ty);
		for (int i = 0; i < ty.length; i++) {
			String va = "";
			if(ty[i].split("=").length != 1) {
				va = ty[i].split("=")[1];
			}
			hs.put(ty[i].split("=")[0], va);
		}
		System.out.println("di"+hs);
			
		JSONObject d = new JSONObject();
		if(email!=null) {
			
			AddrDTO dto = new AddrDTO();
			dto.setAddr(hs.get("addr"));
			dto.setAddrdetail(hs.get("addrdetail"));
			
			if(hs.get("addrnum").equals("없음")) {
				dto.setAddrnum(0);
			}else if(hs.get("addrnum") != ""){
				dto.setAddrnum(Integer.parseInt(hs.get("addrnum")));
			}else {
				dto.setAddrnum(Integer.parseInt(hs.get("addrnum")));
			}
			dto.setAnimal(hs.get("animal"));
			dto.setAnimaldetail(hs.get("animaldetail"));
			dto.setArea(hs.get("area"));
			dto.setCctv(hs.get("cctv"));
			dto.setEmail(email);
			dto.setHomename(hs.get("homename"));
			dto.setKids(hs.get("kids"));
			dto.setParking(hs.get("parking"));
			dto.setFrontkey(hs.get("frontkey"));
			dto.setHomekey(hs.get("homekey"));
			dto.setCleantool(hs.get("cleantool"));
			dto.setHomeway(hs.get("homeway"));
			
			Boolean check = false;
			System.out.println(dto);
			if(hs.get("addrnum").equals("없음")) {
				check = new ResDAO().addrInsert(dto);
			}else {
				check = new ResDAO().addrMod(dto);
			}
			d.put(check, check);
		}
		
		PrintWriter re = resp.getWriter();
		re.print(d);
		
		return null;
	}
}
