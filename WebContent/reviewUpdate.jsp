<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function update_on(frm) {
		/* document.forms[0].submit(); */
		frm.action = "PSC?type=reviewUpdate";
		frm.submit();
	}
	
	function delete_on(frm) {
		frm.action = "PSC?type=reviewDelete";
		frm.submit();
	}


</script>
</head>
<body>
	
	<h2>자료 수정</h2>
	<p><a href="PSC?type=reviewAll">[목록으로 이동]</a></p>
	<hr>
	<form method="post" enctype="multipart/form-data">
	<table border="1">
		<thead>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="r_title" value="${ReviewDataVO.getR_title() }" >
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea name="r_content" rows="5" cols="60">
						${ReviewDataVO.getR_content() }
					</textarea>
					<c:choose>
						<c:when test="${ReviewDataVO.getR_image_l() == null }" >
						</c:when>
						<c:otherwise>
								<img src="images/${ReviewDataVO.getR_image_l() }" width="100px" height="95px">
						</c:otherwise>
					</c:choose>				
				</td>
			</tr>
		
		</thead>
		
		<tbody>
			<input type="hidden" name="r_image_l" value="${ReviewDataVO.getR_image_l() }">	
			<input type="hidden" name="r_idx" value="${ReviewDataVO.getR_idx() }">	
			<input type="hidden" name="update_chk" value="update">	
			<input type="hidden" name="delete_chk" value="delete">	
			
			<tr>
				<td>
				</td>
				<td>
					<input type="button" value="수정" onclick="update_on(this.form)">		
					<input type="file" name="r_image_l" value="r_image_l">
				</td>
			</tr>
			
		</tbody>
		
	</table>
	</form>
	
</body>
</html>