package com.end.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.end.command.admin.AdminDeleteCommand;
import com.end.command.admin.AdminLoginCommand;
import com.end.command.admin.AdminSearchCommand;
import com.end.command.customer.CustomerFindIdCommand;
import com.end.command.customer.CustomerFindPwdCommand;
import com.end.command.customer.CustomerListCommand;
import com.end.command.customer.CustomerLoginCommand;
import com.end.command.customer.CustomerMainCommand;
import com.end.command.customer.CustomerRegisterCommand;
import com.end.command.customer.JSONEmailCheckCommand;
import com.end.command.customer.JSONIDcheckCommand;
import com.end.command.customer.JSONLoginCheckCommand;
import com.end.command.customer.JSONfindIdCommand;
import com.end.command.customer.JSONfindPwdCommand;
import com.end.command.customer.JSONphoneCehckCommand;
import com.end.command.dog.DogCategoryCommand;
import com.end.command.dog.DogListCommand;
import com.end.command.dog.DogListViewCommand;
import com.end.command.dog.DogListWriteCommand;
import com.end.command.dog.PetShopCommand;
import com.end.command.order.OrderListCommand;
import com.end.command.order.OrderListViewCommand;
import com.end.command.question.QuestionCModifyCommand;
import com.end.command.question.QuestionCModifyCommand2;
import com.end.command.question.QuestionCdeleteCommand;
import com.end.command.question.QuestionDeleteCommand;
import com.end.command.question.QuestionListCommand;
import com.end.command.question.QuestionModify2Command;
import com.end.command.question.QuestionModifyCommand;
import com.end.command.question.QuestionQcommentCommand;
import com.end.command.question.QuestionViewCommand;
import com.end.command.question.QuestionWriteCommand;
import com.end.command.review.ReviewAllCommand;
import com.end.command.review.ReviewDeleteCommand;
import com.end.command.review.ReviewDeleteCommnadC;
import com.end.command.review.ReviewOneListCommand;
import com.end.command.review.ReviewUpdateCommnadC;
import com.end.command.review.ReviewWriteCommand;
import com.end.command.review.ReviewWriteCommnadC;
import com.end.command.shop.ShopCartCommand;
import com.end.command.shop.ShopCartViewCommand;
import com.end.command.shop.ShopDeleteCommand;
import com.end.command.shop.ShopExCommand;
import com.end.command.shop.ShopListCommand;
import com.end.command.shop.ShopListViewCommand;
import com.end.command.shop.ShopLoginCommand;
import com.end.command.shop.ShopMenuCommand;
import com.end.command.shop.ShopPay2Command;
import com.end.command.shop.ShopPayCommand;
import com.end.command.shop.ShopPayOkCommand;
import com.end.command.shop.UpdateCommand;

