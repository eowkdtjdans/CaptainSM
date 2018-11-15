<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="nav">
  <div class="container">
    <a class="navbar-brand" href="Home.jsp"><img src="/CaptainSM/img/paw.PNG" id="paw">&nbsp;Happy Dog</a> <!--PSC?type=CustomerMain과 같습니다.  -->
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
<br>
<hr>
<br>