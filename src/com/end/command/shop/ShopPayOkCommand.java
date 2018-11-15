package com.end.command.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopCartVO;
import com.end.vo.ShopOrderVO;
import com.end.vo.ShopVO;

public class ShopPayOkCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<ShopCartVO> list = (List<ShopCartVO>) request.getSession().getAttribute("list");
		
		ShopOrderVO ovo = new ShopOrderVO();
		ovo.setId((String)request.getSession().getAttribute("c_id"));
		ovo.setName(request.getParameter("name"));
		ovo.setPhone(Integer.parseInt(request.getParameter("phone")));
		ovo.setReceiver(request.getParameter("receiver"));
		ovo.setSite(request.getParameter("site"));
		ovo.setPhone_receiver(Integer.parseInt(request.getParameter("phone_receiver")));
		ovo.setMessage(request.getParameter("message"));
		ovo.setMail(request.getParameter("mail"));
		
		ovo.setDeliveryFee(2500);
		ovo.setTotal(Integer.parseInt(request.getParameter("total_fee")));
		ovo.setPayMeans(request.getParameter("payMeans"));
		
		ShopDAO.insert_cart(ovo);
		
		if((ShopVO)request.getSession().getAttribute("p_name") != null) {
			ShopDAO.insert_item((ShopVO)request.getSession().getAttribute("p_name"));
			} else {
				for(ShopCartVO vo : list) {
					ShopDAO.insert_item(vo);
				}
			}
		
		ShopDAO.payOk((String)request.getSession().getAttribute("c_id"));
		
		////////////////////////////////////////////////////////////////
		
		
		
		return "shopPayOk.jsp";
	}
}


