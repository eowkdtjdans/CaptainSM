<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
        <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
<script>
	function update_on(frm) {
		frm.action = "PSC?type=reviewUpdate";
		frm.submit();
	}
	
	function delete_on(frm) {
		frm.action = "PSC?type=reviewDelete";
		frm.submit();
	}


</script>

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
	#content {
		height: 250px;
	}
	textarea{
		resize:none;
	}
	.form-group {
	        margin-top: 100px;
	}
	textarea {
		resize:none;
	}
	
	#content {
		height: 250px;	
	}

</style>
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
	
	

	<!-- <h2>자료 수정</h2>
	<p><a href="PSC?type=reviewAll">[목록으로 이동]</a></p> -->
	<hr>
	<form method="post" enctype="multipart/form-data">
	<div class="container">
	<div class="row">
	<table>
		<thead>
			<div style="margin:30px">
			<h2 class="text-muted text-center"><span class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;문의 게시판(수정)</span></h2>
			</div>
			
			  <tr>
			 	 <td>
			    <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text">제목</span>
			      </div>
					<textarea class="form-control" rows="1" cols="150" name="r_title">${ReviewDataVO.getR_title() }</textarea>
			    </div>
			 	 </td>	
			  </tr>
			
			  <tr>
			 	<td>
			    <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text">내용</span>
			      </div>
					<textarea name="r_content" class="form-control" rows="20" cols="150">${ReviewDataVO.getR_content() }</textarea>
			    </div>
			    </td>
			  </tr>
			
			  <tr>
			 	 <td>
			    <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text">사진</span>
			      </div>
					<c:choose>
						<c:when test="${ReviewDataVO.getR_image_l() == null }" >
						</c:when>
						<c:otherwise>
								<img src="images/${ReviewDataVO.getR_image_l() }" width="100px" height="95px">
						</c:otherwise>
					</c:choose>
			    </div>
					<span><input type="file" name="r_image_l" value="r_image_l"></span>
			  	 </td>
			  </tr>

			
			
		</thead>
		
		<tbody>
			<input type="hidden" name="r_image_l" value="${ReviewDataVO.getR_image_l() }">	
			<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">	
			<input type="hidden" name="update_chk" value="update">	
			<input type="hidden" name="delete_chk" value="delete">	
			
			<tr >
				<td>
					<div class="text-right">
					<span><input type="button" value="수정" onclick="update_on(this.form)" class="btn btn-primary"></span>		
					</div>
				</td>
			</tr>
			
		</tbody>
		
			
  
	</table>
	</div>
	</div>
	</form>
	
	<div style="margin-top:60px" class="text-center">
	<tr>
		<td colspan="2">
		저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
		</td>
	</tr>
	</div>
			
	<!-- Footer -->
    <footer class="py-5 bg-dark" style="margin-top:60px" >
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>