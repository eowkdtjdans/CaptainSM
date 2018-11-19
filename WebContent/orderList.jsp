<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫샵 - orderList</title>
<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>
<style>
	li {
		list-style: none;
		float: left;
	}
</style>
</head>
<body>
	<%@include file="include/header.jsp"%>
	<div class="container">
	<div class="row from-group">
	<h2 style="text-align : center;">주문조회</h2>
	<hr>

	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>구매자</th>
					<th>전화번호</th>
					<th>주문일자</th>
					<th>이메일</th>
					<th>수취인</th>
					<th>배송지</th>
					<th>수취인 전화번호</th>
					<th>배송메시지</th>
					<th>배송비</th>
					<th>총액</th>
					<th>결제수단</th>
					<th>주문조회</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty orderList}">
				<c:forEach var="oList" items="${orderList}">
					<tr>
						<td>${oList.id}</td>
						<td>${oList.name}</td>
						<td>${oList.phone}</td>
						<td>${oList.order_date}</td>
						<td>${oList.mail}</td>
						<td>${oList.receiver}</td>
						<td>${oList.site}</td>
						<td>${oList.phone_receiver}</td>
						<td>${oList.message}</td>
						<td>${oList.deliveryfee}</td>
						<td>${oList.total}</td>
						<td>${oList.paymeans}</td>
						<%-- <td><a class="page-link" href="PSC?type=orderListView&o_idx=${oList.o_idx}">주문조회</a></td> --%>
						<td><input type="button" class="btn btn-info" 
						onclick="location.href='PSC?type=orderListView&o_idx=${oList.o_idx}'" value="주문조회"/></td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="text-center">
		<nav class="nav">
			<ol>
				<c:choose>
					<c:when test="${pvo.beginPage < pvo.pagePerBlock}">
						<li class="page-item disabled"><a class="page-link">이전으로</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="PSC?type=orderList&cPage=${pvo.beginPage - 3}">이전으로</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}">
					<c:choose>
						<c:when test="${k == pvo.nowPage}">
							<li class="page-item disabled"><a class="page-link">${k}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="PSC?type=orderList&cPage=${k}">${k}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pvo.endPage >= pvo.totalPage}">
						<li class="page-item disabled"><a class="page-link">다음으로</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="PSC?type=orderList&cPage=${pvo.endPage + 1}">다음으로</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ol>
		</nav>
	</div>
	</div>
	</div>
	
	<%@include file="include/footer.jsp"%>
<%@include file="include/include-js.jsp"%>
</body>
</html>
