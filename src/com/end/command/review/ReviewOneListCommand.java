package com.end.command.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;
import com.end.vo.RCommentVO;
import com.end.vo.ReviewDataVO;

public class ReviewOneListCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String r_idx = request.getParameter("r_idx");
		
		ReviewDataVO vo = new ReviewDataVO();
		vo.setR_idx((request.getParameter("r_idx")));
		ReviewDAO.countUp(vo);
		
		//session�뿉 ���옣
		request.getSession().setAttribute("ReviewDataVO", ReviewDAO.getOneList(r_idx));
		
		List<RCommentVO> listC = ReviewDAO.getListC(r_idx);
		
		request.getSession().setAttribute("listC", listC);
		RCommentVO rvo = new RCommentVO();
		
		return "reviewOnelist.jsp";
	}

}
