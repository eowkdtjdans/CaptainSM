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
	#th{width: 120px;}
	
h3 {
text-align : center;
font-family: "Sandoll MiSaeng"; 
font-size : 2.0em;
margin-top : 2em;
margin-left : -1em;
margin-bottom : 5em;
color : #964b00;

}

h3:before {
content : "●";
font-size : 1.2em;
vertical-align : 110%;
}

h3:after {
content : "●";
font-size : 0.7em;
vertical-align : -140%;
}

.left_m{
margin-left : 1.5em;
}
 

img {
	max-width: 100%;
	width: 600px;
}

</style>
</head>
<body>
	<%@include file="include/header.jsp"%>

	
	
	
	
	
	
	
	
	
	
	
	
	<!-- Page Content -->
    <div class="container">
      <div class="row">
    	<h3 class="col-md-12 text-center">댕댕이를 소개합니다!</h3>
			<c:if test="${not empty dogViewList}">	
							
				<c:forEach var="dvList" items="${dogViewList}">
				
				<div class="col-md-6"><br>
		        	<img class="img-fluid rounded"  src="${dvList.d_img1}" onerror="this.src='/CaptainSM/upload/noImg.jpg'" alt="${dvList.d_type}">
		        </div>
		        
				<div class="col-md-6">					
					<table class="table table-hover">
					<br>
						<tr>
							<th id="th">품종</th>
							<td>${dvList.d_type}</td>
						</tr>
						<tr>
							<th>모색</th>
							<td>${dvList.d_fur}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${dvList.d_name}</td>
						</tr>
						<tr>
							<th>나이(개월)</th>
							<td>${dvList.d_age}</td>
						</tr>
						<tr>
							<th>소개</th>
							<td>${dvList.d_intro}</td>
						</tr>
					</table>
					
				</div>
				</c:forEach>					
			</c:if>
			
			<c:if test="${not empty dogViewList}">
				<c:forEach var="dvList" items="${dogViewList}">
					
					<div class="b_img">
						<br><br>
						<c:if test="${dvList.d_img1 ne 'noImg'}">
							<img class="rounded" src = "${dvList.d_img1}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
						</c:if>
						<c:if test="${dvList.d_img2 ne 'noImg'}">
							<img class="rounded" src = "${dvList.d_img2}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
						</c:if>
						<c:if test="${dvList.d_img3 ne 'noImg'}">
							<img class="rounded" src = "${dvList.d_img3}" alt="${dvList.d_type}" onerror="this.src='/CaptainSM/upload/noImg.jpg'">
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