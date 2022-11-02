package com.koreait.cleaninglab.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.reservation.dao.AddrDTO;
import com.koreait.cleaninglab.reservation.dao.ResDAO;

public class ResdataController extends HttpServlet{
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
		
		req.setCharacterEncoding("UTF-8"); 
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("application/json");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String url = requestURI.substring(contextPath.length());
		
		switch (url) {
		case "/ResdataCall.rd":
			
			try {
				new Resdata().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case "/ResdataChange.rd":
			
			try {
				new ResdataChange().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case "/ResdataCList.rd":
			
			try {
				new ResdataCoupon().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case "/ResdataCalc.rd":
			
			try {
				new ResCalcPage().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;

		default:
			break;
		}
	
		
		
	}
}
