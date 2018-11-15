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
<script>
	function contentmodify(frm2){
		frm2.action="PSC?type=questionModifyComment2&q_idx=${q_idx}&qc_idx=${qc_idx}";
		frm2.submit();
	}	
</script>
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










.hr {  
	border-top: 1px dashed #bbb; 
	border-bottom: 1px dashed #fff;
}

#span {
	float: right;
	text-align: right;
}

a {
	text-decoration: none;
}

#content {
	height: 300px;
}

textarea{
	resize:none;
}
</style>
</head>
<div>   
<body>
 <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="nav">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp"><img src="/CaptainSM/img/paw.PNG" id="paw">&nbsp;Happy Dog</a>
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
	<%-- <form method="post" name="frm">
		<table>
			<caption>문의 게시판</caption>
			<tbody class="table">
				<tr>
					<td>
					제목 : ${vo.q_subject } &nbsp;&nbsp;&nbsp;&nbsp;
					${vo.q_date }|
					
					<input type="hidden" name="cPage" 
						value="${cPage }">
					</td>					
				</tr>
				<tr>
					<td>작성자 : ${vo.q_phone }</td>					
				</tr>
				<tr>					
					<td><p>${vo.q_content }</p></td>
				</tr>					
			</tbody>
		</table>
	</form>
	<br>
	<div>댓글${hit} </div>
	<hr>
	
	<form method="post" name="frm2">	
	<p>
	<textarea name="qc_content" rows="4" cols="55">${qvo.qc_content }</textarea>	
	<input type="button" value="수정" onclick="contentmodify(this.form)"> 
	<input type="hidden" name="q_idx" value="${q_idx }">	
	</p>
	</form> --%>
	
	
	
	
	
	
	<br><hr><br>
	<div class="container">   
	<div class="row form-group">
		<table class="table table-hover">	                    
		<tr>									
			<td colspan="2"><div class="div0"><strong>${vo.q_subject } &nbsp;&nbsp;&nbsp;</strong><a href="PSC?type=questionView&q_idx=${vo.q_idx }" id="main">| 문의 게시판</a></div></td>
		</tr>
		<tr>
			<td>작성자 : ${vo.q_id }</td>	
			<td>				
				<div class="text-right">
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>					
					${vo.q_date }&nbsp;&nbsp;<!-- | -->
<%-- 					<a href="MyController?type=modify&q_idx=${vo.q_idx }">수정 |</a>										
					<a href="#" onclick="deleteok()">삭제 |</a>		 --%>		
				</div>
			</td>	
		</tr>
		<tr>
			<td colspan="2" id="content">
				<p>${vo.q_content }</p>	
			</td>
		</tr>
		<tr>				
				<input type="hidden" name="cPage" value="${cPage }">			
		</tr>															
		</table>	
	</div>
	</div>
	
	<div class="container">   
	<div class="row">
	<div class="hit"><span id="hit">댓글${hit}</span></div>	
	</div>
	<hr>
	</div>
	
	<div class="container">
		<div class="row">
			<form method="post" name="frm2">	
			<p>
			<textarea name="qc_content" rows="3" cols="130">${qvo.qc_content }</textarea>	
			<input class="btn btn-default" type="button" value="수정" onclick="contentmodify(this.form)"> 
			<input type="hidden" name="q_idx" value="${q_idx }">	
			</p>
			</form>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 댓글 입력 폼 -->
	<%-- <form method="post">
		<p>
		<textarea name="content" rows="4" cols="55"></textarea>
		<input type="button" value="등록" onclick="login_chk(this.form)">
		<input type="hidden" name="q_idx" value="${vo.q_idx}">
		</p>
	</form> --%>
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
</div>
</html>











