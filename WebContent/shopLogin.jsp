<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디 : ${p_name}</h1>
	<h1>구매</h1>
	<h2>회원 구매</h2>
	아이디 : <input type="text">
	패스워드 : <input type="password">
	로그인 : <a href="PSC?type=${type}&p_name=${p_name}">로그인</a>
	
	<%
		System.out.println("type : " + request.getAttribute("type"));
		System.out.println("p_name : " + request.getAttribute("p_name"));
		//request.getSession().setAttribute("아이디", "hann");
	%>
	
	<hr>
	아직 회원이 아니세요? <a href="#">회원가입</a>
	회원 아이디를 잊으셨나요? <a href="#">아이디찾기</a>
	비밀번호가 생각 안나세요? <a href="#">비밀번호찾기</a>
	
	<hr>
	<h2>간편 로그인</h2>
	<a href="#">카카오톡으로 구매하기</a>
	
</body>
</html>