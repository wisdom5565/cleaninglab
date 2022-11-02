package com.koreait.cleaninglab.gift;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class GiftFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;

		switch (command) {
		
		case "/gift/Gift.gi":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/gift/gift.jsp");
			break;
		case "/gift/GiftOk.gi":
			try {
				forward = new GiftOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("GiftOk: " + e);
			}
			break;
		case "/gift/GiftResult.gi":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/gift/gift_result.jsp");
			break;
		}
		
		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
