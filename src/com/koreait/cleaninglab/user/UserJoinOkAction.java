package com.koreait.cleaninglab.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.user.dao.UserDAO;
import com.koreait.cleaninglab.user.dao.UserDTO;

public class UserJoinOkAction {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO newUser = new UserDTO();
		UserDAO udao = new UserDAO();

		// 유저 데이터
		newUser.setUseremail(req.getParameter("useremail"));
		newUser.setUserpw(req.getParameter("userpw"));
		newUser.setUsername(req.getParameter("username"));
		newUser.setUserphone(req.getParameter("userphone"));
		newUser.setPoint(0);
		newUser.setCardnum("");
		newUser.setCarddate("");
		newUser.setCvc(0);
		newUser.setCardpw(0);

		newUser.setAddrnum(1);
		newUser.setAddr(req.getParameter("addr") + req.getParameter("addretc"));
		newUser.setAddrdetail(req.getParameter("addrdetail"));
		newUser.setArea(req.getParameter("area"));
		newUser.setAnimal("");
		newUser.setAnimaldetail("");
		newUser.setKids("");
		newUser.setCctv("");
		newUser.setParking("");
		newUser.setHomename(req.getParameter("homename"));
		newUser.setFrontkey("");
		newUser.setHomekey("");
		newUser.setCleantool("");
		newUser.setHomeway("");

		ActionForward forward = null;
		if (udao.join(newUser)) {
			forward = new ActionForward();
			forward.setRedirect(true);
		}
		if(udao.joinHome(newUser)) {
			forward = new ActionForward();
			forward.setRedirect(true);
		}

		forward.setPath(req.getContextPath() + "/user/UserLogin.us?useremail=" + req.getParameter("useremail"));
		return forward;
	}
}
