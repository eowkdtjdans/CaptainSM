package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;

public class QuestionCdeleteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//qc_idx=${vo.qc_idx }&q_idx=${vo.q_idx}
		String qc_idx = request.getParameter("qc_idx");
		String q_idx = request.getParameter("q_idx");
		
		QuestionDAO.QuestionCommentDelete(qc_idx);
		
		return "PSC?type=questionView&q_idx="+q_idx;
	}

}
