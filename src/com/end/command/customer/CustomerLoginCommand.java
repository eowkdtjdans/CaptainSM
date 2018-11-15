package com.end.command.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class CustomerLoginCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("login_chk");
		String path = null;
		if (chk == null) {
			path = "CustomerLogin.jsp";
		} else {
			String c_id = request.getParameter("c_id");
			String c_pwd = request.getParameter("c_pwd");
			CustomerVO vo = CustomerDAO.CustomergetDB(c_id);
			
			if (vo.getC_id().equals(c_id) && vo.getC_pwd().equals(vo.getC_pwd())) {
				request.getSession().setAttribute("c_id", c_id);
				request.getSession().setAttribute("c_pwd", c_pwd);
				
				path = "index.jsp";
			}
		}
	return path;
	}

}
