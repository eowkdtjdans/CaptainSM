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
 
 	<title>문의 게시판</title>
 
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
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

	 
	 th{
	 	font-size:1.1em;
	 }
	/******* 페이지 표시 부분 스타일(시작) *****/
	 .paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 30px;
	}
	.paging li a {
		text-decoration: none;
		 display: block;
		padding: 3px 3px; 
		color: black;
	}

	.paging .disable {
		padding: 3px 3px;
		color: silver;
	}
	.paging .now {
		padding: 3px 3px;
		font-weight: bold;
	} 
	
	/******* 페이지 표시 부분 스타일(종료) ***/	
</style>
</head>
<body>

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
<div id="question" class="container">
<!-- <table class="type" style="margin-left: auto; margin-right: auto;"> -->
<table class="table table-hover">
	<%-- <caption class="page-header"><h3>문의 게시판</h3></caption> --%>
	<h3 class="page-header">문의 게시판</h3>
	<thead>	
		<tr class="title">	
			<th class="no">No</th>		
			<th class="subject">제목</th>
			<th class="id">아이디</th>			
			<th class="quest_date">작성일</th>					
		</tr>
	</thead>
	
	<tbody>
		<c:choose>
		
			<c:when test = "${empty questList }">
				<tr>
					<td colspan="4">
						<h3>현재 등록된 게시글이 없습니다.</h3>
					</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="vo" items="${questList }">
					<tr>
						<td>${vo.q_idx }</td>
						<td>
							<a href="PSC?type=questionView&q_idx=${vo.q_idx }">${vo.q_subject }</a>
						</td>		
						<td>${vo.q_id}</td>						
						<td>${vo.q_date.substring(0, 10) }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
		</c:choose>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="3">
				<ol class="paging">
				
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
				<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${pvo.beginPage == 1 }">
						<li class="disable">◀</li>
					</c:when>
				<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
					<c:otherwise>
						<li>
							<a href="PSC?type=questionList&cPage=${pvo.beginPage - 1 }">◀</a>
						</li>
					</c:otherwise>	
				</c:choose>
				
				<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
				<c:forEach var="k" 
						begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
					<c:when test="${k == pvo.nowPage }">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="PSC?type=questionList&cPage=${k }">${k }</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>	
					<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
					<c:when test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">▶</li>
					</c:when>
					<%--사용가능(enable) --%>
					<c:otherwise>
						<li>
							<a href="PSC?type=questionList&cPage=${pvo.endPage + 1 }">▶</a>
						</li>
					</c:otherwise>
				</c:choose>
				</ol>
			</td>
			
			<td>
				<a href="PSC?type=questionWrite" class="btn btn-outline-secondary"><span class="glyphicon glyphicon-pencil"></span>&nbsp;글쓰기</a>
			</td>
		</tr>		
	</tfoot>
				
</table>
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

</div>	

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>