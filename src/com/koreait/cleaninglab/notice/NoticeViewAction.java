package com.koreait.cleaninglab.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.notice.dao.NoticeDAO;
import com.koreait.cleaninglab.notice.dao.NoticeDTO;

public class NoticeViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		
		String title = req.getParameter("title");
		NoticeDTO notice = ndao.getNoticeDetail(title);
		req.setAttribute("notice", notice);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/notice/notice_view.jsp");
		return forward;
	}
}
