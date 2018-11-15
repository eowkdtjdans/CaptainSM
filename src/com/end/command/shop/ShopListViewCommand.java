package com.end.command.shop;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopVO;

public class ShopListViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ShopVO vo = ShopDAO.get_one(request.getParameter("p_name"));
		
		//제품 이름저장
		
		String name = ShopDAO.get_name(request.getParameter("p_name"));
		
		request.getSession().setAttribute("name", name);
		
		request.setAttribute("vo", vo);
		
		
		//관련상품
		List<ShopVO> p_name_list = ShopDAO.get_related((String)request.getSession().getAttribute("category"));
		
		System.out.println("p_name_list : " + p_name_list);
		
		p_name_list = p_name_list.subList(0, 4);
		
		System.out.println("p_name_list.subList : " + p_name_list);
		
		Collections.shuffle(p_name_list);
		
		System.out.println("shuffle : " + p_name_list);
		
		//카테고리로 뽑은 제품들 저장
		request.getSession().setAttribute("p_name_list", p_name_list);
		
		request.setAttribute("goPage", request.getParameter("goPage"));
		
		return "shopOneList.jsp";
	}
}
