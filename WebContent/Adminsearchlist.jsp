<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 가입 조회</title>
</head>
<body>
	<h1>전체 가입 조회</h1>
	<div>
		<ul>
		<c:forEach var="c" items="${list }">
			<li>${c.c_id}, ${c.c_pwd }, 
				${c.c_name }, ${c.c_phone }, ${c.c_addr }, ${c.c_gender }, ${c.c_email }</li>
		</c:forEach>
		</ul>
		<input type="button" class="btn btn-info" onclick="location.href='AdminMain.jsp'" value="뒤로가기"/>
	</div>
</body>
</html>