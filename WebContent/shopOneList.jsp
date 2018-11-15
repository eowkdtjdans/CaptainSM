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
	
<title>Insert title here</title>

<style>
  #search {
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
</style>

	<!-- Bootstrap core CSS -->
    <link href="startbootstrap-portfolio-item-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="startbootstrap-portfolio-item-gh-pages/css/portfolio-item.css" rel="stylesheet">
    
<script>
	function detail(frm) {
		frm.pwd.focus();
	}
	
</script>

</head>
<body>
	<!-- Page Content -->
    <div class="container">

      <!-- Portfolio Item Heading -->
      
      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-8">
          <img class="img-fluid" src="images/${vo.getP_image_s()}" alt="">
        </div>
        
        <div class="col-md-4">
          <h3 class="my-3">${name }</h3>
          <p>${vo.getP_content() }</p>
          <h3 class="my-3">Project Details</h3>
          <ul>
          
       	 	<c:if test="${vo.getP_saleprice() != 0}">
           	<li style="text-decoration: line-through;">가격 : ₩${vo.getP_price() }</li>
            <li style="font-size:larger; font-weight: bold; color: red;">할인가격 : ₩${vo.getP_saleprice() }</li>
            </c:if>
            <c:if test="${vo.getP_saleprice() == 0}">
           	<li>가격 : ₩${vo.getP_price() }</li>
           	</c:if>
            <li>브랜드 : ${vo.getP_company() }</li>
            <li>수량 : 구매수량</li>
          </ul>
        	<p>
				<a href="PSC?type=cart&p_name=${vo.getP_name() }">
					<button type="button" class="btn btn-success">구매하기</button>
				</a>
			</p>
        </div>
        </div>
	<hr>
	<br>
	
	<p id="search" style="margin-left: 260px;">		
		<a href="#Related_item">
			<button type="button" class="btn btn-info btn-lg">관련상품</button>
		</a>
		<a href="#impression">
			<button type="button" class="btn btn-info btn-lg">이용후기</button>
		</a>
		<a href="#delivery">
			<button type="button" class="btn btn-info btn-lg">배송관련안내</button>
		</a>
		<a href="#exchange_refund">
			<button type="button" class="btn btn-info btn-lg">교환 및 반품안내</button>
		</a>
	</p>
	<br>
	
	<p style="margin-left: 160px;"><img src="images/${vo.getP_image_l()}"></p>
	<br><br><br><br><br>
	
	<!-- Related Projects Row -->
	<a name="Related_item" class="my-4"></a>
	<h3 class="my-4">관련상품</h3>
	<div class="row">
		<c:forEach var="vo" items="${p_name_list}">
			<c:if test="${!vo.getName().equals(name)}">
				<div class="col-md-3 col-sm-6 mb-4">
		          <a href="PSC?type=OneList&p_name=${vo.getP_name()}">
		            <img class="img-fluid" src="images/${vo.getP_image_s()}" width="500" height="300" alt="">	
		          </a>
		         <p>${vo.getName()}</p>
		         
	         	<c:if test="${vo.getP_saleprice() != 0}">
	           	<li style="text-decoration: line-through;">가격 : ₩${vo.getP_price() }</li>
	            <li style="font-weight: bold; color: red;">할인가격 : ₩${vo.getP_saleprice() }</li>
	            </c:if>
	            <c:if test="${vo.getP_saleprice() == 0}">
	           	<li>가격 : ₩${vo.getP_price() }</li>
	           	</c:if>
	           	
		        </div>				  					
			</c:if>
		</c:forEach>
	</div>	
	<br><br><br><br><br>
	<a name="impression"></a>
	<p>이용후기</p>
	<br><br><br><br><br>
	<a name="delivery"></a>
	<img src="images/배송.jpg">
	<br><br><br><br><br>
	<a name="exchange_refund"></a>
	<img src="images/교환환불.jpg">
	<br><br><br><br><br>
</form>

	<!-- Bootstrap core JavaScript -->
    <script src="startbootstrap-portfolio-item-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="startbootstrap-portfolio-item-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>