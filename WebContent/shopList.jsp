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

</head>

<script>
	function search_function(frm) {
		frm.action = "PSC?type=List";
		frm.submit();
	}
</script>

<body>
	<!-- Page Content -->
 	<div class="container">

    <!-- Page Heading -->
   	<h1 class="my-4">카테고리
     	<small>${category}</small>
   	</h1>
   	
   	<form method="post">
   	<div class="form-group row pull-right">
		<div class="col-xs-8">
			<input class="form-control" type="text" size="20" name="fullname">
		</div>
		<div class="col-xs-2">
			<button class="btn btn-primary" type="button" onclick="search_function(this.form);">검색</button>
		</div>
	</div>
	</form>
		
	<div class="row">
	<c:if test="${not empty list }">
		<c:forEach var="vo" items="${list }">
	        <div class="col-lg-4 col-sm-6 portfolio-item">
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
		<tr>
			<td>입력된 자료가 없습니다</td>
		</tr>
	</c:if>
	</div>
	<!-- /.row -->
	
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
							<a class="page-link" href="PSC?type=List&nowPage=${pvo.beginPage - 1 }&category=${category }" aria-label="Previous">
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
			          <a class="page-link" >${k }</a>
			        </li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
         				<a class="page-link" href="PSC?type=List&nowPage=${k }&category=${category }">${k }</a>
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
	
</body>
</html>