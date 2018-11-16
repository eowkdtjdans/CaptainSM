package com.end.command.dog;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.dao.DogDAO;
import com.end.vo.DogVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DogListWriteCommand implements PetShopCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = null;
		String path = null;
		
		chk = request.getParameter("chk");
		
		if(chk == null) {
			path = "dogListWrite.jsp";
		} else {
			String dbPath = "/CaptainSM/upload";
			String uploadPath = "C:/Users/1027/Desktop/PETSHOP/WebContent/upload";
			int size = 30*1024*1024;

			File upDir = new File(uploadPath);
			if(!upDir.exists()) {
				upDir.mkdirs();
			}
			
			try {
				MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
				
				String d_title = mr.getParameter("d_title");
				String d_type = mr.getParameter("d_type");
				String d_fur = mr.getParameter("d_fur");
				String d_name = mr.getParameter("d_name");
				String d_size = mr.getParameter("d_size");
				int d_age = Integer.parseInt(mr.getParameter("d_age"));
				String d_intro = mr.getParameter("d_intro");
				
				Enumeration files = mr.getFileNames();
				String d_img1 = null;
				String d_img2 = null;
				String d_img3 = null;
				
				while(files.hasMoreElements()) {
					files.nextElement();
					if(mr.getFilesystemName("f_name1") != null) {
						d_img1 = dbPath + "/" + mr.getFilesystemName("f_name1");
					} else if (mr.getFilesystemName("f_name1") == null) {
						d_img1 = "noImg";
					}
					if(mr.getFilesystemName("f_name2") != null) {
						d_img2 = dbPath + "/" + mr.getFilesystemName("f_name2");
					} else if (mr.getFilesystemName("f_name2") == null) {
						d_img2 = "noImg";
					}
					if(mr.getFilesystemName("f_name3") != null) {
						d_img3 = dbPath + "/" + mr.getFilesystemName("f_name3");
					} else if (mr.getFilesystemName("f_name3") == null) {
						d_img3 = "noImg";
					}
				}
				
				
				DogVO dvo = new DogVO();
				dvo.setD_title(d_title);
				dvo.setD_type(d_type);
				dvo.setD_fur(d_fur);
				dvo.setD_size(d_size);
				dvo.setD_name(d_name);
				dvo.setD_age(d_age);
				dvo.setD_intro(d_intro);
				dvo.setD_img1(d_img1);
				dvo.setD_img2(d_img2);
				dvo.setD_img3(d_img3);
				dvo.setC_id((String)request.getSession().getAttribute("c_id"));
				
				DogDAO.dogListWrite(dvo);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			path = "PSC?type=dogList&cPage=1";
		}
		
		return path;
	}

}
