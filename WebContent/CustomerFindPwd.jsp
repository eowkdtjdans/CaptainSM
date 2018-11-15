<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
		 function find_pwd(frm) {
			var c_id = frm.c_id.value;
			var c_phone = frm.c_phone.value;
			if (c_id  == "") {
				alert("아이디를 입력하세요");
				frm.c_id.focus();
				return false;
			}
			if (c_phone == "") {
				alert("핸드폰 번호를 입력하세요");
				frm.c_pwd.focus();
				return false;
			} 
					 $.ajax({
					type : "get",
					url : "PSC?type=JSONFindPWDCheck",
					dataType : "json",
					success : function(result) {
						var alist = result.list;
						$.each(alist, function(CustomerVO) {
							if(c_id == this.c_id && c_phone == this.c_phone) {
								alert("데이터 있음");
								//$('#"findId"').html('<p style="blue">당신의 아이디는 : ${c_id}</p>');
								 frm.action = "PSC?type=CustomerFindPwd";
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
  <form method="post">
	<table class="table table-bordered table-hover" style="text-align : center; border : 1px solid #dddddd" >
		<thead>
			<tr>
				<th colspan="3">
					<h4 style="text-algin : center;" >비밀번호 찾기</h4>
				</th>
			</tr>
		</thead>
		<tbody>
	<tr>
   		 <td>아이디<input type="text" id="c_id" name="c_id"  /><br/></td>
    </tr>
	
	<tr>   
     	<td>번호<input type="text" id="c_phone" name="c_phone" /><br/></td>
   		
    </tr>
    	<tr>
			<td style="width : 100px;" id="findId" ></td>
    	</tr>
    <tr>
    
    
			<td style="text-algin: left" colspan="3">
			<input class="btn btn-primary pull-right" type="submit"value="비밀번호 찾기" id="login" onclick="find_pwd(this.form)"/>
			
			<input class="btn btn-primary pull-right" type="button" value="회원가입"
			 onclick="location.href='CustomerRegister.jsp'"/>
			<input class="btn btn-primary pull-right" type="button" value="메인화면"
			 onclick="location.href='Home.jsp'"/>
			<input type="hidden" name="find_pwdchk" value="chk"/>
			</td>
	</tr>
				
		</tbody>
		</table>
  </form>
</div>
</body>
</html>