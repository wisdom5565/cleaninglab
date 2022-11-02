package com.koreait.cleaninglab.match;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;





public class MatchFrontController extends HttpServlet{
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
		case "/manager/matching/matchingmain.mac":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/manager/match/manager_matchingmain.jsp");
			forward.setRedirect(false);
			break;
		case "/manager/matching/matchlist.mac":
			try {
				forward = new MatchingListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("MatchingListAction : " + e);
			}
			break;
		case "/manager/matching/matching.mac":
			try {
				System.out.println("test1");
				forward = new MatchingAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("MatchingAction : " + e);
			}
			break;
		case"/manager/matching/Matchingsuccess.mac":
			try {
				forward = new MatchHistoryAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchHistoryAction : " + e);
			}
			break;
		case "/manager/matching/matchhistory.mac":
			try {
				forward = new MatchHistoryAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchHistoryAction : " + e);
			}
			break;
		case "/manager/matching/matchingcancel.mac":
			try {
				forward = new MatchingCancelAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchingCancelAction : " + e);
			}
			break;
		case "/manager/matching/progress.mac":
			try {
				forward = new MatchProgressAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchingCancelAction : " + e);
			}
			break;
		case "/manager/matching/matchingvisit.mac":
			try {
				forward = new MatchVisitAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchVisitAction : " + e);
			}
			break;
		case "/manager/matching/matchingclean.mac":
			try {
				forward = new MatchCleanAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchCleanAction : " + e);
			}
			break;
		case "/manager/matching/matchingfinish.mac":
			try {
				forward = new MatchFinishAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MatchFinishAction : " + e);
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
