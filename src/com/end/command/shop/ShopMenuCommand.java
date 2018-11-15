package com.end.command.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;

public class ShopMenuCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession().setAttribute("아이디", "hann");
		
		return "shopMenu.jsp";
	}
}
