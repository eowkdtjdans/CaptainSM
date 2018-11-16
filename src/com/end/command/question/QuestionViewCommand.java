package com.end.command.question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QcommentVO;
import com.end.vo.QuestionVO;


public class QuestionViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session;
		String q_idx = request.getParameter("q_idx");
		
		QuestionVO vo = QuestionDAO.QuestionOneList(q_idx);			
		List<QcommentVO> qvo = QuestionDAO.QuestionOneList2(q_idx);
	
		request.getSession().setAttribute("qvo", qvo);
		request.setAttribute("vo", vo);

		request.getSession().setAttribute("vo", vo);
		
		int hit = QuestionDAO.QuestionCommentCount(q_idx);
		request.getSession().setAttribute("hit", hit);
		
		
		QuestionDAO.QuestionCountUp(q_idx);
		
		
		return "QuestionView.jsp";
		
	}

}
