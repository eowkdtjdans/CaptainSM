package com.end.command.question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QcommentVO;

public class QuestionQcommentCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String content = request.getParameter("qc_content");
		String q_idx = request.getParameter("q_idx");
		QcommentVO qvo = new QcommentVO();
		
		
		qvo.setQc_id((String)request.getSession().getAttribute("c_id"));
		qvo.setQc_content(content);
		qvo.setQ_idx(q_idx);
		QuestionDAO.QuestionInsert2(qvo);
		
		
		int hit = QuestionDAO.QuestionCommentCount(q_idx);
		request.getSession().setAttribute("hit", hit);
		
		
		
		return "PSC?type=questionView&qc_idx="+qvo.getQc_idx();
		}
	

}
