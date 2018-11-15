package com.end.command.review;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.dog.PetShopCommand;
import com.end.dao.ReviewDAO;
import com.end.vo.ReviewDataVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewUpdateCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ServletContext sc = request.getSession().getServletContext();
		String imagesPath = sc.getRealPath("/images");
		String path = "";
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request,
					imagesPath,
					10 * 1024 * 1024,
					"utf-8",
					new DefaultFileRenamePolicy()
					
					);
			
			String chk = mr.getParameter("update_chk");
			String r_image_l = mr.getOriginalFileName("r_image_l");
			String r_idx = mr.getParameter("r_idx");
			
			mr.getParameter("r_title");
			mr.getParameter("r_phone");
			mr.getParameter("r_content");
			mr.getParameter("r_idx");
			
			if (chk == null) {
				path = "reviewUpdate.jsp";
				
			} else {
				
				//전에 쓰던거
				ReviewDataVO vo = new ReviewDataVO();
				vo.setR_title(mr.getParameter("r_title"));
				vo.setR_phone(mr.getParameter("r_phone"));
				vo.setR_content(mr.getParameter("r_content").trim());
				vo.setR_idx(mr.getParameter("r_idx"));
				
				if (r_image_l == null) {
					//사진 업로드 X
					ReviewDAO.update(vo);
					
				} else {
					//사진 업로드 O
					vo.setR_image_l(r_image_l);
					ReviewDAO.update2(vo);
					
				}
				
				path = "PSC?type=reviewOnelist&r_idx=" + r_idx;
				return path;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return path;
	}

}
