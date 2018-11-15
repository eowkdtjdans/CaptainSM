<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스터머메인화면</title>
<script>
</script>
</head>
<body>
	<form method="post">
		<h2>커스터머메인화면</h2>
		<p>${c_id}</p>
		<a href="PSC?type=dogList&cPage=1">dogList로</a>
		<a href="PSC?type=orderList&cPage=1">orderList로</a>
		<a href="CustomerMain.jsp">regist로</a>
		<a href="PSC?type=menu">shop로</a>
		<a href="PSC?type=reviewAll">review로</a>
		<a href="PSC?type=questionList">question로</a>
		<input type="button" name="logout" value="로그아웃" onclick="location.href='CustomerLogout.jsp'" />
		<input type="button" name="findId" value="아이디 찾기" onclick="location.href='CustomerFindId.jsp'" />
		<input type="button" name="findPwd" value="비밀번호 찾기" onclick="location.href='CustomerFindPwd.jsp'" />
	</form>

</body>
</html>