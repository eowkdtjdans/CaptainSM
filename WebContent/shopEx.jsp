<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/portfolio-item.css" rel="stylesheet">
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/shop-item.css" rel="stylesheet">
<style>
	
	#bg1 {
		background-color: #ece6cc;
	}
	#dogimg{
		width: 300px;
		height: 200px;
	}
	#attach1{
		display: inline-block;
		width: 300px;
		height: 150px;
		margin: 1em;
		margin-top: -30px;
	}
	#attach2{
		display: inline-block;
		width: 400px;
		height: 250px;
		margin: 1em;
		margin-top: -30px;
	}
	#bold{
		font-weight: bold;
	}
	#subject{
		display: inline;
		font-size: 30px;
	}
	#icon1{
		width: 60px;
	}
	#nav{
		background-color: #8f784b;
	}
	#abc a{
		color: white;
	}
	#paw{
		width: 30px;
		height: 30px;
	}
	.list-group-item{
		color:#8f784b;
		font-weight: bold;
	}
	#fontweight{
		font-size: 2rem;
	}
	
</style>    
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
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="nav">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp"><img src="/CaptainSM/img/paw.PNG" id="paw">&nbsp;Happy Dog</a> <!--PSC?type=CustomerMain과 같습니다.  -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item" id="abc">
              <a class="nav-link" href="PSC?type=orderList">My주문조회</a>
            </li>
            <li class="nav-item" id="abc">
              <a class="nav-link" href="PSC?type=CustomerLogin">로그인</a>
            </li>
            <li class="nav-item" id="abc">
              <a class="nav-link" href="CustomerLogout.jsp">로그아웃</a> <!-- 일단은 확인용으로 추가해놨어요 요거는 세션을지우는거라서 MVC패턴으로 안해놔서 바로연결-->
            </li>
            
          </ul>
        </div>
      </div>
    </nav> 
    
<h2>주문/결제</h2>
	<div class="container">	
		<div class="row">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">	
	<thead>
		<tr>
			<th style="background-color: #fafafa; text-align: center;">카테고리</th>
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
			<td>${vo.getCategory()}</td>
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
	<br><br>
	
	<form method="post">
		<div class="container">	
		<div class="row">
		<table class="table table-bordered bordertable th120" >
	    <tbody>
		<tr ><th style="background-color: #fafafa;">주문자정보</th></tr>
		
		<tr><td><label for="exampleInputEmail1">주문자</label>
    	<input type="text" class="form-control" name="name" placeholder="주문자를 입력하세요"></td></tr>
    	
    	<tr><td><label for="exampleInputEmail1">핸드폰번호</label>
    	<input type="text" class="form-control" name="phone" placeholder="핸드폰번호를 입력하세요"></td></tr>
    	
    	<tr><td><label for="exampleInputEmail1">이메일</label>
    	<input type="text" class="form-control" name="mail" placeholder="이메일을 입력하세요"></td></tr>
    	
		<tr><th style="background-color: #fafafa;">배송정보</th></tr>
    	
    	<tr><td><label for="exampleInputEmail1">받으실분</label>
    	<input type="text" class="form-control" name="receiver" placeholder="받으실분을 입력하세요"></td></tr>
    	
    	<tr><td><label for="exampleInputEmail1">받으실곳</label>
    	<input type="text" class="form-control" name="site" placeholder="받으실곳을 입력하세요"></td></tr>
    	
    	<tr><td><label for="exampleInputEmail1">핸드폰번호</label>
    	<input type="text" class="form-control" name="phone_receiver" placeholder="핸드폰번호를 입력하세요"></td></tr>
    	
    	<tr><td><label for="exampleInputEmail1">배송메시지</label>
    	<input type="text" class="form-control" name="message" placeholder="배송메시지를 입력하세요"></td></tr>

		</tbody>
		<tr><th><img src="img/농협.jpg" width="1200"></th></tr>
		<tfoot>
		<tr><th style="background-color: #fafafa;">결제금액</th></tr>
		<tr><td>상품합계금액 :  ₩${total}원</td></tr>
		<tr><td>배송비 ₩2500원</td></tr>
		<tr><td>총결제금액 : ₩${total +2500}원
		<input type="hidden" name="deliveryFee" value="3500">
		<input type="hidden" name="total_fee" value="${total + 2500}">
		</td></tr>
		<tr><th style="background-color: #fafafa">결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		무통장<input type="radio" name="payMeans" value="bank">
		신용/체크카드<input type="radio" name="payMeans" value="credit">
		휴대폰<input type="radio" name="payMeans" value="phone">
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
	<%@include file="include/footer.jsp"%>
</body>
	<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>