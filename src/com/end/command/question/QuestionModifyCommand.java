package com.end.command.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;

public class QuestionModifyCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		String cPage = request.getParameter("cPage");
		
		request.setAttribute("idx", idx);
		request.setAttribute("cPage", cPage);
		
		return "QuestionModify.jsp";
	}

}
