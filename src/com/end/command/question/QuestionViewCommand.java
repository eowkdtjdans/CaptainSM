package com.end.command.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.QuestionDAO;
import com.end.vo.PagingVO;
import com.end.vo.QcommentVO;
import com.end.vo.QuestionVO;


public class QuestionViewCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		
		PagingVO pvo = new PagingVO(); //페이징VO 객체생성
		
		int totalQC = QuestionDAO.QuestionCommentCount(q_idx);
		
		int totalPage = totalQC; //테이블 데이터수 조회후 전체 페이지(게시글)수 지정
		
		pvo.setTotalRecord(totalPage);
		pvo.setTotalPage();
		
		String cPage = request.getParameter("cPage"); //현재 페이지값 request스코프에서 받아오기
		
		if(cPage != null) {
			pvo.setNowPage(Integer.parseInt(cPage)); //현재 페이지값이 null이 아니면 PagingVO에 현재페이지값 저장
		}
		
		pvo.setEnd(pvo.getNowPage() * pvo.getNumPerPage()); //end값 구하기
		pvo.setBegin(pvo.getEnd() - pvo.getNumPerPage() + 1); //begin값 구하기
		
		int nowPage = pvo.getNowPage(); //현재페이지 객체생성
		
		pvo.setBeginPage((nowPage - 1) / pvo.getPagePerBlock()  * pvo.getPagePerBlock() + 1); //begin페이지 구하기
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock() - 1); //begin페이지 구하기
		
		if (pvo.getEndPage() > pvo.getTotalPage()) {
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		map.put("q_idx", Integer.parseInt(q_idx));
		
		QuestionVO vo = QuestionDAO.QuestionOneList(q_idx);			
		List<QcommentVO> qvo = QuestionDAO.QuestionOneList2(map);
		System.out.println("qvo: " + qvo);
	
		int hit = QuestionDAO.QuestionCommentCount(q_idx);
		
		QuestionDAO.QuestionCountUp(q_idx);
		
		request.getSession().setAttribute("qvo", qvo);
		request.getSession().setAttribute("vo", vo);
		request.getSession().setAttribute("hit", hit);
		
		request.setAttribute("vo", vo);
		request.setAttribute("q_idx", q_idx);
		request.setAttribute("pvo", pvo);
		
		return "QuestionView.jsp";
		
	}

}
