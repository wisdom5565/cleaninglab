package com.koreait.cleaninglab.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.user.dao.UserDAO;

public class CheckEmailOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		String useremail = req.getParameter("useremail");
		PrintWriter out = resp.getWriter();
		if (udao.checkEmail(useremail)) {
			out.write("O");
		} else {
			out.write("X");
		}
		out.close();
		return null;
	}
}
