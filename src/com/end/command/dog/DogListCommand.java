package com.end.command.dog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.dao.DogDAO;
import com.end.vo.DogVO;
import com.end.vo.PagingVO;

public class DogListCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		PagingVO pvo = new PagingVO(); //페이징VO 객체생성
		
		int totalDog = DogDAO.countDogList();
		
		int totalPage = DogDAO.countDogList(); //DOG테이블 데이터수 조회후 전체 페이지(게시글)수 지정
		
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
		
		//DOG테이블 전체 조회
		List<DogVO> dogList = DogDAO.selectAllDog(map);
		
		//견종별 조회가능하게 해주는 데이터 조회
		List<DogVO> dogTypeList = DogDAO.selectDogType();
		Map dogType = new HashMap<>();
		
		for(int i=0; i<dogTypeList.size(); i++) {
			dogType.put(dogTypeList.get(i).getD_type(), DogDAO.cntDogType(dogTypeList.get(i).getD_type()));
		}
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("dogList", dogList);
		
		request.getSession().setAttribute("totalDog", totalDog);
		request.getSession().setAttribute("dogType", dogType);
		
		
		return "dogList.jsp";
	}

}
