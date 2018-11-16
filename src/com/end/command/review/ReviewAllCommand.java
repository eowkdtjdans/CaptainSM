package com.end.command.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;
import com.end.vo.CustomerVO;
import com.end.vo.ReviewDataVO;

public class ReviewAllCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<ReviewDataVO> list = ReviewDAO.getList();
		request.setAttribute("list", list);

		//맨처음은 null값이니까 그냥 집어넣는다 나중에 로그인완료일때 selectOne으로 CustomerVO에 박아넣는다

		CustomerVO cvo = new CustomerVO();
		cvo.setC_idx("4");
		cvo.setC_id((String)request.getSession().getAttribute("c_id"));
		/*cvo.setC_pwd("123");
		cvo.setC_name("123");
		cvo.setC_phone("123");
		cvo.setC_addr("123");
		cvo.setC_gender("남자");
		cvo.setC_email("123");*/
		
		
		request.getSession().setAttribute("CustomerVO", cvo);
		
		return "reviewAll.jsp";
	}

}
