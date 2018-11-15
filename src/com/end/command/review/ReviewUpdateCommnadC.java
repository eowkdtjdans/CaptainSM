package com.end.command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;
import com.end.vo.RCommentVO;

public class ReviewUpdateCommnadC implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String rc_idx = request.getParameter("rc_idx");
		String r_idx = request.getParameter("r_idx");
		
		RCommentVO vo = new RCommentVO();
		vo.setRc_idx(request.getParameter("rc_idx"));
		vo.setRc_id(request.getParameter("rc_id"));
		vo.setRc_name(request.getParameter("rc_name"));
		vo.setRc_content(request.getParameter("rc_content"));
		
		ReviewDAO.updateC(vo);
		
		return "PSC?type=reviewOnelist&r_idx=" + r_idx;
	}

}
