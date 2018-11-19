<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@include file="include/include-link.jsp" %>
	<%@include file="include/include-style.jsp" %>
<style>
	h3 {
	text-align : center;
	font-family: "Sandoll MiSaeng"; 
	font-size : 2.0em;
	margin-top : 2em;
	margin-left : -1em;
	margin-bottom : 5em;
	color : #964b00;
	
	}
	
	h3:before {
	content : "●";
	font-size : 1.2em;
	vertical-align : 110%;
	}
	
	h3:after {
	content : "●";
	font-size : 0.7em;
	vertical-align : -140%;
	}
</style>
</head>
<body>
	<%@include file="include/header.jsp"%>
	<h3>결제완료</h3>
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>