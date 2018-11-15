<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>

<title>펫샵 - dogListWrite</title>

<script>
	function dogListWrite_ok(frm) {
		frm.action="PSC?type=dogListWrite&chk=chk";
		frm.submit();
	}
</script>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="write">
		<form method="post" enctype="multipart/form-data">
			<ul>
				<li>
					제목: <input type="text" name="d_title">
				</li>
				<li>
					견종: 
					<select size="1" name="d_type">
						<option selected>포메라니안</option>
						<option>폼피츠</option>
						<option>말티즈</option>
						<option>비숑프리제</option>
						<option>웰시코기</option>
						<option>푸들</option>
						<option>치와와</option>
						<option>닥스훈트</option>
						<option>미니핀</option>
						<option>치와와</option>
						<option>프렌치불독</option>
						<option>시츄</option>
						<option>코카스파니엘</option>
						<option>요크셔</option>
						<option>이탈리안그레이하운드</option>
						<option>시바견</option>
						<option>킹찰스스패니얼</option>
						<option>골든리트리버</option>
						<option>래브라도리트리버</option>
						<option>비글</option>
						<option>대장성문</option>
						<option>빠삐용</option>
						<option>샤페이</option>
						<option>김성문</option>
						<option>기타</option>
					</select>
				</li>
				<li>
					모색: <input type="text" name="d_fur">
				</li>
				<li>
					이름: <input type="text" name="d_name">
				</li>
				<li>
					나이: <input type="text" name="d_age">
				</li>
				<li>
					크기:
						<select size="1" name="d_size">
							<option selected>T-CUP</option>
							<option>SMALL</option>
							<option>MEDIUM</option>
							<option>LARGE</option>
							<option>XXX LARGE</option>
						</select>
				</li>
				<li>
					소개: <textarea rows="2" cols="80" name="d_intro"></textarea>
				</li>
				<li>
					본문사진1 : <input type="file" name="f_name1">
				</li>
				<li>
					본문사진2 : <input type="file" name="f_name2">
				</li>
				<li>
					본문사진3 : <input type="file" name="f_name3">
				</li>
				<li>
					<input type="submit" value="완료" onclick="dogListWrite_ok(this.form)">
				</li>
			</ul>
		</form>
	</div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>