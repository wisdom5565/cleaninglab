package com.koreait.cleaninglab.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class ServiceFrontController extends HttpServlet {
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
		
		case "/service/ServiceList.se" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/service/cleaning_range.jsp");
			break;
			
		case "/service/Basic_Service.se" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/service/basic_service.jsp");
			break;
			
		case "/service/Charged_Service.se" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/service/charged_service.jsp");
			break;
			
		case "/service/Not_Service.se" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/service/not_service.jsp");
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
