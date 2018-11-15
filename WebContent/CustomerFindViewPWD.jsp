<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 보여주즈아~</title>
</head>
<body>
	<p> c_id = ${c_id}</p>
	<p> 비밀번호는 ? : ${c_pwd } </p>
	<input type="button" name="login" value="로그인" onclick="location.href='CustomerLogin.jsp'" />
		<input type="button" name="register" value="회원가입" onclick="location.href='CustomerRegister.jsp'" />
		<input type="button" name="logout" value="로그아웃" onclick="location.href='CustomerLogout.jsp'" />
		<input type="button" name="findId" value="아이디 찾기" onclick="location.href='CustomerFindId.jsp'" />
		<input type="button" name="findPwd" value="비밀번호 찾기" onclick="location.href='CustomerFindPwd.jsp'" />
</body>
</html>