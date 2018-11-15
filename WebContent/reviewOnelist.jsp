<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width", initial-scale=1 >
	<link rel="stylesheet" href="css/bootstrap.css">
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	#pic {
		float: left;
	}
</style>
<script>

	function check_cus(obj, num) {
		var c_id = "${CustomerVO.getC_id() }";
		var r_id = "${ReviewDataVO.getR_id()}";
		
		if (c_id == "") {
			
			alert("로그인을 해주세요");
			history.back(-2);
		 
		} else if (c_id != r_id) {
			alert("아이디불일치");
			alert("본인의 게시글만 삭제 또는 수정할수 있습니다");
			history.back(-2);
		
		} else if (c_id == r_id) {
			
			alert("아이디일치");
			if (obj.value == "글삭제") {
			 frm.action = "PSC?type=reviewDelete";
			 
			} else if (obj.value == "글수정") {
				frm.action = "reviewUpdate.jsp";
			}
			
			var chkConfirm = confirm("파일을 수정 또는 삭제하시겠습니까?");
			if (chkConfirm) {
				frm.submit();
			} else {
				history.back(-2);
			}
			
		}
	  	
		frm.submit();

	}
	
	
	function c_write_go(frm) {
		document.write
		frm.action = "PSC?type=reviewWriteC";
		frm.submit();
	}

	function c_oneList_go(frm) {
		frm.action = "PSC?type=reviewOneListC";
		frm.submit();
	}
	function c_delete_go(frm) {
		frm.action = "PSC?type=reviewDeleteC";
		frm.submit();
	}
	
</script>
</head>
<body>
<div id="bbs">

	<h2>자료 목록</h2>
	<p class="button"><a href="PSC?type=reviewAll">[목록으로 이동]</a></p>
	<%-- <p><a href="MyCon?type=all&cPage=${nowPage }">[목록으로 이동]</a></p> --%>
	<hr>
	<form method="post" id="frm" name="frm">
	<div class="container">
	<div class="row form-group">
	<table border="1" class="table table-default">
		<thead>
			<tr>
				<th>번호</th>	
				<td>${ReviewDataVO.getR_idx() }</td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td>${ReviewDataVO.getR_id() }</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>${ReviewDataVO.getR_title() }</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>${ReviewDataVO.getR_phone() }</td>
			</tr>
			
			<tr>
				<th>작성일자</th>
				<td>${ReviewDataVO.getR_date() }</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<div float="right"; >
				<td colspan="2" id="content">
					<pre>${ReviewDataVO.getR_content() }
					<c:choose>
						<c:when test="${ReviewDataVO.getR_image_l() == null }" >
						</c:when>
						<c:otherwise>
								<img src="images/${ReviewDataVO.getR_image_l() }" id="pic">
						</c:otherwise>
					</c:choose>
					</pre>
				</td>
				</div>
			</tr>
			
		</thead>
		
		<tbody>
			<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">	
			<tr>
				<td>
				</td>
				<td>
					<input type="button" value="글수정" onclick="check_cus(this, 'upda')">
					<input type="button" value="글삭제" onclick="check_cus(this, 'del')">
				</td>
			</tr>
			
		</tbody>
	</table>
	</div>
	</div>
	</form>
	
	<!-- 댓글 입력폼 -->
	<form method="post">
		<table>
		<p>글번호: <input type="text" name="r_idx" value="${ReviewDataVO.getR_idx() }" readonly></p>
		<p>닉네임:  <input type="text" name="rc_name"></p>
		<p>아이디: <input type="text" name="rc_id"></p>
		<p>비밀번호: <input type="password" name="rc_pwd"></p>
		
		<!-- <p>폰번호: <input type="text" name="rc_phone"></p> -->
		<p><textarea name="rc_content" rows="5" cols="55"></textarea></p>
		
		<input type="button" value="댓글작성" onclick="c_write_go(this.form)">
		<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">
		
		</table>
	</form>
	
	<!-- 댓글 출력폼 -->
		<c:forEach var="voC" items="${listC }">
		<div>
			<form method="post" name="frm2">
			<tr>
				<p>댓글번호: ${voC.getRc_idx() }</p>
				<p>아이디: ${voC.getRc_id() }</p>
				<p>닉네임: ${voC.getRc_name() }</p>
				<%-- <p>핸드폰번호: ${voC.getRc_phone() }</p> --%>
				<p>날짜: ${voC.getRc_date() }</p>
				<p>내용: ${voC.getRc_content() }</p>
				<input type="button" value="댓글수정" onclick="c_oneList_go(this.form)">
				<input type="button" value="댓글삭제" onclick="c_delete_go(this.form)">
				
				
				<input type="hidden" name="rc_idx" value="${voC.getRc_idx() }">
				<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">
				
			</tr>
			</form>
		</div>
		</c:forEach>

</div>
</body>
</html>