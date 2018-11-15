package com.end.command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;

public class ReviewDeleteCommnadC implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String rc_idx = request.getParameter("rc_idx");
		String r_idx = request.getParameter("r_idx");
		String navi = r_idx;
		ReviewDAO.deleteC(rc_idx);
		
		return "PSC?type=reviewOnelist&idx" + navi;
		
	}

}
