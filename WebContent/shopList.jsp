<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫샵 - shopList</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
    
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
</head>

<script>
   function search_function(frm) {
      frm.action = "PSC?type=List";
      frm.submit();
   }
</script>

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

       <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4">&nbsp;Happy dog</h1>
          <div class="list-group">
         <a class="list-group-item" href="PSC?type=List&category=food">사료</a>
         <a class="list-group-item" href="PSC?type=List&category=toy">장난감</a>
         <a class="list-group-item" href="PSC?type=List&category=house">하우스</a>
         <a class="list-group-item" href="PSC?type=cart_view">장바구니</a>
          </div>
        </div>
        <div class="col-lg-9">
          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="img/dogwallpaper5.jpg">
          </div>
        </div>
      </div>
    </div>  

<div class="container">

    <!-- Page Heading -->
      <h1 class="my-4">카테고리
        <small>${category}</small>
      </h1>
      
      <form method="post">
	   	<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" type="text" size="20" name="fullname" placeholder="제품을 입력하세요"
				
				style="position: relative;left: 865px; margin-bottom: 20px;" >
			</div>
			<div class="col-xs-2" style="position: relative;left: 865px">
				<button class="btn btn-primary" type="button" onclick="search_function(this.form);"
				style="margin-left: 10px;" >검색</button>
			</div>
		</div>
	</form>

    
 <div class="row">
   <c:if test="${not empty list }">
      <c:forEach var="vo" items="${list }">
           <div class="col-lg-4 portfolio-item">
             <div class="card h-100">
               <a href="PSC?type=OneList&p_name=${vo.getP_name() }"><img class="card-img-top" src="/CaptainSM/images/${vo.getP_image_s()}" height=400 alt=""></a>
               <div class="card-body">
                 <h4 class="card-title">
                   <a href="PSC?type=OneList&p_name=${vo.getP_name() }">${vo.getName() }</a>
                 </h4>
                 <c:if test="${vo.getP_saleprice() != 0}">
                 <p class="card-text" style="font-size:medium; text-decoration: line-through;" >₩${vo.getP_price() }원</p>
                 <p class="card-text" style="font-size:larger; font-weight: bold; color: red;" >₩${vo.getP_saleprice() }원</p>
                 </c:if>
                 <c:if test="${vo.getP_saleprice() == 0}">
                 <p class="card-text" style="font-size:larger; font-weight: bold;" >₩${vo.getP_price() }원</p>
                 </c:if>
                 
                 <p style="font-size:smaller">오후 5시까지 주문시 당일발송</p>
                <img src="/CaptainSM/images/로켓배송.png" alt="noImg">
               </div>
             </div>
             </div>   
       </c:forEach>
       </c:if>
    <c:if test="${empty list }">      
      	입력된 자료가 없습니다
   </c:if>
   </div>

   <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
           <c:choose>
               <%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
               <c:when test="${pvo.beginPage == 1 }">
               </c:when>
               <%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
               <c:otherwise>
                  <li>
                     <a class="page-link" style="margin-top: 70px;"href="PSC?type=List&nowPage=${pvo.beginPage - 1 }&category=${category }" aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                           <span class="sr-only">Previous</span>
                        </a>   
                  </li>
               </c:otherwise>
         </c:choose>
      </li>
         <%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
         <c:forEach var="k" 
               begin="${pvo.beginPage }" end="${pvo.endPage }">
         <c:choose>
            <c:when test="${k == pvo.nowPage }">
            	<li class="page-item">
                   <a class="page-link" style="margin-top: 70px;">${k }</a>
              	</li>
            </c:when>
            <c:otherwise>
            	<li class="page-item">
                  	<a class="page-link" style="margin-top: 70px;" href="PSC?type=List&nowPage=${k }&category=${category }&move=move">${k }</a>
                </li>
            </c:otherwise>
         </c:choose>
         </c:forEach>
           <c:choose>   
            <%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
            <c:when test="${pvo.endPage >= pvo.page }">
            </c:when>
            
            <%--사용가능(enable) --%>
            <c:otherwise>
               <li class="page-item">
                   <a class="page-link" href="PSC?type=List&nowPage=${pvo.endPage + 1 }&category=${category }" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                     <span class="sr-only">Next</span>
                   </a>
                 </li>
            </c:otherwise>
         </c:choose>
      </ul>
</div>	



 	<footer class="py-5 bg-white">
    <hr><br>
        <div class="row">
        	<div class="col-lg-8 col-md-10 mx-auto">
        		<p class="text-primary text-center">© LACLEAR COMPANY. ALL RIGHTS RESERVED.</p>
        		<p class="copyright text-muted text-center">상호:해피도그 펫클리닉 &nbsp;| &nbsp; 사업자등록번호:123-456-78910[사업자정보확인]  &nbsp;| &nbsp; 대표:대장성문  &nbsp;| &nbsp; TEL:1544-1444 
             <br>FAX:031-123-1234  &nbsp;| &nbsp; 주소:비트캠프 신촌센터  &nbsp; |  &nbsp; E-mail:test1234@naver.com </p>
        	</div>	
        </div>
    <br> 
    </footer>
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>