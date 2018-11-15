package com.end.command.dog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.dao.DogDAO;
import com.end.vo.DogVO;

public class DogListViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String d_idx = request.getParameter("d_idx");
		
		List<DogVO> dogViewList = DogDAO.selectDogView(d_idx);

		request.setAttribute("dogViewList", dogViewList);
		
		return "dogListView.jsp";
	}

}
