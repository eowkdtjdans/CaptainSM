package com.end.command.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class CustomerFindIdCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("find_idchk");
		String path = null;
		
		if (chk == null) {
			path = "CustomerFindId.jsp";
		} else {
			String c_id = request.getParameter("c_id");
			String c_name = request.getParameter("c_name");
			CustomerVO vo = CustomerDAO.CustomerFindId(c_name);
			
			request.setAttribute("c_name", vo.getC_name());
			request.setAttribute("c_phone", vo.getC_phone());
			request.getSession().setAttribute("find", vo);
			
			path = "CustomerLogin.jsp";
		}
		
		return path;
	}

}
