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
<title>문의 게시판</title>

<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>

<script>
	function login_chk(frm){
		if("${c_id}" == "") {
			alert("로그인이 필요한 서비스입니다.");
			location.href="PSC?type=CustomerLogin";
		} else{
			if (frm.qc_content.value== " "){
				
				alert("댓글을 입력해주세요");
				frm.qc_content.focus();
				return false;
			} else {
				frm.action = "PSC?type=questionComment&q_idx=${vo.q_idx}";
				frm.submit();
				
			}
		}
		
	}
	
</script>

<style>
.hit{font-weight: bold;}
#hit{color: #ff7f00;}


#main {
	text-decoration: none;	
	opacity: 0.5;
}
#main:hover{text-decoration: underline;}

#content {
	height: 300px;
}

textarea{
	resize:none;
}

#qcContent {
	height: 50px;
}


#click {
	vertical-align: top;
	width: 88px;
	height: 78px;
}

</style>
</head>


<body>
	<%@include file="include/header.jsp"%>

	<div class="container">   
	<div class="row form-group">
		<table class="table table-hover">	                    
		<tr>									
			<td colspan="2"><div class="div0"><strong>${vo.q_subject } &nbsp;&nbsp;&nbsp;</strong><a href="PSC?type=questionList" id="main">| 문의 게시판</a></div></td>
		</tr>
		<tr>
			<td>작성자 : ${vo.q_id }</td>	
			<td>				
				<div class="text-right">
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>					
					${vo.q_date }&nbsp;&nbsp;
					<c:if test="${vo.q_id eq c_id }">
						<a href="#" onclick="modifyok()">|&nbsp;수정&nbsp;|</a>
						<a href="#" onclick="deleteok()">&nbsp;삭제&nbsp;|</a>
					</c:if>
				</div>
			</td>	
		</tr>
		<tr>
			<td colspan="2" id="content">
				<p>${vo.q_content }</p>	
			</td>
		</tr>
		<tr>				
			<input type="hidden" name="cPage" value="${cPage }">			
		</tr>															
		</table>	
	</div>
	</div>	

	<div class="container">   
	<div class="row">
	<div class="hit"><span id="hit">댓글${hit}</span></div>	
	</div>
	<hr>
	</div>
	
	
	
	<div class="container">	
		<c:forEach var="vo" items="${qvo}">				
			<div>
				&nbsp;${vo.qc_id }
				<div class="text-right">
				${vo.qc_date }&nbsp;&nbsp;
				<c:if test="${vo.qc_id eq c_id }">
					<a href="#" onclick="modifyokC('${vo.qc_id}','${vo.qc_idx}')">|&nbsp;수정&nbsp;|</a>
					<a href="#" onclick="deleteokC('${vo.qc_id}', '${vo.qc_idx}')">&nbsp;삭제&nbsp;|</a>
				</c:if>
				</div>
			</div>									
			<div class="qcContent">${vo.qc_content }</div>
			<hr>
			<hr>
		</c:forEach>
	
	<!-- 댓글 입력 폼 -->
		<form method="post" name="frm">
			<p>
			<textarea name="qc_content" rows="3" cols="141"></textarea>
			<input class="btn btn-outline-secondary" id="click" type="button" value="등록" onclick="login_chk(this.form)">
			<input type="hidden" name="qc_idx" value="qc_idx" />
			</p>
		</form>
	</div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>