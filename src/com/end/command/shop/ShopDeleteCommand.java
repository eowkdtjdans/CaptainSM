package com.end.command.shop;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopCartVO;

public class ShopDeleteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	
		List<ShopCartVO> list = ShopDAO.get_all("hann");

		String p_name = request.getParameter("p_name");
		String id = (String)request.getSession().getAttribute("c_id");
		
		Iterator<ShopCartVO> ite = list.iterator();
		ShopCartVO vo = null;
			while(ite.hasNext()) {
				ShopCartVO listVO = ite.next();
				if(p_name.equals(listVO.getP_name())) {
					vo=listVO;
					break;
				}
			}
			if (vo != null) {
				ShopCartVO cvo = new ShopCartVO();
				cvo.setC_id(id);
				cvo.setP_name(p_name);
				
				list.remove(vo); //카트에서 삭제
				ShopDAO.deleteO(cvo);
				
				vo = null; //더이상 사용안하기때문에!(가비지컬렉터가 삭제처리하도록)
			}
			
			request.getSession().setAttribute("list", list);
			

		return "shopCart.jsp";
	}

}
