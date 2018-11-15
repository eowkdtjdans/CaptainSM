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
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width", initial-scale=1 >
	<link rel="stylesheet" href="css/bootstrap.css">
<style>
	/* #bbs table {
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
	} */
</style>
<script>
	function write_go() {
		var c_id = "${CustomerVO.getC_id() }"
		c_id.trim();
		
		if (c_id == "") {
			alert("로그인해주세요");
			//return 로그인 or 회원가입 jsp or command 파일 삽입해주세요
			//jsp or command에서 DB의 Customer정보를 CustomerVO의 세션입력
		} else {
			window.location = "reviewWrite.jsp"; 
			
		}
		
	}

</script>
</head>
<body>
<div id="bbs" class="container">

	<h2>자료 목록</h2>
	<!-- <p>[<a href="write.jsp">글쓰기</a>]</p> -->
	<p><input type="button" value="글쓰기" onclick="write_go()" class="btn btn-default"></p>
	<hr>
	<form method="post" enctype="multipart/form-data">
	<table border="1" class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>	
				<th>제목</th>
				<th>아이디</th>
				<th>작성일자</th>
				<th>조회수</th>
				
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
				<td>
					<ul class="pagination">
					<c:forEach var="b" begin="${pvo.getNowBlock() }" end="${pvo.getNowBlock() + 1 }">
						<c:choose>
								<c:when test="${b == pvo.getNowBlock() }">
									<c:choose>
										<c:when test="${pvo.getNowBlock() == 1  }" >
											<li><a>이전<a></li>
										
										</c:when>
										<c:otherwise>
											<li>
												<a href="PSC?type=reviewAll&cPage=${pvo.getfPageNumAtBlock() - 1 }">이전</a>											
											</li>
										</c:otherwise>
										
									</c:choose>
								</c:when>
								
								<c:otherwise>
									<c:choose>
									
									<c:when test="${pvo.getNowBlock() == pvo.getTotalBlock() }">
										<li>
											<a>다음<a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="PSC?type=reviewAll&cPage=${pvo.getlPageNumAtBlock() + 1 }&plus=${pvo.getNowBlock()  }">다음</a>
										</li>
									</c:otherwise>
									
									</c:choose>
								</c:otherwise>
								
						</c:choose>
					</c:forEach>
					
				
					<c:forEach var="k" begin="${pvo.getfPageNumAtBlock() }" end="${pvo.getlPageNumAtBlock() }">
						<c:choose>
						
							<c:when test="${k == pvo.nowPage }">
								<li >
									<a>${k }<a>
								</li>
							</c:when>
						
							<c:otherwise>
								<li>
									<a href="PSC?type=reviewAll&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
							
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