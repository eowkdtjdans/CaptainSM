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
			if (frm.qc_content.value == ""){
				alert("댓글을 입력해주세요");
				frm.qc_content.focus();
				return false;
			} else {
				frm.action = "PSC?type=questionComment&q_idx=${vo.q_idx}";
				frm.submit();
				
			}
		}
		
	}
	
	function modifyokC(qc_idx) {
		if(confirm("정말 수정하시겠습니까?")){
			location.href="PSC?type=questionModifyComment&q_idx=${vo.q_idx}&qc_idx=" + qc_idx;
		} else {
			return false;
		}
	}
	
	function deleteokC(qc_idx) {
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="PSC?type=questionDeleteComment&q_idx=${vo.q_idx}&qc_idx=" + qc_idx;
		} else {
			return false;
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

#qcDate {
	font-size: small;
}

#qc {
	margin-top: 0px;
	margin-bottom: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
}

#atag-size {
	font-size: small;
	text-decoration: none;
	color: black;
}

div a:hover {
	text-decoration: underline;
	color: #808080;
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
					${vo.q_date }&nbsp;&nbsp;
					<c:if test="${vo.q_id eq c_id }">
						|<a href="#" onclick="location.href='PSC?type=questionModify&q_idx=${vo.q_idx}'">&nbsp;수정&nbsp;</a>|
						<a href="#" onclick="location.href='PSC?type=questionDelete&q_idx=${vo.q_idx}'">&nbsp;삭제&nbsp;</a>|
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
	
	
	
	<div class="container" id="qc">	
		<c:forEach var="vo" items="${qvo}">				
			<div>
				&nbsp;<strong>${vo.qc_id}</strong>
				<span id="qcDate">
					${vo.qc_date }
				</span>
				<c:if test="${vo.qc_id eq c_id }">
					|<a id="atag-size" href="#" onclick="modifyokC('${vo.qc_idx}')">&nbsp;수정&nbsp;</a>|
					<a id="atag-size" href="#" onclick="deleteokC('${vo.qc_idx}')">&nbsp;삭제&nbsp;</a>|
				</c:if>
			</div>									
			<div class="qcContent">&nbsp;${vo.qc_content }</div>
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
		
		
		<!-- 페이징 -->
		<ul class="pagination justify-content-center">
      	<li class="page-item">
      		<c:choose>
				<c:when test="${pvo.beginPage > pvo.pagePerBlock}">
					<li>
						<a class="page-link" href="PSC?type=questionView&q_idx=${vo.q_idx }&cPage=${pvo.beginPage - 3}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
			            	<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a class="page-link" href="PSC?type=questionView&q_idx=${q_idx}&cPage=${pvo.beginPage}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
			            	<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}">
				<c:choose>
					<c:when test="${k == pvo.nowPage}">
						<li class="page-item">
							<a class="page-link" >${k }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
        						<a class="page-link" href="PSC?type=questionView&q_idx=${q_idx}&cPage=${k}">${k }</a>
     						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pvo.endPage < pvo.totalPage}">
					<li class="page-item">
			          <a class="page-link" href="PSC?type=questionView&q_idx=${q_idx}&cPage=${pvo.endPage + 1}" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            <span class="sr-only">Next</span>
			          </a>
			       </li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
			          <a class="page-link" href="PSC?type=questionView&q_idx=${q_idx}&cPage=${pvo.endPage}" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            <span class="sr-only">Next</span>
			          </a>
			       	</li>
				</c:otherwise>
			</c:choose>
		</ul>
		
	</div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>