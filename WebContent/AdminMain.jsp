<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면</title>

<script>
	function search(frm) {
		frm.action = "PSC?type=AdminSearch";
		frm.submit();
	} function delete(frm) {
		frm.action = "PSC?type=AdminDelete";
		frm.submit();
	}
</script>

</head>
<body>
	<form method="post">
		<h2>관리자메인화면</h2>
		<p>${c_id}</p>
		<input type="button" name="logout" value="로그아웃" onclick="location.href='CustomerLogout.jsp'" />
		<input type="button" name="search" value="회원정보 검색" onclick="location.href='Adminsearch.jsp'"/>
		<input type="button" name="delete" value="회원정보 삭제" onclick="location.href='Admindelete.jsp'"/>
	</form>

</body>
</html>