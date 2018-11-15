package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;

public class QuestionDeleteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String q_idx = request.getParameter("q_idx");		
		
		
		QuestionDAO.QuestionCommentDeleteAll(q_idx);
		QuestionDAO.QuestionDelete(q_idx);
		
		return "PSC?type=questionList";
	}

}







