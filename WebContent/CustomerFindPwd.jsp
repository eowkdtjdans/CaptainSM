<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>
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
								alert("비밀번호 : " + this.c_pwd);
								 frm.action = "PSC?type=CustomerFindPwd";
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
  <form method="post">
	<table class="table table-hover" style="text-align : center;" >
		<thead>
			<tr>
				<th colspan="3">
					<h3 style="text-algin : center;" >비밀번호 찾기</h3>
				</th>
			</tr>
		</thead>
		<tbody>
	<tr>
   		 <td>아이디를 입력해주세요&nbsp;&nbsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="c_id" name="c_id" style="width:250px;" /><br/></td>
    </tr>
	
	<tr>   
     	<td>핸드폰 번호를 입력해주세요&emsp;&nbsp;&nbsp;<input type="text" id="c_phone" name="c_phone" style="width:250px;"/>
     	<br><h6 class="text-muted text-left">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;예)01012345678</h6>
     	</td>
   		
    </tr>
    	<tr>
			<td style="width : 100px;" id="findId" ></td>
    	</tr>
    <tr>
    
    
			<td style="text-algin: left" colspan="3">
			
			  <input class="btn btn-outline-secondary" type="button" value="아이디 찾기"
			 onclick="location.href='CustomerFindId.jsp'"/>
			<input class="btn btn-outline-secondary pull-right" type="button" value="회원가입"
			 onclick="location.href='CustomerRegister.jsp'"/>
			 <input class="btn btn-outline-info pull-right" type="submit"value="비밀번호 찾기" id="login" onclick="find_pwd(this.form)"/>
			 <input class="btn btn-outline-secondary pull-right" type="button" value="로그인"
			 onclick="location.href='CustomerLogin.jsp'"/>
			<input class="btn btn-outline-secondary pull-right" type="button" value="메인화면"
			 onclick="location.href='Home.jsp'"/>
			
			<input type="hidden" name="find_pwdchk" value="chk"/>
			</td>
	</tr>
				
		</tbody>
		</table>
  </form>
</div>
<%@include file="include/footer.jsp"%>
<%@include file="include/include-js.jsp"%>
</body>
</html>