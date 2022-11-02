package com.koreait.cleaninglab.manager.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class ManagerMyPageFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
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
		case "/manager/ManagerMypage.mmy":
			try {
				forward = new ManagerMypageAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_mypage : " + e);
			}
			break;
		case "/manager/infoModify.mmy":
			try {
				forward = new InfoModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_infoModify : " + e);
			}
			break;
		case "/manager/pwModify.mmy":
			try {
				forward = new PwModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_pwModify : " + e);
			}
			break;
			
		case "/manager/bankModify.mmy":
			try {
				forward = new BankModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("M_bankModify : "+e);
			}
			break;
			
		case "/manager/addrModify.mmy":
			try {
				forward = new AddrModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("M_addrModify : " + e); 
			}
			break;
			
		case "/manager/phoneModify.mmy":
			try {
				forward = new PhoneModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("M_phoneModify : " + e); 
			}
			break;
		case "/manager/workspaceModify.mmy":
			try {
				forward = new WorkspaceModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("M_workspaceModify : " +e);
			}
			break;
		case "/manager/delete.mmy":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/mypage/delete.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/DeleteOk.mmy":
			try {
				forward = new ManagerDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("Deleteok : " + e);
			}
			break;
		case "/manager/pwModifyOk.mmy":
			try {
				forward = new PwModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("pwModifyOk: " + e);
			}
			break;
		case "/manager/addrModifyOk.mmy":
			try {
				forward = new AddrModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("addrModifyOk : " + e);
			}
			break;
		case "/manager/bankModifyOk.mmy":
			try {
				forward = new BankModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("bankModifyOk: " + e);
			}
			break;
		case "/manager/phoneModifyOk.mmy":
			try {
				forward = new PhoneModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("phoneModifyOk: " + e);
			}
			break;
		case "/manager/workspaceModifyOk.mmy":
			try {
				forward = new WorkspaceModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("workspaceModifyOk : " + e);
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
