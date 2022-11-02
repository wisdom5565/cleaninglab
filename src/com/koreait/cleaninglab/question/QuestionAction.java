package com.koreait.cleaninglab.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.cleaninglab.question.dao.QuestionDAO;
	
public class QuestionAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		QuestionDAO qdao = new QuestionDAO();
		String temp = req.getParameter("page");
		int page = temp == null?1:Integer.parseInt(temp);
		
		int pageSize = 4;
		
		int totalCnt = qdao.getQuestionCnt();
		
		int endRow = page*pageSize;
		int startRow = endRow-pageSize+1;
		
		int startPage = ((page-1)/pageSize)*pageSize+1;
		int endPage = startPage + pageSize -1;
		int totalPage = (totalCnt-1)/pageSize + 1;
		
		endPage = endPage>totalPage?totalPage:endPage;
		
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("questionList", qdao.getQuestionList(startRow,endRow));
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/cleaninglab/question/my_question.jsp");
		return null;
	}
}
