package com.end.command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.CustomerDAO;


public class AdminDeleteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("delete_chk");
		String c_id = request.getParameter("c_id");
		String path = null;
		if (chk == null) {
			path = "AdminMain.jsp";
		} else {
			CustomerDAO.AdminDelete(c_id);
			path = "AdminMain.jsp";
		}
		return path;
	}
}
