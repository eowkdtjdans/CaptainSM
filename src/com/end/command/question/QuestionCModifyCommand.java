package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QcommentVO;

public class QuestionCModifyCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String qc_idx = request.getParameter("qc_idx");
		String q_idx = request.getParameter("q_idx");
		QcommentVO qvo = QuestionDAO.QuestionCommentOne(qc_idx);
		request.setAttribute("qvo", qvo);
		request.getSession().setAttribute("qc_idx", qc_idx);
		request.getSession().setAttribute("q_idx", q_idx);
		
		
		return "QuestCommentModifyView.jsp";
	}

}
