<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//sessin의 값을 삭제 하고 main페이지로 이동 시킵니다.

if(session!= null) {
//	session.invalidate();
request.getSession().invalidate();
response.sendRedirect("index.jsp");
}
%>