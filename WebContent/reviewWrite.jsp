<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			
			if (firstForm.elements[i].value.trim() == "") {
				
				var name = "";
				if (firstForm.elements[i].name == "r_id") {
					name = "이름";
				} else if (firstForm.elements[i].name == "r_title") {
					name = "제목";
				} else if (firstForm.elements[i].name == "r_phone") {
					name = "전화번호";
				} else if (firstForm.elements[i].name == "r_content") {
					name = "내용";
				} else if (firstForm.elements[i].name == "r_image_l") {
					name = "사진";
				}
				alert(name + "을(를) 입력하세요");
				//alert(firstForm.elements[i].name + "을(를) 입력 또는 첨부하세요");
				firstForm.elements[i].focus();
				return
				
			}
			firstForm.action = "PSC?type=reviewWrite";
		}
		firstForm.submit();
		
	}
	
	
	function save_go(frm) {
		frm.action = "PSC?type=reviewWrite";
		frm.submit();
		
	}

</script>
</head>
<body>
	
	<p><a href="PSC?type=reviewAll">[목록으로 이동]</a></p>
	
	<form method="post" enctype="multipart/form-data">
	<!-- <form method="post" > -->
	<table border="1">
	
		<thead>

			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="r_id" value="${CustomerVO.getC_id() }" readonly>
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="r_title">
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="r_phone" value="${CustomerVO.getC_phone() }" readonly>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<textarea name="r_content" rows="5" cols="60"></textarea>
				</td>
			</tr>	
						
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="r_image_l">
					<input type="hidden" name="r_image_l" value="r_image_l">
					
				</td>
			</tr>
			
		</thead>
		
		<tbody>
			<tr>
				<td colspan="2">
				
					<input type="button" value="저장" onclick="sendData()">
					<input type="reset" value="리셋">
					<input type="hidden" name="write_chk" value="chk">
					
				</td>
			
			</tr>
			
		</tbody>
	
	</table>
	</form>
	
</body>
</html>