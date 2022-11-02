package com.koreait.cleaninglab.point;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class PointFrontController extends HttpServlet {
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
		
		case "/point/PointView.po":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/point/point.jsp");
			break;
		case "/point/PointCharge.po":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/point/point_charge.jsp");
			break;
		case "/point/PointChargeOk.po":
			try {
				forward = new PointChargeOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("PointChargeOk: " + e);
			}
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
