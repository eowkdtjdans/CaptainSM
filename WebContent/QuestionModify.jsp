<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">
 
<title>Insert title here</title>

	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href="css/shop-item.css" rel="stylesheet">
	
<script>
	function modify_go(frm){
		frm.action="PSC?type=questionModify2";
		frm.submit();
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


	
	

	
	


	textarea{
		resize:none;
	}
	/* #content {
	height: 250px;
	} */
	
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
            <li class="nav-item" id="abc">
              <a class="nav-link" href="PSC?type=orderList">My주문조회</a>
            </li>
            <li class="nav-item" id="abc">
              <a class="nav-link" href="PSC?type=CustomerLogin">로그인</a>
            </li>
            <li class="nav-item" id="abc">
              <a class="nav-link" href="CustomerLogout.jsp">로그아웃</a> 
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








	<br><hr><br>
	<div class="container">
	<form method="post" name="frm">
		<table class="table">
	
			<h2 class="text-muted text-center"><span class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;문의 게시판(수정)</h2>
			<tbody>
				<tr>
					<th class="text-center" id="th">제목</th>
					<td>					
						<textarea rows="1" cols="50" name="subject">${vo.q_subject }</textarea>																								
					</td>					
				</tr>
				<tr>
					<th class="text-center" id="th">내용</th>
					<td>
						<p id="content"><textarea name="content" rows="15" cols="150">${vo.q_content }</textarea></p>
					</td>
				</tr>
				<tr>
					<td class="text-muted text-center" colspan="2">
					저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
					</td>
				</tr>	
				<tr>
					<td colspan="2" class="text-center"> 
						<input type="button" class="btn btn-outline-secondary" value="수정완료" onclick="modify_go(this.form)" class="btn btn-default">
						<input type="hidden" name="q_idx" value="${vo.q_idx}">				
						<input type="hidden" name="cPage" value="${cPage}">				
					</td>
				</tr>				
			</tbody>
		</table>
	</form>
	</div>
	
	
	
	
	
	
<!-- <div class="container">
	<form method="post" name="frm">
		<table class="table table-hover" id="table2">
			<tr>
				<th>제목</th>
				<td>
					<textarea rows="1" cols="30">asdfffffffffffffffffffffffffffff</textarea>
				</td>
			</tr>
		</table>
	</form>
</div> -->
	
	
	
	
	
	
	
	
	
	
	
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








