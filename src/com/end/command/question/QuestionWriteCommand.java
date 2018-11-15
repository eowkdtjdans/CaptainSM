package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QuestionVO;


public class QuestionWriteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("write_chk");
		String path = null;
		
		if(chk == null) {
			path = "QuestionWrite.jsp";
		}else {
			QuestionVO vo = new QuestionVO();
			vo.setQ_id((String)request.getSession().getAttribute("c_id"));
			vo.setQ_content(request.getParameter("q_content"));
			vo.setQ_subject(request.getParameter("q_subject"));
			
			QuestionDAO.QuestionInsert(vo);
			
			path = "PSC?type=questionList";
		}
		return path;
	}

}
