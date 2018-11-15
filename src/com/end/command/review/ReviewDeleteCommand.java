package com.end.command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;

public class ReviewDeleteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String chk = request.getParameter("delete_chk");
		String r_idx = request.getParameter("r_idx"); 
		String path = null;
		
		ReviewDAO.delete(r_idx);
		
		path = "PSC?type=reviewAll";
		return path;
	}

}
