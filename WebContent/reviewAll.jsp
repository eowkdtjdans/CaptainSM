<%@page import="java.util.HashMap"%>
<%@page import="com.end.vo.ReviewDataVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.end.vo.ReviewPagingVO"%>
<%@page import="com.end.dao.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ReviewPagingVO p = new ReviewPagingVO();
	
	//1. 전체 게시글 구하기
	p.setTotalPost(ReviewDAO.countAll());
	p.setTotalPage();
	p.setTotalBlock();
	
	//2. 현재 페이지 구하기 (default : 1)
	String cPage = request.getParameter("cPage");
	String plus = request.getParameter("plus");
	/* String minus = request.getParameter("minus"); */
	
	int cPageInt = 1;

	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
		cPageInt = Integer.parseInt(cPage);
	}
	System.out.println("cPageInt1 : " + cPageInt);
	System.out.println("p.getNowBlock()1 : " + p.getNowBlock());
	System.out.println("p.getNowBlock() * p.getpageEaPerB()1 : " + p.getNowBlock() * p.getpageEaPerB());
	
	if (cPageInt > (p.getNowBlock() * p.getpageEaPerB())) {
		if (cPageInt % p.getpageEaPerB() != 0) p.setNowBlock((cPageInt / p.getpageEaPerB()) + 1);
		else p.setNowBlock(cPageInt / p.getpageEaPerB());
	}
	
	System.out.println("cPageInt2 : " + cPageInt);
	System.out.println("p.getNowBlock()2 : " + p.getNowBlock());
	System.out.println("p.getNowBlock() * p.getpageEaPerB()2 : " + p.getNowBlock() * p.getpageEaPerB());
	
	/* p.setNowBlock(p.getNowBlock() - Integer.parseInt(minus)); */
	
	//3. 현재페이지의 시작번호(fPageNumAtBlock)와 끝번호(lPageNumAtBlock) 구하기
 	p.setlPostNumAtPage(p.getpostEaPerP() * p.getNowPage());
	p.setfPostNumAtPage(p.getlPostNumAtPage() - p.getpostEaPerP() + 1 );
	
	//System.out.println("p.getlPostNumAtPage() : " + p.getlPostNumAtPage());
	//System.out.println("p.getfPostNumAtPage() : " + p.getfPostNumAtPage());
	
		
	System.out.println("p.getNowBlock() : " + p.getNowBlock());
	System.out.println("p.getTotalBlock() : " + p.getTotalBlock());
	System.out.println("p.getTotalPage() : " + p.getTotalPage());
	
	//4. 블록의 시작페이지, 끝페이지 번호 구하기
	if (p.getTotalBlock() == p.getNowBlock()) { //맨마지막 블럭에서 총블럭과 현재 블럭이 같을경우
		// 블럭당 페이지 갯수 * 지금블럭 > 총페이지갯수 11
		if ((p.getpostEaPerP() * p.getNowBlock()) == p.getTotalPage()) {
	p.setlPageNumAtBlock(p.getTotalPage());		
	//p.setfPageNumAtBlock(p.getlPageNumAtBlock() - p.getpageEaPerB() + 1);
		} else if ((p.getpostEaPerP() * p.getNowBlock()) > p.getTotalPage()) {
	p.setlPageNumAtBlock(p.getTotalPage());
		}
	} else if (p.getTotalPage() > p.getNowPage()){ //맨마지막 블럭이외 (!맨마지막블럭)인 경우
		p.setlPageNumAtBlock(p.getNowBlock() * p.getpageEaPerB());
		//p.setfPageNumAtBlock(p.getlPageNumAtBlock() - p.getpageEaPerB() + 1);
	}
	if (p.getNowBlock() == 1 ) {
		p.setfPageNumAtBlock(1);
	}
	p.setfPageNumAtBlock((p.getNowBlock() - 1) * p.getpageEaPerB() + 1);
	
	/* if (p.getTotalPage() > p.getNowPage()) {
		p.setlPageNumAtBlock(p.getNowPage());
	} */
	
	//p.setfPageNumAtBlock((p.getpageEaPerB() * (p.getNowBlock() - 1) + 1));
	
	System.out.println("p.getfPageNumAtBlock() : " + p.getfPageNumAtBlock());
	System.out.println("p.getlPageNumAtBlock() : " + p.getlPageNumAtBlock());
	System.out.println("");
	
