package com.end.command.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopVO;

public class ShopPay2Command implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ShopVO vo = ShopDAO.get_one(request.getParameter("p_name"));
	
		request.setAttribute("p_name", vo);
		
		return "shopPay2.jsp";
	}
}


