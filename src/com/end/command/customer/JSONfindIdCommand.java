package com.end.command.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class JSONfindIdCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<CustomerVO> list = CustomerDAO.CustomergetList();
		String result = "{\"list\":[";
		
		for (CustomerVO vo : list) {
			result += "{";
			result += "\"c_name\" : \"" + vo.getC_name() + "\",";
			result += "\"c_phone\" : \"" + vo.getC_phone() + "\"";
			result += "},";
		}
		result = result.substring(0, result.length() - 1);
		result += "]}";
		
		return result;
	}

}