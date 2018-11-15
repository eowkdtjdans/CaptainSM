package com.end.command.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.OrderDAO;
import com.end.vo.OrderVO;
import com.end.vo.OrderIdVO;

public class OrderListViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String o_idx = request.getParameter("o_idx");
		
		List<OrderVO> oList = OrderDAO.selectOrderOne(o_idx);
		List<OrderIdVO> ovList = OrderDAO.selectOrderView(o_idx);
		
		request.setAttribute("oList", oList);
		request.setAttribute("ovList", ovList);
		
		return "orderListView.jsp";
	}

}
