package com.end.command.customer;

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
			
			request.getSession().setAttribute("c_name", c_name);
			request.getSession().setAttribute("c_id",  vo.getC_id());
			
			path = "index.jsp";
		}
		
		return path;
	}

}
