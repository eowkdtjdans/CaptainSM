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

public class ReviewWriteCommand implements PetShopCommand {

	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ServletContext sc = request.getSession().getServletContext();
		String imagesPath = sc.getRealPath("/images");
		System.out.println("realPath: " + sc.getRealPath("/images"));
		String path = "";
		
		try {
			request.setCharacterEncoding("utf-8");
			MultipartRequest mr = new MultipartRequest(
					request, //MultipartRequest에서 request 정보 사용
					imagesPath, //실제 파일을 저장하기 위한 경로
					10 * 1024 * 1024, //업로드 파일의 최대용량(byte 단위)
					"UTF-8", //인코딩 타입
					new DefaultFileRenamePolicy() //파일이름 중복처리
					
					);
			
			String r_idx, r_id, r_title, r_phone, r_content, r_image_l, chk = "";
			
			r_image_l = mr.getOriginalFileName("r_image_l");
			
			r_idx = mr.getParameter("r_idx");
			chk = mr.getParameter("write_chk");
			r_id = mr.getParameter("r_id");
			r_title = mr.getParameter("r_title");
			r_phone = mr.getParameter("r_phone");
			r_content = mr.getParameter("r_content");
			
			System.out.println("r_image_l : " + r_image_l );
			
			if (chk == null) {
				
			} else {
				
				//전에 쓰던거
				ReviewDataVO vo = new ReviewDataVO();
				vo.setR_id(r_id);
				vo.setR_title(r_title);
				vo.setR_phone(r_phone);
				vo.setR_content(r_content);
				
				if (r_image_l != null) {
					vo.setR_image_l(r_image_l);
					ReviewDAO.insert(vo);
					
				} else if (r_image_l == null) {
					ReviewDAO.insert2(vo);
					
				}
				
				path = "PSC?type=reviewAll";
				
			}
			
			return path;
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}//catch
		
		return path;
		
	}//exec method

}
