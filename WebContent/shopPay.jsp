<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>주문서 작성</h1>
	<hr>
	<h2>강아지왕국 상품</h2>
	<p>제품이름  ${p_name.getP_name()}</p>
	<!--  
	<p>적립금  </p>
	-->
	<p>판매가  ${p_name.getP_saleprice()}</p>
	<p>수량  </p>
	<p>배송비  3500원</p>
	<p>합계</p>
	<p>${p_name.getP_saleprice() + 3500}</p>
	<hr>
	<!--
	<p>받으실 예상적립금</p>
	<p>${p_name.getP_saleprice() * 0.1}</p>
	-->
	<p>개인정보수정동의</p>
	<hr>
	<h2>주문서 작성</h2>
	
	<form method="post">
		<table>
		<tbody>
		<tr><th>1주문자정보</th></tr>
		<tr><td>주문<input type="text" name="name"></td></tr>
		<tr><td>핸드폰번호 : <input type="text" name="phone"></td></tr>
		<tr><td>이메일 : <input type="text" name="mail"></td></tr>
		<tr><th>2배송정보</th></tr>
		<tr><td>받으실분 : <input type="text" name="receiver"></td></tr>
		<tr><td>받으실곳 : <input type="text" name="site"></td></tr>
		<tr><td>핸드폰번호 : <input type="text" name="phone_receiver"></td></tr>
		<tr><td>배송메시지 : <input type="text" name="message"></td></tr>
		</tbody>
		<tfoot>
		<tr><th>3결제금액</th></tr>
		<tr><td>상품합계금액 :  ${p_name.getP_saleprice()}</td></tr>
		<tr><td>배송비 2500원</td></tr>
		<tr><td><input type="hidden" name="deliveryFee" value="3500"></td></tr>
		<tr><td>총결제금액 : ${p_name.getP_saleprice() + 3500}</td></tr>
		<tr><td><input type="hidden" name="total_fee" value="${p_name.getP_saleprice() + 3500}"></td></tr>
		<tr><th>4결제수단</th></tr>
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
	</form>
</body>
</html>