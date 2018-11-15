package com.end.command.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;

public class ShopLoginCommand implements PetShopCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String p_name = request.getParameter("p_name");
		
		request.setAttribute("p_name", p_name);
		
		return "shopLogin.jsp";
	}
}
