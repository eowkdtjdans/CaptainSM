package com.end.command.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.QuestionVO;
import com.end.vo.PagingVO;

public class QuestionListCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		PagingVO p = new PagingVO();
		p.setNumPerPage(10);
		p.setPagePerBlock(10);
		p.setTotalRecord(QuestionDAO.QuestionGetTotalCount());
		p.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
				
		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<QuestionVO> questList = QuestionDAO.QuestionGetList(map);
		request.setAttribute("questList", questList);
		request.setAttribute("pvo", p);	
		
		
		
		
		return "QuestionList.jsp";
		
	}

}