/* 	if ((p.getpageEaPerB() * p.getTotalBlock()) > p.getTotalPage()) {
		p.setlPageNumAtBlock(p.getTotalPage());
	} else {
		p.setlPageNumAtBlock(p.getNowBlock() * p.getpageEaPerB());
		
	}
	p.setfPageNumAtBlock((p.getpageEaPerB() * (p.getNowBlock() - 1) + 1));
	
 */
%>
	
<%
		//DB에서 게시글 데이터 가져오기
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getfPostNumAtPage());
		map.put("end", p.getlPostNumAtPage());
		
		List<ReviewDataVO> rangedList = ReviewDAO.getRangedList(map);
		//System.out.println(rangedList);	
		
		//EL사용을 위해 scope에 데이터 등록 (page영역)
		//pageContext.setAttribute("list", list);
		session.setAttribute("rangedList", rangedList);
		pageContext.setAttribute("pvo", p);
		//pageContext.setAttribute("cPage", cPage);
	%>   

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
	
</style>
<script>
	function write_go() {
		var c_id = "${CustomerVO.getC_id() }"
		c_id.trim();
		
		if (c_id == "") {
			alert("로그인해주세요");
			history.back(-2);
			//return 로그인 or 회원가입 jsp or command 파일 삽입해주세요
			//jsp or command에서 DB의 Customer정보를 CustomerVO의 세션입력
		} else {
			window.location = "reviewWrite.jsp"; 
			
		}
		
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
            <div class="card-body">
            </div>
          </div>
        </div>
        
      </div>
      
    </div>
    
          <!-- /.card -->

<div class="container">

	<p><input type="button" value="글쓰기" onclick="write_go()" class="btn btn-default"></p>
	<hr>
	<form method="post" enctype="multipart/form-data">
	<table class="table table-hover">
	<!-- <h3 class="page-header">후기 게시판</h3> -->
		<thead>
			<tr class="title">
				<th class="no">번호</th>	
				<th class="subject">제목</th>
				<th class="id">아이디</th>
				<th class="date">작성일자</th>
				<th class="count_num">조회수</th>
			</tr>
		</thead>
		
		<tbody>
		
		<c:if test="${not empty rangedList }">
			<c:forEach var="vo" items="${rangedList }">
				<tr>
					<td>${vo.getR_idx() }</td>
					<td>
						<a href="PSC?type=reviewOnelist&r_idx=${vo.getR_idx() }">${vo.getR_title() }</a>
					</td>
					<td>${vo.getR_id() }</td>
					<td>${vo.getR_date().substring(0, 10) }</td>
					<td>${vo.getR_view_count() }</td>
					
				</tr>	
			
			</c:forEach>
		</c:if>
		
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="5">
					
					<ul class="paging">
					
					<c:forEach var="b" begin="${pvo.getNowBlock() }" end="${pvo.getNowBlock() + 1 }">
						<c:choose>
								<c:when test="${b == pvo.getNowBlock() }">
									<c:choose>
										<c:when test="${pvo.getNowBlock() == 1  }" >
											<li class="disable">이전</li>
										
										</c:when>
										<c:otherwise>
											<li>
												<a href="PSC?type=reviewAll&cPage=${pvo.getfPageNumAtBlock() - 1 }">이전</a>											
											</li>
										</c:otherwise>
										
									</c:choose>
								</c:when>
								
						</c:choose>
					</c:forEach>
					
					<c:forEach var="k" begin="${pvo.getfPageNumAtBlock() }" end="${pvo.getlPageNumAtBlock() }">
						<c:choose>
						
							<c:when test="${k == pvo.nowPage }">
								<li class="now">
									${k }
								</li>
							</c:when>
						
							<c:otherwise>
								<li>
									<a href="PSC?type=reviewAll&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
							
						</c:choose>
					</c:forEach>
					
					<c:forEach var="a" begin="${pvo.getNowBlock() }" end="${pvo.getNowBlock() + 1 }">
						<c:choose>
							
							<c:when test="${a == pvo.getNowBlock() }">
									<c:choose>
									
									<c:when test="${pvo.getNowBlock() == pvo.getTotalBlock() }">
										<li class="disable" float:right;>
											다음
										</li>
									</c:when>
									<c:otherwise>
										<li float:right;>
											<a href="PSC?type=reviewAll&cPage=${pvo.getlPageNumAtBlock() + 1 }&plus=${pvo.getNowBlock()  }">다음</a>
										</li>
									</c:otherwise>
									
									</c:choose>
							</c:when>
							
						</c:choose>
					</c:forEach>
					
					</ul>
					
				</td>
			</tr>
		</tfoot>
	
	</table>
	</form>

</div>


</body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js">
