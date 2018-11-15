package com.end.command.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.OrderDAO;
import com.end.vo.OrderVO;
import com.end.vo.PagingVO;

public class OrderListCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String c_id = (String)request.getSession().getAttribute("c_id");
		
		PagingVO pvo = new PagingVO();
		int totalPage = OrderDAO.countOrderList(c_id);
		
		pvo.setTotalRecord(totalPage);
		pvo.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		
		if(cPage != null) {
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		pvo.setEnd(pvo.getNowPage() * pvo.getNumPerPage());
		pvo.setBegin(pvo.getEnd() - pvo.getNumPerPage() + 1);
		
		int nowPage = pvo.getNowPage();
		
		pvo.setBeginPage((nowPage - 1) / pvo.getPagePerBlock()  * pvo.getPagePerBlock() + 1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock() - 1);
		
		if (pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		OrderVO orderVo = new OrderVO();
		orderVo.setId(c_id);
		orderVo.setO_begin(pvo.getBegin());
		orderVo.setO_end(pvo.getEnd());
		
		List<OrderVO> orderList = OrderDAO.selectOrderList(orderVo);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("pvo", pvo);
		
		return "orderList.jsp";
	}

}
