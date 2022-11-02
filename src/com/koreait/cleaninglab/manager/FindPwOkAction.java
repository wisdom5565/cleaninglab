package com.koreait.cleaninglab.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.manager.dao.ManagerDAO;

public class FindPwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ManagerDAO mdao = new ManagerDAO();
		String manageremail = req.getParameter("manageremail");
		PrintWriter out = resp.getWriter();

		if (mdao.findPw(manageremail)) {
			out.write("O");
		} else {
			out.write("X");
		}
		out.close();
		return null;
	}
}
