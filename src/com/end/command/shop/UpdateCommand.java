package com.end.command.shop;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopCartVO;

public class UpdateCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ShopCartVO> list = ShopDAO.get_all("hann");
		
		String p_name = request.getParameter("p_name");
		
		Iterator<ShopCartVO> ite = list.iterator();
		ShopCartVO vo = null;
			while(ite.hasNext()) {
				ShopCartVO listVO = ite.next();
				if(p_name.equals(listVO.getP_name())) {
					vo=listVO;
					break;
				}
			}
			//Pet_shopVO pvo = new Pet_shopVO();
			if (vo != null) {
				vo.setCart_quant(Integer.parseInt(request.getParameter("su")));
				
				ShopCartVO cvo = new ShopCartVO();
				cvo.setC_id((String)request.getSession().getAttribute("아이디"));
				cvo.setP_name(p_name);
				cvo.setNumber(vo.getCart_quant());
				
				ShopDAO.updateO(cvo);

			}
			
			request.getSession().setAttribute("list", list);
			
		return "shopCart.jsp";
	}

}
