package com.end.command.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;

public class ShopMenuCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//임시로
		request.getSession().setAttribute("c_id", "hann");
		
		request.getSession().removeAttribute("fullname");
		request.getSession().removeAttribute("caegory");
		
		
		return "shopMenu.jsp";
	}
}
