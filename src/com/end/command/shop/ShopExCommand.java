package com.end.command.shop;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.vo.ShopCartVO;

public class ShopExCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<ShopCartVO> list = (List<ShopCartVO>)request.getSession().getAttribute("list");

		Iterator<ShopCartVO> ite = list.iterator();
		
		
		//총합저장
		int total = 0;
		while(ite.hasNext()) {
			ShopCartVO listVO = ite.next();
			if(listVO.getP_saleprice() == 0) {
				total += listVO. getP_price()*listVO.getCart_quant();
			}else {
			total += listVO.getP_saleprice()*listVO.getCart_quant();
			}
		}

		//배송비
		int deliveryFee = 2500;
		
		request.setAttribute("total", total);
		request.getSession().setAttribute("total_fee", total+deliveryFee);
		
		return "shopEx.jsp";
	}

}
