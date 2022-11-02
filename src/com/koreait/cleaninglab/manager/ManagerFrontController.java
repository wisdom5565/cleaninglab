package com.koreait.cleaninglab.manager;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.action.ActionForward;

public class ManagerFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	};

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;

		switch (command) {
		case "/manager/ManagerJoin.ma":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/manager_join.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/ManagerLogin.ma":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/manager_login.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/ManagerMain.ma":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/manager_main.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/ManagerJoinOk.ma":
			try {
				forward = new ManagerJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ManagerJoinOk : " + e);
			}
			break;
		case "/manager/CheckEmailOk.ma":
			try {
				new CheckEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CheckEmailOk : " + e);
			}
			break;
		case "/manager/ManagerLoginOk.ma":
			try {
				forward = new ManagerLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ManagerLoginOk : " + e);
			}
			break;
		case "/manager/ManagerLogoutOk.ma":
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/manager/ManagerLogin.ma");
				req.getSession().removeAttribute("loginManager");
			} catch (Exception e) {
				System.out.println("ManagerLogoutOk : " + e);
			}
			break;
		case "/manager/FindEmail.ma" : 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/manager/manager_findemail.jsp");
			break;
		case "/manager/FindPw.ma" :
			forward =new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/manager/manager_findpassword.jsp");
			break;
		case "/manager/FindEmailOk.ma":
			try {
				forward = new FindEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_FindEmailOk : " + e);
			}
			break;
		case"/manager/FindPwOk.ma":
			try {
				forward = new FindPwOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("M_FindPWOk : "+e);
			}
			break;
		case"/manager/ChangePwOk.ma":
			try {
				forward = new ChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_ChangePw : " +e);
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
