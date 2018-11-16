package com.end.command.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class CustomerFindPwdCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("find_pwdchk");
		String path = null;
		
		if (chk == null) {
			path = "CustomerFindPwd.jsp";
		} else {
			String c_id = request.getParameter("c_id");
			String c_phone = request.getParameter("c_phone");
			CustomerVO vo = CustomerDAO.CustomerFindPwd(c_id);
			
			request.getSession().setAttribute("c_phone", c_phone);
			request.getSession().setAttribute("c_id",  c_id);
			request.getSession().setAttribute("c_pwd", vo.getC_pwd());
			
			path = "index.jsp";
		}
		
		return path;
	}

}
