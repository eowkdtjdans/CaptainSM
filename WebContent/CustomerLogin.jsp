<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>
	
	
<script>
function login_go(frm) {
	var c_id = frm.c_id.value;
	var c_pwd = frm.c_pwd.value;
	if (c_id  == "") {
		alert("아이디를 입력하세요.");
		frm.c_id.focus();
		return false;
	}
	if (c_pwd == "") {
		alert("비밀번호를 입력하세요.");
		frm.c_pwd.focus();
		return false;
	} 
	
	if (c_id == "admin") {
		frm.action = "AdminMain.jsp";
		frm.submit();
		return false;
	}
			 $.ajax({
			type : "get",
			url : "PSC?type=JSONloginCheck",
			dataType : "json",
			success : function(result) {
				var alist = result.list;
				$.each(alist, function(CustomerVO) {
					if(c_id == this.c_id && c_pwd == this.c_pwd) {
						alert("로그인 성공 ");
						 frm.action = "PSC?type=CustomerLogin";
						 frm.submit(); 
						 return false;
					}
				});
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.status);
			}
		}); 
		
 }
</script>	
	
<style>
h3 {
	text-align : center;
	font-family: "Sandoll MiSaeng"; 
	font-size : 2.0em;
	margin-top : 2em;
	margin-left : -1em;
	margin-bottom : 5em;
	color : #964b00;
}
h3:before {
	content : "●";
	font-size : 1.2em;
	vertical-align : 110%;
}
h3:after {
	content : "●";
	font-size : 0.7em;
	vertical-align : -140%;
}
.left_m{
	margin-left : 1.5em;
}
</style>


</head>

<body>
<%@include file="include/header.jsp"%>
<!--  action =login_ok.jsp  --> 
<div class="container">
  <form id="frmLogin" name="frmLogin" method="post">
	<table class="table" style="text-align : center; " >
		<thead>
			<tr>
				<th colspan="3">
					<h3>Happy Dog 로그인</h3>
				</th>
			</tr>
		</thead>
		<tbody>
	<tr>
   		 <td>ID&emsp;&nbsp;&nbsp;<input type="text" id="c_id" name="c_id" oninput="check(this.form)" placeholder="아이디" style="width:200px"/><br/></td>
    </tr>
	
	<tr>   
     	<td>PWD&nbsp;&nbsp;<input type="password" id="c_pwd" name="c_pwd" oninput="check(this.form)" placeholder="패스워드" style="width:200px"/><br/></td>
   		
    </tr>
    
    <tr>	
    
			<td style="text-algin: left" colspan="3">
			<input class="btn btn-outline-secondary" type="submit"value="로그인" id="login" onclick="login_go(this.form)"/>
			<input type="hidden" name="login_chk" value="chk"/>
			</td>
	</tr>
				
		</tbody>
		</table>
  </form>
  
  <p class="text-center">해피독이 처음이신가요?&emsp;<a href="CustomerRegister.jsp">회원가입</a></p>
  <p class="text-center">아이디를 잊으셨나요?&emsp;<a href="CustomerFindId.jsp">아이디찾기</a></p>
  <p class="text-center">비밀번호를 잊으셨나요?&emsp;<a href="CustomerFindPwd.jsp">비밀번호찾기</a></p>
  
</div>
	<!-- 로그인/성공/실패/에러 메세지 출력 -->
  <div id="msg"></div>


<%@include file="include/footer.jsp"%>
<%@include file="include/include-js.jsp"%>

</body>

</html>




