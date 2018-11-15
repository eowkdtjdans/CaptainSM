<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
        <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
    
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	#pic {
		float: left;
	}
	
	#com {
		float:right;
		width: 100px;
		display: block
	}
	
	.pass {
		size: 10;
	}
	
	#content {
		height: 75px;
	}
	
	textarea{
		resize:none;
	}
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
	.no{ width: 10%}		
	.subject{ width: 50%}		
	.id{ width: 15%}		
	.date{ width: 15%}		
	.count_num{ width: 10%}	

	
</style>
<script>

	function check_cus(obj, num) {
		var c_id = "${CustomerVO.getC_id() }";
		var r_id = "${ReviewDataVO.getR_id()}";
		
		if (c_id == "") {
			
			alert("로그인을 해주세요");
			history.back(-2);
		 
		} else if (c_id != r_id) {
			alert("아이디불일치");
			alert("본인의 게시글만 삭제 또는 수정할수 있습니다");
			history.go(-2);
		
		} else if (c_id == r_id) {
			
			alert("아이디일치");
			if (obj.value == "글삭제") {
			 frm.action = "PSC?type=reviewDelete";
			 
			} else if (obj.value == "글수정") {
				frm.action = "reviewUpdate.jsp";
			}
			
			var chkConfirm = confirm("파일을 수정 또는 삭제하시겠습니까?");
			if (chkConfirm) {
				frm.submit();
			} else {
				history.go(-2);
			}
			
		}
	  	
		frm.submit();

	}
	
	
	function c_write_go(frm) {
		document.write
		frm.action = "PSC?type=reviewWriteC";
		frm.submit();
	}

	function c_oneList_go(frm) {
		frm.action = "PSC?type=reviewOneListC";
		frm.submit();
	}
	function c_delete_go(frm) {
		frm.action = "PSC?type=reviewDeleteC";
		frm.submit();
	}
	
	function c_delete_func(frm) {
		
		alert("아이디가 틀립니다");
		history.go(-1);
	}
	
</script>
</head>
<body>

   <!-- Body -->
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

<div>

	<hr>
	<form method="post" id="frm" name="frm">
	<div class="container">
	<div class="row form-group">
	<table class="table table-default">
		<thead>
			
			<tr>
				<td colspan="2">
					<div class="div0">
						<strong>${ReviewDataVO.getR_title() } &nbsp;&nbsp;&nbsp;</strong>
						<a href="PSC?type=reviewAll" id="main">|&nbsp;&nbsp;&nbsp;후기게시판</a>
					</div>			
					
				</td>
			</tr>
			
			<tr>
				<td>
				<p>아이디: ${ReviewDataVO.getR_id() }</p>		
				</td>		
				<td>
					<div class="text-right">
						<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
						${ReviewDataVO.getR_date() }&nbsp;&nbsp;|
						
						<c:choose>
						<c:when test="${CustomerVO.getC_id() == ReviewDataVO.getR_id() }">
						<input type="button" value="글수정" onclick="check_cus(this, 'upda')" class="btn btn-primary" id="pass">&nbsp;&nbsp;|
							
						<input type="button" value="글삭제" onclick="check_cus(this, 'del')" class="btn btn-default">&nbsp;&nbsp;|						
						</c:when>
						</c:choose>
					</div>		
				</td>		
			</tr>
		
			<tr>
				<td colspan="2" id="content">
					<pre>${ReviewDataVO.getR_content() }
					<c:choose>
						<c:when test="${ReviewDataVO.getR_image_l() == null }" >
						</c:when>
						<c:otherwise>
								<img src="images/${ReviewDataVO.getR_image_l() }" id="pic">
						</c:otherwise>
					</c:choose>			
					</pre>				
				</td>
			</tr>
			
		</thead>
		
		<tbody>
			<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">	
		</tbody>
		
	</table>
	</div>
	</div>
	</form>
	
	
	<!-- 댓글 출력폼 -->
		<c:forEach var="voC" items="${listC }">
		<div class="container" style="border-bottom:1px solid darkgray; margin-bottom:15px;">
		
		
			<form method="post" name="frm2" id="frm2">
			<tr>
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;${voC.getRc_id() }
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${voC.getRc_date().substring(0, 10) }</span>
				
				<div class="text-right">
					<c:choose>
					<c:when test="${CustomerVO.getC_id() == voC.getRc_id() }">
					<input type="button" value="삭제" onclick="c_delete_go(this.form)" class="btn btn-default">
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
					
					
				</div>				
				
				<div colspan="2" id="content">
					${voC.getRc_content() }
				</div>
			
				<input type="hidden" name="rc_idx" value="${voC.getRc_idx() }">
				<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">
				<input type="hidden" name="DBid" value="${voC.getRc_id() }" id="DBid">
				
			</tr>
			</form>
		</div>
		</c:forEach>


	<!-- 댓글 입력폼 -->
	<div class="container">
	<div class="row">
	<form method="post">
		
			<p>글번호: <input type="text" name="r_idx" value="${ReviewDataVO.getR_idx() }" readonly></p>
			<p>아이디: <input type="text" name="rc_id" value="${CustomerVO.getC_id() }" readonly></p>
	  
			<p><textarea name="rc_content" rows="3" cols="130"></textarea></p>
		
		<input type="button" value="댓글작성" onclick="c_write_go(this.form)" class="btn btn-default">
		<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">
		
	</form>
	</div>
	</div>

	
</div>

	<!-- Footer -->
    <footer class="py-5 bg-dark" style="margin-top:60px" >
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>


</body>
</html>