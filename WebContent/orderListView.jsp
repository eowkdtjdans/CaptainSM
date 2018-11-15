<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫샵 - orderListView</title>

<style>
 	th { width: 20%;}
 	
 	.p_img { width: 20%; }
 	.p_name { width: 50%; }
 	.p_num { width: 10%; }
 	.p_price { width: 20%; }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<h2 style="text-align : center;">주문 상세보기</h2>
	
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>주문번호</th>
				<td>${oList.get(0).o_idx}</td>
				<th>구매일자</th>
				<td>${oList.get(0).order_date}</td>
			</tr>
			<tr>
				<th>구매자</th>
				<td>${oList.get(0).name}</td>
				<th>배송지</th>
				<td>${oList.get(0).site}</td>
			</tr>
			<tr>
				<th>구매자</th>
				<td colspan="3">${oList.get(0).receiver}</td>
			</tr>
			<tr>
				<th>구매자 전화번호</th>
				<td colspan="3">${oList.get(0).phone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">${oList.get(0).mail}</td>
			</tr>
			<tr>
				<th>수취인 전화번호</th>
				<td colspan="3">${oList.get(0).phone_receiver}</td>
			</tr>
			<tr>
				<th>배송메시지</th>
				<td colspan="3">${oList.get(0).message}</td>
			</tr>
		</table>
		
		<h3>주문 상품 정보</h3>
		<table class="table table-bordered">
			<tr>
				<th class="p_img">상품 이미지</th>
				<th class="p_name">상품명</th>
				<th class="p_num">수량</th>
				<th class="p_price">가격</th>
			</tr>
			<c:if test="${not empty ovList}">
				<c:forEach var="view" items="${ovList}">
					<tr>
						<td>${view.p_image_s}</td>
						<td>${view.p_name}</td>
						<td>${view.num}</td>
						<td>
							<c:choose>
								<c:when test="${not empty view.p_saleprice}">
									<strike>원가: ${view.p_price * view.num}</strike><br>세일가격: ${view.p_saleprice * view.num}<br>
									(할인율: <fmt:formatNumber value="${(view.p_price - view.p_saleprice) / view.p_price}" type="percent"/>)
								</c:when>
								<c:otherwise>
									${view.p_price * view.num}
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<c:set var="p_total" value="${p_total + view.totalprice}" scope="page"/>
				</c:forEach>
			</c:if>
		</table>
		
		<h3>결제정보</h3>
		<table class="table table-bordered">
			<tr>
				<th>결제수단</th>
				<td>${oList.get(0).paymeans}</td>
			</tr>
			<tr>
				<th>총 결제금액</th>
				<td>${oList.get(0).total}(상품가: ${p_total} + 배송료: ${oList.get(0).deliveryfee})</td>
			</tr>
			
			<tr>
				<td colspan="3"><input type="button" class="btn btn-info" onclick="location.href='PSC?type=orderList'" value="뒤로가기"/></td>
			</tr>
		</table>
	</div>
</body>
</html>