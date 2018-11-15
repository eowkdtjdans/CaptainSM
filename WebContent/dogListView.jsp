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

<title>펫샵 - dogListView</title>
<style>
	
	.b_img img {
		width: 700px;
		height: 400px;
	}
</style>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<!-- Page Content -->
    <div class="container">
    	<h3 class="page-header">강아지 분양</h3>
	
	 <!-- Portfolio Item Row -->
      <div class="row">
			<c:if test="${not empty dogViewList}">
					<div class="space">
						<c:forEach var="dvList" items="${dogViewList}">
						
						<div class="col-md-8">
				        	<img class="img-fluid" id="mainImg" src="${dvList.d_img1}" onerror="this.src='/CaptainSM/upload/noImg.jpg'" alt="${dvList.d_type}">
				        </div>
				        
						<div class="col-md-4">
							<div>품종 : ${dvList.d_type}</div>
							<div>모색 : ${dvList.d_fur}</div>
							<div>이름 : ${dvList.d_name}</div>
							<div>나이(개월) : ${dvList.d_age}</div>
							<div>소개 : ${dvList.d_intro}</div>
						</div>
						</c:forEach>
					</div>
			</c:if>
			
			<c:if test="${not empty dogViewList}">
				<c:forEach var="dvList" items="${dogViewList}">
					<div class="b_img">
						<c:if test="${dvList.d_img1 ne 'noImg'}">
							<img src = "${dvList.d_img1}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
						</c:if>
						<c:if test="${dvList.d_img2 ne 'noImg'}">
							<img src = "${dvList.d_img2}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
						</c:if>
						<c:if test="${dvList.d_img3 ne 'noImg'}">
							<img src = "${dvList.d_img3}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
						</c:if>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>