package com.koreait.cleaninglab.manager.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;
import com.koreait.cleaninglab.manager.dao.ManagerDTO;

public class AddrModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();
		HttpSession session = req.getSession();

		ActionForward forward = new ActionForward();
		String manageremail = (String) session.getAttribute("manageremail");
		ManagerDTO SessionManager = mdao.getData(manageremail);

		req.setAttribute("managername", SessionManager.getManagername());
		req.setAttribute("addr", SessionManager.getAddr());
		req.setAttribute("addrdetail", SessionManager.getAddrdetail());

		forward.setRedirect(false);
		forward.setPath("/cleaninglab/manager/mypage/addr_modify.jsp");
		return forward;
	}

}
