package com.koreait.cleaninglab.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class ResController extends HttpServlet{
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
		String url = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		
		switch (url) {
		case "/cleaninglab/reservation.rs":
			try {
				forward = new ResMainPage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/reservation/type.rs":
			try {
				forward = new ResTypePage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/reservation/check.rs":
			try {
				forward = new ResCheckPage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/reservation/last.rs":
			try {
				forward = new ResLastPage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/reservation/lastCalc.rs":
			try {
				forward = new ResLastCalcPage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
