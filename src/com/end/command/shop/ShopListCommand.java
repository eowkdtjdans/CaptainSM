package com.end.command.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ShopDAO;
import com.end.vo.ShopPagingVO;
import com.end.vo.ShopVO;

public class ShopListCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ShopPagingVO vo = new ShopPagingVO();
		request.setAttribute("nowPage", request.getParameter("nowPage"));		
		
		if(request.getParameter("fullname") != null) {
			System.out.println("제품검색");
			request.getSession().setAttribute("fullname", request.getParameter("fullname"));
		} else if((request.getSession().getAttribute("fullname") != null) && (request.getParameter("move") != null )) {
			System.out.println("제품검색 후에 이동할때");
			
		} else if(request.getSession().getAttribute("category") == null ) {
			System.out.println("처음 카테고리에 리스트 조회할때");
			request.getSession().setAttribute("category", request.getParameter("category"));
			
		} else if(request.getParameter("category") != null) {
			System.out.println("카테고리를 이동해서 조회할때");
			request.getSession().setAttribute("category", request.getParameter("category"));
			if(request.getSession().getAttribute("fullname") != null) {
				request.getSession().removeAttribute("fullname");
			}
			
		} else if(request.getParameter("move") != null) {
			System.out.println("페이지를 이동했을때");
			request.getSession().setAttribute("category", request.getParameter("category"));
			if(request.getSession().getAttribute("fullname") != null) {
				request.getSession().removeAttribute("fullname");
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		//전체 게시물 수 객체에 저장
		if( request.getParameter("fullname") != null) {
			System.out.println("전체 게시물 수 객체에 저장");
			String fullname = request.getParameter("fullname");
			
			Map<String, String> map2 = new HashMap<>(); 
			
			map2.put("category", (String) request.getSession().getAttribute("category"));
			map2.put("fullname", fullname);
			
			vo.setTotal(ShopDAO.getTotal2(map2));
			
		} else {
				vo.setTotal(ShopDAO.getTotal(request.getParameter("category")));
				
		}

		//전체 페이지 수 저장
		vo.calPage();
		
		//현재 페이지 구해서 저장
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			vo.setNowPage(Integer.parseInt(nowPage));
		}
		
		request.getSession().setAttribute("goPage", nowPage);
		System.out.println("nowPage : " + nowPage);
		
		//페이지의 시작번호 끝 번호 구해서 저장
		vo.setEnd(vo.getNowPage()*vo.getPagePer());
		
		vo.setBegin(vo.getEnd()-vo.getPagePer()+1);
		
		//시작,끝 페이지 구해서 저장
		vo.setBeginPage((vo.getNowPage() - 1) / vo.getBlockPer() * vo.getBlockPer() + 1);
		vo.setEndPage(vo.getBeginPage() + vo.getBlockPer() - 1);
		
		//끝페이지(endPage)가 총페이지(totalPage)보다 크면
		//endPage = totalPage 설정
		if (vo.getEndPage() > vo.getPage()) {
			vo.setEndPage(vo.getPage());
		}
		
		if((request.getSession().getAttribute("fullname") == null)) {
		//DB에서 게시글 데이타 가져오기(카테고리로)
		System.out.println("//DB에서 게시글 데이타 가져오기(카테고리로)");
		Map<String, String> map = new HashMap<>();
		
		map.put("begin", String.valueOf(vo.getBegin()));
		map.put("end", String.valueOf(vo.getEnd()));
		map.put("category", request.getParameter("category"));
		
		List<ShopVO> list = ShopDAO.getData(map);
		
		request.setAttribute("pvo", vo);
		
		request.setAttribute("list", list);
		
		//DB에서 게시글 데이타 가져오기(카테고리랑 이름으로)
		} else if ( request.getSession().getAttribute("fullname") != null) {
		System.out.println("request.getParameter(\"fullname\") : " + request.getParameter("fullname"));
		Map<String, String> map3 = new HashMap<>();
		
		map3.put("begin", String.valueOf(vo.getBegin()));
		map3.put("end", String.valueOf(vo.getEnd()));
		map3.put("category", (String) request.getSession().getAttribute("category"));
		map3.put("name",(String)request.getSession().getAttribute("fullname"));
		
		List<ShopVO> list2 = ShopDAO.getData2(map3);
		
		request.setAttribute("pvo", vo);
		
		request.setAttribute("list", list2);
		
		request.setAttribute("nowPage", 1);
		}
		
				
		return "shopList.jsp";
	}

}
