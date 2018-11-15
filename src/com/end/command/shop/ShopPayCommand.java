package com.end.command.shop;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopVO;

public class ShopPayCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ShopVO vo = ShopDAO.get_one(request.getParameter("p_name"));
		
		request.getSession().setAttribute("p_name", vo);
		
		if(request.getSession().getAttribute("c_id") == null) {
			request.setAttribute("type", "pay2");
			request.setAttribute("p_name", request.getAttribute("p_name"));
			return "shopLogin.jsp";
		}
		
		return "shopPay.jsp";
	}
}