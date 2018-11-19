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

.b_img {
	text-align: center;
}

.b_img img {
	width: 700px;
	height: 500px;
	margin: 50px;
	margin-left: 200px;
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
				<br><br>
					<div class="b_img">
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
	
	
			<br><hr><br>
            <div class="card-body text-center">
              <h2 id="bold">01</h2>
              <span id="subject">해피독은 정직합니다.</span>&nbsp;&nbsp;<img src="img/icon1.PNG" alt="icon1" id="icon1">
              <p class="text-muted">해피독은 고객님께 소중한 아가를 분양 하기 위해 정직하게 분양하겠습니다.</p>
              <h2 id="bold">02</h2>
              <span id="subject">합리적 분양가로 분양하겠습니다.</span>&nbsp;&nbsp;<img src="img/icon2.PNG" alt="icon1" id="icon1">
              <p class="text-muted">타 업체와 달리 건강하고 이쁜 강아지를 합리적인 분양가로 분양하겠습니다.</p>
              <h2 id="bold">03</h2>
              <span id="subject">모든 지점 직영점 운영</span>&nbsp;&nbsp;<img src="img/icon3.PNG" alt="icon1" id="icon1">
              <p class="text-muted">타 업체와는 달리 전문가들이 직접 모든 매장을 관리하며 강아지를 보살핍니다.</p>
              <h2 id="bold">04</h2>
              <span id="subject">동물병원 연계 의료혜택</span>&nbsp;&nbsp;<img src="img/icon4.PNG" alt="icon1" id="icon1">
              <p class="text-muted">해피독은 모든매장 동물병원연계센터이며, 분양후 의료혜택을 제공합니다.</p>
               <h2 id="bold">05</h2>
              <span id="subject">철저한 사후관리 보장</span>&nbsp;&nbsp;<img src="img/icon5.PNG" alt="icon1" id="icon1">
              <p class="text-muted">견주님께서 아이를 건강하게 키우실 수 있도록 사후 서비스를 약속합니다.</p>
               <h2 id="bold">06</h2>
              <span id="subject">전국 안전배송팀을 운영합니다.</span>&nbsp;&nbsp;<img src="img/icon6.PNG" alt="icon1" id="icon1">
              <p class="text-muted">해피독은 안전배송팀을 만들어 고객님의 집까지 분양받으신 아이를 안전하게 보내드립니다.</p> 
            </div>
          </div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>