@WebServlet("/PSC")
public class PetShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //諛쏆븘�삤�뒗 �뜲�씠�꽣 �삎�떇 UTF-8濡� 吏��젙
		response.setContentType("text/html;charset=UTF-8"); //�쓳�떟�떆 �뜲�씠�꽣 �삎�떇 UTF-8濡� 吏��젙
		
		String type = request.getParameter("type"); //request�뒪肄뷀봽�뿉 �엳�뒗 type �뜲�씠�꽣 諛쏆븘�샂
		PrintWriter out = response.getWriter();
		
		PetShopCommand comm = null; //而ㅻ㎤�뱶�삎�떇�쓽 媛앹껜 �깮�꽦
		
		if (type.equals("JSONidcheck")) {
			comm = new JSONIDcheckCommand();
		} else if(type.equals("JSONemailCheck")) {
			comm = new JSONEmailCheckCommand();
		} else if (type.equals("JSONloginCheck")) {
			comm = new JSONLoginCheckCommand();
		} else if (type.equals("JSONphoneCheck")) {
			comm = new JSONphoneCehckCommand();
		} else if (type.equals("JSONFindIDCheck")) {
			comm = new JSONfindIdCommand();
		} else if (type.equals("JSONFindPWDCheck")) {
			comm = new JSONfindPwdCommand();
		} else {
			doProcess(request, response);
		}
		
		String result = comm.exec(request, response);
		out.println(result);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); //doPost�삎�떇�쓽 �뜲�씠�꽣 �뱾�뼱�삱�떆 doGet�쑝濡� �뜲�씠�꽣 �쟾�떖
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //諛쏆븘�삤�뒗 �뜲�씠�꽣 �삎�떇 UTF-8濡� 吏��젙
		response.setContentType("text/html;charset=UTF-8"); //�쓳�떟�떆 �뜲�씠�꽣 �삎�떇 UTF-8濡� 吏��젙
		
		String type = request.getParameter("type"); //request�뒪肄뷀봽�뿉 �엳�뒗 type �뜲�씠�꽣 諛쏆븘�샂
		String path = null; //寃쎈줈 媛앹껜 �깮�꽦
		
		PetShopCommand comm = null; //而ㅻ㎤�뱶�삎�떇�쓽 媛앹껜 �깮�꽦
		
		if(type.equals("main")) {
			
		} else if(type.equals("dogList")) { //dog
			comm = new DogListCommand();
		} else if(type.equals("dogListView")) {
			comm = new DogListViewCommand();
		} else if(type.equals("dogCategory")) {
			comm = new DogCategoryCommand();
		} else if(type.equals("dogListWrite")) {
			comm = new DogListWriteCommand();
		} else if(type.equals("orderList")) { //order
			comm = new OrderListCommand();
		} else if(type.equals("orderListView")) {
			comm = new OrderListViewCommand();
		} else if(type.equals("CustomerRegister")) { //customer
			comm = new CustomerRegisterCommand();
		} else if (type.equals("CustomerList")) { 
			comm = new CustomerListCommand();
		} else if (type.equals("CustomerLogin")) { 
			comm = new CustomerLoginCommand(); 		
		} else if (type.equals("CustomerFindId")) {
			comm = new CustomerFindIdCommand();
		} else if (type.equals("CustomerFindPwd")) {
			comm = new CustomerFindPwdCommand();
		} else if (type.equals("CustomerMain")) {
			comm = new CustomerMainCommand();
		} else if (type.equals("AdminSearch")) { //admin 
			comm = new AdminSearchCommand();
		} else if (type.equals("AdminDelete")) {
			comm = new AdminDeleteCommand();  
		} else if (type.equals("CustomerAdmin")) {
			comm = new AdminLoginCommand();
		} else if (type.equals("menu")) {
			comm = new ShopMenuCommand();
		} else if (type.equals("List")) {
			comm = new ShopListCommand();
		} else if (type.equals("OneList")) {
			comm = new ShopListViewCommand();
		} else if (type.equals("login")) {
			comm = new ShopLoginCommand();
		} else if (type.equals("cart")) {
			comm = new ShopCartCommand();
		} else if (type.equals("cart_view")) {
			comm = new ShopCartViewCommand();
		} else if (type.equals("pay")) {
			comm = new ShopPayCommand();
		} else if (type.equals("pay2")) {
			comm = new ShopPay2Command();
		} else if (type.equals("payOk")) {
			comm = new ShopPayOkCommand();
		} else if (type.equals("update")) {
			comm = new UpdateCommand();
		} else if (type.equals("delete")) {
			comm = new ShopDeleteCommand();
		} else if (type.equals("ex")) {
			comm = new ShopExCommand();
		} 
		
		
		
		else if (type.equals("reviewAll")) {
			comm = new ReviewAllCommand();
		} else if (type.equals("reviewOnelist")) {
			comm = new ReviewOneListCommand();
		} else if (type.equals("reviewWrite")) {
			comm = new ReviewWriteCommand();
		} else if (type.equals("reviewUpdate")) {
			comm = new UpdateCommand();
		} else if (type.equals("reviewDelete")) {
			comm = new ReviewDeleteCommand();
		} else if (type.equals("reviewWriteC")) {
			comm = new ReviewWriteCommnadC();
		} else if (type.equals("reviewUpdateC")) {
			comm = new ReviewUpdateCommnadC();
		} else if (type.equals("reviewDeleteC")) {
			comm = new ReviewDeleteCommnadC();
		}
		
		
		
		else if (type.equals("questionList")) {
			comm = new QuestionListCommand();
		} else if (type.equals("questionWrite")) {
			comm = new QuestionWriteCommand();
		} else if (type.equals("questionView")) {
			comm = new QuestionViewCommand();
		} else if (type.equals("questionModify")) {
			comm = new QuestionModifyCommand();
		} else if (type.equals("questionModify2")) {
			comm = new QuestionModify2Command();
		} else if (type.equals("questionComment")) {
			comm = new QuestionQcommentCommand();
		} else if (type.equals("questionModifyComment")) {
			comm = new QuestionCModifyCommand();
		} else if (type.equals("questionModifyComment2")) {
			comm = new QuestionCModifyCommand2();
		} else if (type.equals("questionDeleteComment")) {
			comm = new QuestionCdeleteCommand();
		} else if (type.equals("questionDelete")) {
			comm = new QuestionDeleteCommand();
		} 
		
		path = comm.exec(request, response); //path媛앹껜�뿉 而ㅻ㎤�뱶�뿉�꽌 諛쏆븘�삩 request�� response�뜲�씠�꽣 吏��젙
		request.getRequestDispatcher(path).forward(request, response); //path�뿉 �슂泥��쓣 �떎�뻾�븯硫� 洹멸납�쑝濡� request�� response�뜲�씠�꽣 �쟾�떖
		
	}

}
