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
function pay_go(frm) {
	var firstForm = document.forms[0];
	for (var i=0; i<firstForm.elements.length; i++) {
		if (firstForm.elements[i].value.trim() == "") {
			if (i == 3) continue; //파일항목
			alert(firstForm.elements[i].title 
					+ " 입력하세요");
			firstForm.elements[i].focus();
			return;
		}
	}
	frm.action = "PSC?type=payOk"; 
	firstForm.submit();
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
		</tr>
	</thead>
	<tbody>	
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
				${vo.getCart_quant()}
			</td>
			<td>
				<c:if test="${vo.getP_saleprice() == 0}">
					₩${vo.getP_price()*vo.getCart_quant()}
				</c:if>
				<c:if test="${vo.getP_saleprice() != 0}">
					₩${vo.getP_saleprice()*vo.getCart_quant()}
				</c:if>
			</td>
		</tr>	
		</c:forEach>	
	</c:if>	
	</tbody>

	<tfoot>
		<tr>
			<td colspan="4"></td>
			<td>배송비 :₩2500 원</td>
			<td colspan="1">총결제금액 :₩${total +2500} 원</td>
		</tr>
	</tfoot>
	</table>
	</div>
    </div>
	<hr>
	<h2>개인정보 수집 동의</h2>
	<hr>
	

	
	<form method="post">
		<div class="container">	
		<div class="row">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">	
		<tbody>
		<tr><th>주문자정보</th></tr>
		<tr><td>주문자 : <input type="text" name="name"></td></tr>
		<tr><td>핸드폰번호 : <input type="text" name="phone"></td></tr>
		<tr><td>이메일 : <input type="text" name="mail"></td></tr>
		<tr><th>배송정보</th></tr>
		<tr><td>받으실분 : <input type="text" name="receiver"></td></tr>
		<tr><td>받으실곳 : <input type="text" name="site"></td></tr>
		<tr><td>핸드폰번호 : <input type="text" name="phone_receiver"></td></tr>
		<tr><td>배송메시지 : <input type="text" name="message"></td></tr>
		</tbody>
		<tfoot>
		<tr><th>결제금액</th></tr>
		<tr><td>상품합계금액 :  ₩${total}원</td></tr>
		<tr><td>배송비 ₩2500원</td></tr>
		<tr><td><input type="hidden" name="deliveryFee" value="3500"></td></tr>
		<tr><td>총결제금액 : ₩${total +2500}원</td></tr>
		<tr><td><input type="hidden" name="total_fee" value="${total + 2500}"></td></tr>
		<tr><th>결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		무통장<input type="radio" name="payMeans" value="bank">
		신용카드<input type="radio" name="payMeans" value="credit">
		핸드폰<input type="radio" name="payMeans" value="phone">
		</td></tr>
		<tr><td colspan="2">
			<input type="button" value="결제하기"
			onclick="pay_go(this.form)">
			<input type="reset" value="취소하기">
		</td></tr>
		</tfoot>
		</table>
		</div>
		</div>
	</form>
</body>
	<!-- Bootstrap core JavaScript -->
    <script src="startbootstrap-shop-homepage-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>