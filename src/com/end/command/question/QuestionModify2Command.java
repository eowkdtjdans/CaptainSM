package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QuestionVO;

public class QuestionModify2Command implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QuestionVO vo = (QuestionVO)request.getSession().getAttribute("vo");
		
		vo.setQ_subject(request.getParameter("subject"));
		vo.setQ_content(request.getParameter("content"));
		
		QuestionDAO.QuestionUpdate(vo);
		
		return "PSC?type=questionView&cPage="+request.getParameter("cPage");
	}

}
