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

<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>

<title>펫샵 - dogListWrite</title>

<script>
	function dogListWrite_ok(frm) {
		frm.action="PSC?type=dogListWrite&chk=chk";
		frm.submit();
	}
</script>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<div class="container">
	<div class="row from-group">
	<div class="write">
		
		<form method="post" enctype="multipart/form-data">
		<table>		
		<div style="margin:30px">
		<h2 class="text-muted"><img src="img/write.PNG" id="write">&nbsp;분양 게시판(글쓰기)</h2>
		</div>
		
		<thead>
		
		  <tr>
		 	 <td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">제목</span>
		      </div>
				<textarea class="form-control" rows="1" cols="150" name="d_title"></textarea>				
		    </div>
		 	 </td>	
		  </tr>
		  
		  <tr>
		 	<td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">견종</span>
		      </div>
				<select size="1" name="d_type">
						<option selected>포메라니안</option>
						<option>폼피츠</option>
						<option>말티즈</option>
						<option>비숑프리제</option>
						<option>웰시코기</option>
						<option>푸들</option>
						<option>치와와</option>
						<option>닥스훈트</option>
						<option>미니핀</option>
						<option>치와와</option>
						<option>프렌치불독</option>
						<option>시츄</option>
						<option>코카스파니엘</option>
						<option>요크셔</option>
						<option>이탈리안그레이하운드</option>
						<option>시바견</option>
						<option>킹찰스스패니얼</option>
						<option>골든리트리버</option>
						<option>래브라도리트리버</option>
						<option>비글</option>
						<option>대장성문</option>
						<option>빠삐용</option>
						<option>샤페이</option>
						<option>김성문</option>
						<option>믹스견</option>
						<option>기타</option>
					</select>
		    </div>
		    </td>
		  </tr>
		  
		  <tr>
		 	<td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">모색</span>
		      </div>
				<select size="1" name="d_fur">
						<option selected>브라운</option>
						<option>블랙</option>
						<option>화이트</option>
						<option>블루멀</option>
						<option>셰이블</option>
						<option>골드</option>
						<option>실버</option>
						<option>그레이</option>
						<option>기타</option>
					</select>
		    </div>
		    </td>
		  </tr>
		  
		  <tr>
		 	 <td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">이름</span>
		      </div>
				<textarea class="form-control" rows="1" cols="150" name="d_name"></textarea>				
		    </div>
		 	 </td>	
		  </tr>
		  
		  <tr>
		 	 <td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">나이</span>
		      </div>
				<textarea class="form-control" rows="1" cols="150" name="d_age"></textarea>				
		    </div>
		 	 </td>	
		  </tr>
		  
		  <tr>
		 	<td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">크기</span>
		      </div>
				<select size="1" name="d_size">
					<option selected>T-CUP</option>
					<option>SMALL</option>
					<option>MEDIUM</option>
					<option>LARGE</option>
					<option>XXX LARGE</option>
				</select>
		    </div>
		    </td>
		  </tr>
		  
		  <tr>
		 	<td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">내용</span>
		      </div>
				<textarea class="form-control" rows="15" cols="150" name="d_intro"></textarea>
		    </div>
		    </td>
		  </tr>
		  
		  <tr>
		 	 <td>
		    <div class="input-group mb-3">
		    	<div class="input-group mb-3">
					<input type="file" name="f_name1">
		    	</div>
		    	<div class="input-group mb-3">
					<input type="file" name="f_name2">
		   		</div>
		   		<div class="input-group mb-3">
					<input type="file" name="f_name3">
		    	</div>
		 	 </td>	
		  </tr>
		  
			
		<tr>
		 	 <td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <input type="submit" class="btn btn-outline-secondary" value="완료" onclick="dogListWrite_ok(this.form)">
		      </div>
		     </div>
		 	 </td>
		  </tr>
		  		  
		  <tr>
		  	<td class="text-muted" colspan="2">
				저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
			</td>				 
		  </tr>
		  </thead>
		  </table>
		

		</form>
	</div>
	</div>
	</div>
	
	<%@include file="include/footer.jsp"%>
	<%@include file="include/include-js.jsp"%>
</body>
</html>