package com.end.command.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;
import com.end.vo.CustomerVO;

public class CustomerRegisterCommand implements PetShopCommand {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("register_chk");
		String path = null;
		if (chk == null) {
			path = "CustomerRegister.jsp";
		} else {
			
			String c_id = request.getParameter("c_id");
			String c_pwd = request.getParameter("c_pwd");
			String c_email = request.getParameter("c_email");
			CustomerVO vo = new CustomerVO();
			vo.setC_id(request.getParameter("c_id"));
			vo.setC_pwd(request.getParameter("c_pwd"));
			vo.setC_name(request.getParameter("c_name"));
			vo.setC_addr(request.getParameter("c_addr"));
			vo.setC_phone(request.getParameter("c_phone"));
			vo.setC_gender(request.getParameter("c_gender"));
			vo.setC_email(request.getParameter("c_email") + request.getParameter("emails"));
			
			request.getSession().setAttribute("vo", vo);
			
			CustomerDAO.Customerinsert(vo);
			
			path = "index.jsp";
		}
		
		return path;
	}

}
