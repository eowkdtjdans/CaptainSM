<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<div>
			<table>
				<tr>
					<td>
						<a href="PSC?type=List&category=food">사료</a>
					</td>
					<td>
						<a href="PSC?type=List&category=snack">간식</a>
					</td>
					<td>
						<a href="PSC?type=List&category=toy">장난감</a>
					</td>
					<td>
						<a href="PSC?type=List&category=house">하우스</a>
					</td>
					<td>
						<a href="PSC?type=List&category=lead">목줄</a>
					</td>
					<td>
						<a href="PSC?type=cart_view">장바구니</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<%@include file="include/footer.jsp"%>
</body>
</html>