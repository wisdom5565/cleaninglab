package com.koreait.cleaninglab.edu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;



public class EduFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	};

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	};

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;

		switch (command) {
		case "/manager/educate/manager_areachoice.edu":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/educate/manager_areachoice.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/educate/manager_eduschdule.edu":
			try {
				forward = new EducateSchduleAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("EducateSchduleAction : " + e);
			}
			break;
		case"/manager/educate/manager_edudetail.edu":
			try {
				forward = new EduDetailAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EduDetailAction : " + e);
			}
			break;
		case "/manager/educate/manager_reservationedu.edu":

			try {
				forward = new EduReservationAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("EduReservationAction : " + e);
			}
			break;
		case "/manager/educate/manager_educatemain.edu":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/educate/manager_educatemain.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/educate/reservsuccess.edu":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/educate/manager_reservationedu.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/educate/cheakmyedu.edu":
			try {
				forward = new EduSchduleCheakAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EduSchduleCheakAction : " + e);
			}
			break;
		case "/manager/educate/changeeduresv.edu":
			try {
				forward = new EduChangeAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EduChangeAction : " + e);
			}
			break;
		case "/manager/educate/deleteeduresv.edu":
			try {
				forward = new EduDeleteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("EduChangeAction : " + e);
			}
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

