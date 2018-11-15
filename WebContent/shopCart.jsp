<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap core CSS -->
    <link href="startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="startbootstrap-shop-homepage-gh-pages/css/portfolio-item.css" rel="stylesheet">
<script>
function goBack() {
	window.history.go(-2);
	
}

function update(frm) {
	frm.submit();
}
</script>
</head>


<body>	
	<div class="container">	
		<div class="row">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">	
	<thead>
		<tr>
			<th style="background-color: #fafafa; text-align: center;">제품번호</th>
			<th style="background-color: #fafafa; text-align: center;">사진</th>
			<th style="background-color: #fafafa; text-align: center;">제품명</th>
			<th style="background-color: #fafafa; text-align: center;">단가</th>
			<th style="background-color: #fafafa; text-align: center;">수량</th>
			<th style="background-color: #fafafa; text-align: center;">금액</th>
			<th style="background-color: #fafafa; text-align: center;">삭제</th>
		</tr>
	</thead>
	<tbody>	
	<c:if test="${empty list}">	
		<tr>
			<td colspan="6">장바구니가 비었습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.getNum()}</td>
			<td><img src="images/${vo.getP_image_s()}" width="100"></td>
			<td>${vo.getName()}</td>
			<c:if test="${vo.getP_saleprice() == 0}">
				<td>₩${vo.getP_price()}</td>
			</c:if>
			<c:if test="${vo.getP_saleprice() != 0}">
			<td>₩${vo.getP_price()}<span class="red">(세일가격: ₩${vo.getP_saleprice()})</span></td>
			</c:if>
			<td>
				<form action="PSC?type=update&p_name=${vo.getP_name()}"
							method="post">
					<input type="number" name="su"
						value="${vo.getCart_quant()}" size="2">
					<button type="button" class="btn btn-danger btn-sm" onclick="update(this.form)">수정</button>
				</form>
			</td>
				<c:if test="${vo.getP_saleprice() == 0}">
					<td>₩${vo.getP_price()*vo.getCart_quant()}</td>
				</c:if>
				<c:if test="${vo.getP_saleprice() != 0}">
					<td>₩${vo.getP_saleprice()*vo.getCart_quant()}</td>
				</c:if>
			<td>	
				<a href="javascript:location.href='PSC?type=delete&p_name=${vo.getP_name()}'">
						<button type="button" class="btn btn-danger btn-sm">삭제</button>
				</a>
			</td>
		</tr>	
		</c:forEach>	
	</c:if>	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">
			<c:choose>
					<%-- 사용불가(disable) 카트에 데이터가 없을 경우--%>
					<c:when test="${empty list}">
						<li class="disable">결제하기</li>
					</c:when>
					<%--사용가능(enable) : 카트에 데이터가 있을 경우 --%>
					<c:otherwise>
							<a href="PSC?type=ex">
								<button type="button" class="btn btn-success btn-sm">결제하기</button>
							</a>
							<c:if test="${go_menu}">
								<a href="PSC?type=menu">
									<button type="button" class="btn btn-success btn-sm">메뉴로</button>
								</a>
							</c:if>
							
							<c:if test="${!go_menu }">
							<c:if test=	"${not empty category}">
								<c:if test="${not empty goPage}">
									<a href="PSC?type=List&nowPage=${goPage }&category=${category}">
										<button type="button" class="btn btn-success btn-sm">계속쇼핑하기</button>
									</a>									
								</c:if>
								<c:if test="${empty goPage}">
									<a href="PSC?type=List&nowPage=1&category=${category}">
										<button type="button" class="btn btn-success btn-sm">계속쇼핑하기</button>
									</a>
								</c:if>
							</c:if>
							</c:if>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</tfoot>
	</table>
	<!-- Bootstrap core JavaScript -->
    <script src="startbootstrap-shop-homepage-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </div>
    </div>
</body>
</html>