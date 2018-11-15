package com.end.command.shop;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopCartVO;

public class ShopCartCommand implements PetShopCommand {
	private int total;

		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//로그인이 안되어있다면
		if(request.getSession().getAttribute("c_id") == null) {
			request.setAttribute("type", "cart");
			request.setAttribute("p_name", request.getAttribute("p_name"));
			return "shopLogin.jsp";
		}
		
		String p_name = request.getParameter("p_name");

		//db에서 로그인한 아이디를 이용해서 카트데이터 뽑아오기
		List<ShopCartVO> list = ShopDAO.get_all((String)request.getSession().getAttribute("c_id"));
		
		request.getSession().getAttribute("c_id");
		
		ShopCartVO cvo = new ShopCartVO();
		cvo.setC_id((String)request.getSession().getAttribute("c_id"));
		cvo.setP_name(request.getParameter("p_name"));
		
		//총액구하기
		int total = 0;
		
		Iterator<ShopCartVO> ite = list.iterator();
		ShopCartVO vo = null;
			while(ite.hasNext()) {
				ShopCartVO listVO = ite.next();
				if(p_name.equals(listVO.getP_name())) {
					vo=listVO;
					break;
				}
			}
			
			if(vo != null) { //카트에 있음
				vo.setCart_quant(vo.getCart_quant()+1);
				total = total + vo.getP_saleprice();
				ShopDAO.updateOO(cvo);
			} else {//카트에 없음
				ShopDAO.insertO(cvo);
				list.add(vo);
				vo = ShopDAO.get_one1(p_name);
				vo.setCart_quant(1);				
			}
			
			
		list = ShopDAO.get_all((String)request.getSession().getAttribute("c_id"));
		
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		
		return "shopCart.jsp";
	}
}










