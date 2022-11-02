package com.koreait.cleaninglab.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class ReviewFrontController extends HttpServlet {
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
		
		case "/review/MyReview.re":
			try {
				forward = new MyReviewAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("MyReview: " + e);
			}
			break;
		case "/review/ReviewWrite.re":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/review/review_write.jsp");
			break;
		case "/review/ReviewWriteOk.re":
			try {
				forward = new ReviewWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewWriteOk : " + e);
			}
			break;
		case "/review/ReviewUpdate.re":
			try {
				forward = new ReviewUpdateAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewUpdate : " + e);
			}
			break;
		case "/review/ReviewUpdateOk.re":
			try {
				forward = new ReviewUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewUpdateOk: " + e);
			}
			break;
		case "/review/ReviewDelete.re":
			try {
				forward = new ReviewDeleteAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewDelete: " + e);
			}
			break;
		case "/review/ReviewList.re":
			try {
				forward = new ReviewListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewList : " + e);
			}
			break;
		case "/review/ReviewDetail.re":
			try {
				forward = new ReviewDetailAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewDetail : " + e);
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
