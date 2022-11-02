package com.koreait.cleaninglab.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

public class MypageFrontController extends HttpServlet {
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

		case "/mypage/Mypage.my":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/cleaninglab/mypage/mypage.jsp");
			break;

		case "/mypage/MypageMain.my":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/mypage/myinformation_main.jsp");
			forward.setRedirect(false);
			break;

		case "/mypage/informationModify.my":
			try {
				forward = new InformationModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("informationModifyOk: " + e);
			}
			break;

		case "/mypage/myinformationModifyOk.my":
			try {
				forward = new InformationModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("informationModifyOk: " + e);
			}
			break;

		case "/mypage/regionModify.my":
			try {
				forward = new RegionModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("regionModify : " + e);
				e.printStackTrace();
			}
			break;

		case "/mypage/regionModifyOk.my":
			try {
				forward = new RegionModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("regionModifyOk : " + e);
			}
			break;
		case "/mypage/cardModify.my":
			try {
				forward = new CardModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("cardModify: " + e);
			}
			break;

		case "/mypage/CardModifyOk.my":
			try {
				forward = new CardModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("cardModifyOk: " + e);
			}
			break;

		case "/mypage/delete.my":
			forward = new ActionForward();
			forward.setPath("/cleaninglab/mypage/myinformation_delete.jsp");
			forward.setRedirect(false);
			break;

		case "/mypage/deleteOk.my":
			try {
				forward = new DeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("deleteOK: " + e);
			}
			break;
			
		case "/mypage/My_reservation.my":
			try {
				forward = new MyReservationAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("MyReservation : " + e);
			}
			break;
			
		case "/mypage/My_reservation2.my":
			try {
				forward = new MyReservation2Action().execute(req, resp);
			} catch (Exception e) {
				System.out.println("MyReservation2 : " + e);
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
