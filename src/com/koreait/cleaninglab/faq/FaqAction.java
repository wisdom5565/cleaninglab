package com.koreait.cleaninglab.faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.faq.dao.FaqDAO;

public class FaqAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		FaqDAO fdao = new FaqDAO();

		String temp = req.getParameter("page");
		
		String keyword = req.getParameter("keyword");

		int page = temp == null ? 1 : Integer.parseInt(temp);

		int pageSize = 10;

		int totalCnt = fdao.getFaqCnt(keyword);

		int endRow = page * pageSize;

		int startRow = endRow - pageSize + 1;

		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + pageSize - 1;
		int totalPage = (totalCnt - 1) / pageSize + 1;

		endPage = endPage > totalPage ? totalPage : endPage;

		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("faqlist", fdao.getFaqList(startRow, endRow, keyword));
		req.setAttribute("keyword", keyword);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/faq/faq_list.jsp");
		return forward;
	}

}
