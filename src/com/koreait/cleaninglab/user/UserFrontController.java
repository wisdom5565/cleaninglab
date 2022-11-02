package com.koreait.cleaninglab.user;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.action.ActionForward;

public class UserFrontController extends HttpServlet {
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

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;

		switch (command) {
		case "/user/UserJoin.us":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/user/user_join.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserLoginMain.us":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/user/user_loginmain.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserLogin.us":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/user/user_login.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserIndex.us":
			forward = new ActionForward();
			forward.setPath("/index.jsp");
			forward.setRedirect(false);
			break;
		case "/user/UserJoinOk.us":
			try {
				forward = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserJoinOk : " + e);
			}
			break;
		case "/user/CheckEmailOk.us":
			try {
				new CheckEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CheckEmailOk : " + e);
			}
			break;
		case "/user/UserLoginOk.us":
			try {
				forward = new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserLoginOk : " + e);
			}
			break;
		case "/user/UserLogoutOk.us":
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/user/UserLogin.us");
				req.getSession().removeAttribute("loginUser");
			} catch (Exception e) {
				System.out.println("UserLogoutOk : " + e);
			}
			break;
		case "/user/FindEmail.us" : 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/user/user_findemail.jsp");
			break;
		case "/user/FindPw.us":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/user/user_findpassword.jsp");
			break;
		case "/user/FindEmailOk.us":
			try {
				forward = new UserFindEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("C_findEmailOk : " + e);
			}
			break;
		case "/user/FindPwOk.us" :
			try {
				forward = new UserFindPwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("C_findPwOk : " +e);
			}
			break;
		case "/user/ChangePwOk.us" : 
			try {
				forward = new UserChangePwOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("C_ChangePwOk : " + e);
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
