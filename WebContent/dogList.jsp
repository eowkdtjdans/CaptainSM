<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫샵 - dogList</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>

<style>
	#categoryTable {
		border: 1px solid #808080;
		height: 100px;
		width: 1110px;
		padding: 10px 20px;
	}
	
	#categoryTable li {
		list-style: none;
		
		display: inline-block;
		width: 200px;
		height: 40px;
	}
	
	#categoryTable li a {
		text-decoration: none;
		color: black;
	}
	
	#categoryTable li a:hover {
		text-decoration: underline;
		color: graytext;
	}
	
	img {
		width: 349px;
		height: 250px;
	}
	
	#buttonDiv {
		text-align: right;
	}
	
	.card-title {
		text-align: center;
	}
	.card-title a {
		text-decoration: none;
		color: black;
	}
	.card-title a:hover {
		text-decoration: none;
		color: #949494;
	}
	
	
</style>
<script>
	function writeDog() {
		if("${c_id}" != "") {
			location.href="PSC?type=dogListWrite";
		} else {
			alert("로그인이 필요한 서비스입니다.");
			location.href="PSC?type=CustomerLogin";
		}
	}
</script>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<!-- Page Content -->
 	<div class="container">
 	
	<h2 class="my-4">강아지 분양</h2>
	
	<div id="typeDog">
		<ul id="categoryTable">
		<c:if test="${not empty dogType}">
			<c:forEach var="dType" items="${dogType}">
			<li>
				<span>
					<a href="PSC?type=dogCategory&cPage=1&dogCategory=${dType.key}">${dType.key}<em>(${dType.value})</em></a>
				</span>
			</li>
			</c:forEach>
		</c:if>
		</ul>
	</div>
	
	<div class="row">
		<c:if test="${not empty dogList}">
			<c:forEach var="dList" items="${dogList}">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="PSC?type=dogListView&d_idx=${dList.d_idx}">
							<img src = "${dList.d_img1}" onerror="this.src='/CaptainSM/upload/noImg.jpg'" alt="${dList.d_type}">
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="PSC?type=dogListView&d_idx=${dList.d_idx}">${dList.d_title}</a>
							</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	
	<div id="buttonDiv">
		<br><a href="#" class="btn btn-outline-secondary" onclick="writeDog()">글쓰기</a>
	</div>
	
		
<!-- Pagination -->
  	<ul class="pagination justify-content-center">
      	<li class="page-item">
      		<c:choose>
				<c:when test="${pvo.beginPage > pvo.pagePerBlock}">
					<li>
						<a class="page-link" href="PSC?type=dogList&cPage=${pvo.beginPage - 3}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
			            	<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a class="page-link" href="PSC?type=dogList&cPage=${pvo.beginPage}" aria-label="Previous">
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
        						<a class="page-link" href="PSC?type=dogList&cPage=${k}">${k }</a>
     						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pvo.endPage < pvo.totalPage}">
					<li class="page-item">
			          <a class="page-link" href="PSC?type=dogList&cPage=${pvo.endPage + 1}" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            <span class="sr-only">Next</span>
			          </a>
			       </li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
			          <a class="page-link" href="PSC?type=dogList&cPage=${pvo.endPage}" aria-label="Next">
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