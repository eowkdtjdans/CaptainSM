<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<!-- jQuery 설정-->
	
<script>
		 function login_go(frm) {
			var c_id = frm.c_id.value;
			var c_pwd = frm.c_pwd.value;
			if (c_id  == "") {
				alert("ID를 입력하세요");
				frm.c_id.focus();
				return false;
			}else if (c_pwd == "") {
				alert("비밀번호를 입력하세요");
				frm.c_pwd.focus();
				return false;
			} else if (frm.c_id.value == "admin") {
				frm.action = "PSC?type=CustomerAdmin";
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
								frm.action = "PSC?type=CustomerLogin";
								frm.submit();
							return false;
							} 
						});
					},
					error : function(jqXHR, textStatus, errorThrown){
						console.log(jqXHR.status);
						alert("실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
					}
				}); 
				
		 }
	</script>  
</head>

<body>

<!--  action =login_ok.jsp  --> 
<div class="container">
  <form id="frmLogin" name="frmLogin" method="post">
	<table class="table" style="text-align : center; border : 1px solid #dddddd" >
		<thead>
			<tr>
				<th colspan="3">
					<h4 style="text-algin : center;" >로그인</h4>
				</th>
			</tr>
		</thead>
		<tbody>
	<tr>
   		 <td>ID<input type="text" id="c_id" name="c_id" placeholder="아이디" /><br/></td>
    </tr>
	
	<tr>   
     	<td>pwd<input type="password" id="c_pwd" name="c_pwd" placeholder="패스워드" /><br/></td>
   		
    </tr>
    
    <tr>	
    
			<td style="text-algin: left" colspan="3">
			<input class="btn" type="submit"value="로그인" id="login" onclick="login_go(this.form)"/>
			<input type="hidden" name="login_chk" value="chk"/>
			</td>
	</tr>
				
		</tbody>
		</table>
  </form>
  
  <p>해피독이 처음이신가요?&emsp;<a href="CustomerRegister.jsp">회원가입</a></p>
  <p>아이디를 잊으셨나요?&emsp;<a href="CustomerFindId.jsp">아이디찾기</a></p>
  <p>비밀번호를 잊으셨나요?&emsp;<a href="CustomerFindPwd.jsp">비밀번호찾기</a></p>
  
</div>
	<!-- 로그인/성공/실패/에러 메세지 출력 -->
  <div id="msg"></div>

</body>

</html>



