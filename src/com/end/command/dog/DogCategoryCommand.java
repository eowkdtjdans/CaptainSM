package com.end.command.dog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.dao.DogDAO;
import com.end.vo.DogVO;
import com.end.vo.PagingVO;

public class DogCategoryCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		PagingVO pvo = new PagingVO();
		String dogCategory = request.getParameter("dogCategory");
		
		Map dogType = (HashMap)request.getSession().getAttribute("dogType");
		int totalPage = (int)dogType.get(dogCategory);
		
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
		
		DogVO dvo = new DogVO();
		dvo.setD_begin(pvo.getBegin());
		dvo.setD_end(pvo.getEnd());
		dvo.setD_type(dogCategory);
		
		List<DogVO> dCategoryList = DogDAO.selectDogCategory(dvo);
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("dCategoryList", dCategoryList);
		request.setAttribute("dogCategory", dogCategory);
		
		return "dogCategory.jsp";
	}

}
