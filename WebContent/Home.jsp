<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- 레지스터 비밀번호 널값일때 false해야함 -->
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HappyDog 애견타운</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">

  </head>
  
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
	}
	.list-group-item{
		color:#8f784b;
		font-weight: bold;
	}
	#fontweight{
		font-size: 2rem;
	}
	#dateimage{
		margin-left: 160px;
	}
	#whodog{
		width: 440px;
	}
	
	#map {
        height: 350px;
        width: 400px;
        text-align: center;
        /* display: inline-block; */
       }
	
	
	</style>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="nav">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp"><img src="/CaptainSM/img/paw.PNG" id="paw">&nbsp;Happy Dog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <c:choose>
            	<c:when test="${not empty c_id}">
	            	<li class="nav-item" id="abc">
		              <a class="nav-link" href="PSC?type=orderList">My주문조회</a>
		            </li>
		            <li class="nav-item" id="abc">
		              <a class="nav-link" href="CustomerLogout.jsp">로그아웃</a>
		            </li>
            	</c:when>
            	<c:otherwise>
            		<li class="nav-item" id="abc">
		              <a class="nav-link" href="PSC?type=CustomerLogin">로그인</a>
		            </li>
		            <li class="nav-item" id="abc">
		              <a class="nav-link" href="CustomerRegister.jsp">회원가입</a>
		            </li>
            	</c:otherwise>
            </c:choose>
            
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Page Content -->
    <div class="container">
      <div class="row">		
        <div class="col-lg-3">
          <h1 class="my-4"><img src="img/paw.PNG" id="paw">&nbsp;Happy dog</h1>
          <div class="list-group">
            <a href="PSC?type=dogList&cPage=1" class="list-group-item">분양</a>
            <a href="PSC?type=questionList" class="list-group-item">문의 게시판</a>
            <a href="PSC?type=reviewAll" class="list-group-item">후기 게시판</a>
            <a href="PSC?type=menu" class="list-group-item">애견용품</a>
            <a href="#" class="list-group-item">애견 선택 요령</a>
          </div>
        </div>

        <div class="col-lg-9">
          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="img/dogwallpaper5.jpg">
          </div>
        </div>     
      </div>
    </div>
          















<br><hr><br>		
<div class="container">
	<div class="row">
		<div class="col-md-12" id="bg1"><h3 class="text-center text-muted">WHO<br> HAPPY DOG?</h3></div>
		<div class="col-md-5"><br><img src="img/dogwallpaper2.jpg" alt="강쥐" class="img-responsive img-rounded" id="whodog"></div>
		<div class="col-md-7"><br><h4>건강한 강아지 대표 분양센터 해피독</h4><p>해피독은 단 세가지만 생각합니다. "건강", "행복", "사랑" 새로운 가족이 되어줄 우리 아이는 건강해야 합니다. 건강해야 모든 가족이 행복해 질 것이며, 사랑 속에서 살아갈테니... 연간 평균 건강율 98%가 뻔한 말이 아닌 데이터 결과로 대답합니다. 새로운 가족 저희 해피독과 함께 하여 행복이 가득한 하루가 되기를 바랍니다.</p>
		</div>
	</div>
		<br><hr><br>
		
	
	
	
	
	
    	
    	<div class="col-md-12">
            <div id="bg1" class="text-center text-muted">           
              <h3>Happy Dog Rule</h3>
              <h5><strong>해피독 원칙</strong></h5>
            </div>   

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
              <br><hr><br>                          
            </div>
          </div>



          
          <div class="col-md-12" id="bg1">
         	 <h3 class="text-center text-muted">HISTORY of HAPPY DOG</h3><h5 class="text-center text-muted" id="bold">해피독 연혁 소개</h5>
          </div>
          <img src="img/date.PNG" id="dateimage">
    
          
        <div class="col-md-12">
        <br><hr><br>
        <div id="bg1" class="text-center text-muted">           
              <h3>Say Something</h3>
              <h5><strong>전하는 말</strong></h5>
        </div>
        </div>
        <div class="col-md-12 text-center">
	  	<h3>모아 M · O · A</h3>
	  	<h4>Mind Of Animal</h4>
	  	<h5><strong>동물에 대한 마음</strong></h5>
	  	<br>
	  	<h4 id="underbar">한 해에 버려지는 유기동물의 수는 '8만마리'</h4>
	  	<h5>반려동물에 대한 인식의 변화가 있다고 하지만 아직도 여전히 반려 동물을 소유물이라고생각하고 <br>
	  	버리거나 학대하거나 강아지공장을 만들어 식용으로 판매하는 일들이 끊임없이 우리 모르게 벌어지고 있습니다.</h5>
	  	<img src="img/icon7.PNG" alt="icon1">
	  	<h5>생명을 경시하는 인간의 모습에 놀랄 수 밖에 없습니다. 한 나라의 도덕 수준은 동물들을 어떻게 <br>
	  		대하는지를 보면 알 수 있다는데, 그런 점에서 보면 우리나라는 참 안타까운 상황입니다.<br> 
			강아지 공장이나 식용개 산업 종사자들은 인간만이 우월한 존재라 생각해서 ‘동물을 학대해도 된다’고 생각할 수 있습니다.<br> 
			그러나 학대를 당하는 동물의 입장에서 생각해 보아야 합니다. <br>
			뻔한 이야기일 수 있지만 ‘역지사지’의 자세로 생각하는 게 모든 문제를 해결하는 시작이 아닐까요.
		</h5>
		<h4><strong>안락사 없이 평생을 지켜주는 공간</strong></h4>
		<!-- <h3 class="text-info" id="icon2">마음을</h3>&nbsp;&nbsp;<h3 class="text-warning">MOA</h3> -->
		<span class="text-info" id="fontweight">마음을</span>&nbsp;&nbsp;&nbsp;<span class="text-warning" id="fontweight">MOA</span>
		<br>
		<span class="text-info" id="fontweight">사랑을</span>&nbsp;&nbsp;&nbsp;<span class="text-warning" id="fontweight">MOA</span>
		<br>
		<span class="text-info" id="fontweight">관심을</span>&nbsp;&nbsp;&nbsp;<span class="text-warning" id="fontweight">MOA</span>
		<br>
		<span class="text-info" id="fontweight">손길을</span>&nbsp;&nbsp;&nbsp;<span class="text-warning" id="fontweight">MOA</span>
		<br>
		<br>
		<h4><strong>사람과 동물, 모두가 행복해지는 세상을 꿈꿉니다.</strong></h4>
	  </div>  
	  
	  
	  <br><hr><br>
	  <div class="col-md-12 text-center">
            <div id="bg1" class="text-center text-muted">           
              <h3>Happy Dog Way to come</h3>
              <h5><strong>해피독 오시는 길</strong></h5>
            </div> 
             <div class="text-center" id="map"></div>
      </div>     
</div>


    <!-- Footer -->
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

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    
    <script>
      function initMap() {
        var uluru = {lat: 13.759371, lng: 100.498293};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 19,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    
    
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzGwljrVKYTGaY7RfRjT8Ep4w2W4jV2Z4&callback=initMap">
    </script>
  </body>

</html>