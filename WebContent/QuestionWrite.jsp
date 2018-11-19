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
<title>게시글 작성</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<script>
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {				
				alert(firstForm.elements[i].title 
						+ "을 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		location.href = "PSC?type=questionWrite";
		firstForm.submit();
	}
	function list_go() {
		location.href = "PSC?type=questionList";
	}
</script>  
<style>

textarea{
	resize:none;
}
.form-group {
        margin-top: 100px;
}
#write{
	width: 45px;
}
</style>

</head>
<body>
<%@include file="include/header.jsp"%>
<!-- <div class="container text-center">
<form method="post">
	<table class="table">
		<h2 class="text-muted"><img src="img/write.PNG" id="write">&nbsp;문의 게시판(글쓰기)</h2>
		<tbody>
			<tr>
				<th >제목</th>
				<td>  <div class="text-right">				
					<textarea rows="1" cols="150" name="q_subject" title="제목"></textarea>
				</td>
			</tr>		
			<tr>
				<th >내용</th>
				<td>
					<p id="content"><textarea  rows="15" cols="150" name="q_content" title="내용"></textarea></p>
				</td>
			</tr>
			<tr>
				<td class="text-muted" colspan="2">
				저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
				</td>
			</tr>						
			<tr>
				<td colspan="2">					
					<input type="button" value="저장" class="btn btn-outline-secondary"
						onclick="sendData()">					
					<input type="reset" value="다시작성" class="btn btn-outline-secondary">
					<input type="button" value="목록" class="btn btn-outline-secondary"
						onclick="list_go()">
					<input type="hidden" name="write_chk" value="chk">
				</td>
			</tr>		
		</tbody>
	</table>
</form>
</div> -->


<div class="container">
<div class="row from-group">
	<form method="post">
	<table>		
		<div style="margin:30px">
		<h2 class="text-muted"><img src="img/write.PNG" id="write">&nbsp;문의 게시판(글쓰기)</h2>
		</div>
		
		<thead>
		
		  <tr>
		 	 <td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">제목</span>
		      </div>
				<textarea class="form-control" rows="1" cols="150" name="q_subject"></textarea>				
		    </div>
		 	 </td>	
		  </tr>
		  
		  
		  <tr>
		 	<td>
		    <div class="input-group mb-3">
		      <div class="input-group-prepend">
		        <span class="input-group-text">내용</span>
		      </div>
				<textarea class="form-control" rows="15" cols="150" name="q_content"></textarea>
		    </div>
		    </td>
		  </tr>
		  
		 
		  		  
		  <tr>
		  	<td class="text-muted" colspan="2">
				저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
			</td>				 
		  </tr> 		  
		  
			<tr>
				<td colspan="2">					
					<input type="button" value="저장" class="btn btn-outline-secondary"
						onclick="sendData()">					
					<input type="reset" value="다시작성" class="btn btn-outline-secondary">
					<input type="button" value="목록" class="btn btn-outline-secondary"
						onclick="list_go()">
					<input type="hidden" name="write_chk" value="chk">
				</td>
			</tr>		
			
		</thead>
	
	
	</table>





	</form>
</div>
</div>





<%@include file="include/footer.jsp"%>
<%@include file="include/include-js.jsp"%>
</body>
</html>



















