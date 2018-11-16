package com.end.command.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class AdminSearchCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			Map<String, Integer> map = new HashMap<>();
			List<CustomerVO> search = CustomerDAO.AdminSearch(map);
			
			request.setAttribute("search", search);
			
			return "Adminsearchlist.jsp";
	}

}