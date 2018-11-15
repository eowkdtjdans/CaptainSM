package com.end.command.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopCartVO;

public class ShopCartViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getSession().getAttribute("c_id") == null) {
			request.setAttribute("type", "cart");
			request.setAttribute("p_name", request.getAttribute("p_name"));
			return "shopLogin.jsp";
		}
		
		//db에서 로그인한 아이디를 이용해서 카트데이터 뽑아오기
		List<ShopCartVO> list = ShopDAO.get_all((String)request.getSession().getAttribute("c_id"));
		
		HttpSession session = request.getSession();
		
		session.setAttribute("list", list);
		request.setAttribute("go_menu", true);
		
		return "shopCart.jsp";
	}

}
