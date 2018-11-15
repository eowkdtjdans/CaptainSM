package com.end.command.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class CustomerListCommand implements PetShopCommand {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<CustomerVO> CustomerList = CustomerDAO.CustomergetList();
		request.getSession().setAttribute("CustomerList", CustomerList);
		
		return "PSC?type=CustomerMain";
	
	}

}
