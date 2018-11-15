package com.end.command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;
import com.end.vo.RCommentVO;

public class ReviewWriteCommnadC implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = null;
		RCommentVO vo = new RCommentVO();
		
		vo.setR_idx(request.getParameter("r_idx"));
		vo.setRc_id(request.getParameter("rc_id"));
		vo.setRc_name(request.getParameter("rc_name"));
		vo.setRc_phone(request.getParameter("rc_phone"));
		vo.setRc_content(request.getParameter("rc_content"));
		
		ReviewDAO.insertC(vo);
		//path = "MyCon?type=all";
		path = "PSC?type=reviewOnelist&r_idx" + request.getParameter("r_idx");
		
		return path;
	}

}
