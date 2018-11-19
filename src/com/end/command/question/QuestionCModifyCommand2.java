package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QcommentVO;

public class QuestionCModifyCommand2 implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		String qc_content = request.getParameter("qc_content");
		String qc_idx = request.getParameter("qc_idx");
	
		QcommentVO qvo = new QcommentVO();
		qvo.setQc_content(qc_content);  
		qvo.setQc_idx(Integer.parseInt(qc_idx));
		
		QuestionDAO.QuestionCommentUpdate(qvo);
		
		return "PSC?type=questionView&q_idx="+q_idx;
	}

}
