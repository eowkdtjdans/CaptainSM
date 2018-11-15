<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="css/bootstrap.css">
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

#content {
	height: 250px;
}
textarea{
	resize:none;
}
.form-group {
        margin-top: 100px;
}
</style>

</head>
<body>
<div class="container text-center">
<form method="post">
	<table class="table">
		<h2 class="text-muted"><span class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;문의 게시판(글쓰기)</h2>
		<tbody>
			<tr>
				<th >제목</th>
				<td>  <!-- <div class="text-right"> -->				
					<textarea rows="1" cols="150" name="q_subject" title="제목"></textarea>
				</td>
			</tr>		
			<tr>
				<th >내용</th>
				<td>
					<p id="content"><textarea  rows="20" cols="150" name="q_content" title="내용"></textarea></p>
				</td>
			</tr>
			<tr>
				<td class="text-muted" colspan="2">
				저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.
				</td>
			</tr>						
			<tr>
				<td colspan="2">					
					<input type="button" value="저장" class="btn btn-default"
						onclick="sendData()">					
					<input type="reset" value="다시작성" class="btn btn-default">
					<input type="button" value="목록" class="btn btn-default"
						onclick="list_go()">
					<input type="hidden" name="write_chk" value="chk">
				</td>
			</tr>		
		</tbody>
	</table>
</form>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>



















