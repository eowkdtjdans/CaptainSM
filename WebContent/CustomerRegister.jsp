<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/custom.css" />
<title>회원가입</title>

<%@include file="include/include-link.jsp" %>
<%@include file="include/include-style.jsp" %>


<style>
	#membrrjoin1{
		width: 40px;
	}
	#emails {
	display:  inline-block;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	function save_go(frm) {
		

		//입력한 값이 없다면 다시 작성
		if(frm.c_id.value == " ") {
			alert("아이디를 입력 안했습니다.");
			frm.c_id.focus();
			frm.c_id.value = "";
			return false;
		} else if (frm.c_pwd.value == " ") {
			alert("비밀번호를 입력 안했습니다.");
			frm.c_pwd.focus();
			frm.c_pwd.value = "";
			return false;
		} else if (frm.c_addr.value == " ") {
			alert("주소를 입력 안했습니다.");
			frm.c_addr.focus();
			frm.c_addr.value = "";
			return false;
		} else if (frm.c_name.value == " ") {
			alert("이름을 입력 안했습니다.");
			frm.c_name.focus();
			frm.c_name.value = "";
			return false;
		} else if (frm.c_phone.value == " ") {
			alert("핸드폰 번호를 입력 안했습니다.");
			frm.c_phone.focus();
			frm.c_phone.value = "";
			return false;
		} else if (frm.c_gender.value == " ") {
			alert("성별을 제대로 체크 하세요.");
			frm.c_gender.focus();
			frm.c_gender.value = "";
			return false;
		} else if (frm.c_email.value == " ") {
			alert("이메일을 입력 안했습니다.");
			frm.c_email.focus();
			frm.c_email.value = "";
			return false;
		} if (frm.c_pwd.value.length<=4) {
			  $('#checkPwd').html('<p style="color:black">비밀번호가 너무 짧습니다. 더 길게 설정하세요.</p>');
			  alert("비밀번호가 너무 짧습니다. 다시 설정해주세요.");
			  frm.c_pwd.focus();
				frm.c_pwd.value = "";
			  return false;
		  }
		
		frm.action = "PSC?type=CustomerRegister";
		frm.submit();
	}
	
 </script>
	 <script type="text/javascript">
	 //회원가입 때 아이디 중복 확인 function 시작
	   function register_checkFunction(frm) {
		var c_id = frm.c_id.value; //변수명 c_id에 현재 입력한 값 넣음
		$.ajax({
			
			type : "get", 
			url : "PSC?type=JSONidcheck",
			dataType : "json",
			success : function(result) {
			
			var alist = result.list; //JSON 객체의 속성 "list"의 값
			$.each(alist, function(CustomerVO) {
				
				 if (frm.c_id.value != "") {
					for (i = 0; i < frm.c_id.value.length; i++) {
			            ch = frm.c_id.value.charAt(i)
			            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
			                alert("아이디는 영어 소문자, 숫자만 입력가능합니다.");
			                frm.c_id.focus();
			                frm.c_id.value="";
			                return false;
			            } 
			        }
			    } if (frm.c_id.value.length>=20) {
					 alert("아이디를 20자이하까지 입력 가능합니다.");
						 frm.c_id.focus();
		                frm.c_id.value="";
			            return false;
			        } if(c_id == this.c_id) { //c_id : 입력한 아이디 this.c_id : db에 존재하는 아이디
					 $('#checkMsg').html('<p style="color:red">아이디가 존재합니다. 다른 아이디를 사용하세요.</p>');
					 return false; //break
					} else {
						 $('#checkMsg').html('<p style="color:blue">아이디 사용가능</p>');
						return true; //continue
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
	 
	 function checkPassword(frm) {
		 var pwd = frm.c_pwd.value;
		 var pwd2 = frm.c_pwd2.value;
		  if (pwd == " " || pwd2 == " ") {
			  alert("비밀번호에 공백을 넣을 수 없습니다.");
			  frm.c_pwd.value="";
			  frm.c_pwd2.value="";
			  frm.c_pwd.focus();
			  return false;
		  } if (frm.c_pwd.value.length>=16) {
				 alert("비밀번호를 16자이하까지 설정 가능합니다..");
					 frm.c_pwd.focus();
	                frm.c_pwd.value="";
		            return false;
		  } if (frm.c_pwd.value.length<=4) {
			  $('#checkPwd').html('<p style="color:black">비밀번호가 너무 짧습니다. 더 길게 설정하세요.</p>');
	            return false;
		  }
		 	
		  if (pwd == pwd2) {
				alert("암호 일치");
				$('#checkPwd').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
				return true;
			} else {
				$('#checkPwd').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
				return false;
			}
	 }
	
	 function phone_checkFunction(frm) {
		 var c_phone = frm.c_phone.value;
		
		 $.ajax({
			type : "get", 
			url : "PSC?type=JSONphoneCheck",
			dataType : "json",
			success : function(result) {
				var alist = result.list;
				$.each(alist, function(CustomerVO) {
					
					if (frm.c_phone.value != "") {
						for (i = 0; i < frm.c_phone.value.length; i++) {
				            ch = frm.c_phone.value.charAt(i);
				            if (!(ch >= '0' && ch <= '9')) {
				                alert("번호는 숫자만 가능합니다.");
				                frm.c_phone.focus();
				                frm.c_phone.value="";
				                return false;
				            }
				        }
					} if (c_phone == this.c_phone) {
						$('#checkPhoneMsg').html('<p style="color:red">번호가 중복합니다.');
					return false;
					} else {
						$('#checkPhoneMsg').html('<p style="color:blue">사용할 수 있는 번호입니다.</p>')
						return true;
					}
				})
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
	 
	 function email_checkFunction(frm) {
		 var c_email = frm.c_email.value;

		
		 $.ajax({
			type : "get", 
			url : "PSC?type=JSONemailCheck",
			dataType : "json",
			success : function(result) {
				var alist = result.list;
				$.each(alist, function(CustomerVO) {
					
					if (frm.c_email.value != "") {
						for (i = 0; i < frm.c_email.value.length; i++) {
				            ch = frm.c_email.value.charAt(i)
				            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
				                alert("이메일은 영어 소문자, 숫자만 입력가능합니다.");
				                frm.c_email.focus();
				                frm.c_email.value="";
				                return false;
				            }
				        }
				    }
				    if (c_email == this.c_email) {
						$('#checkEmailMsg').html('<p style="color:red">이메일이 중복합니다.');
					return false;
					} else {
						$('#checkEmailMsg').html('<p style="color:blue">사용할 수 있는 이메일입니다.</p>');
						return true;
					 }  
				})
			
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

<style>
#container {
	  padding-right: 120px;
	  padding-left: 120px;
	  margin-right: auto;
	  margin-left: auto;
	}
	

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
<div class="container" id="container">
<form method="post">
	<table class="table table-hover" style="text-align : center; border : 1px solid #dddddd" >
<thead>
	<tr>
		<th colspan="3">
			<h3 class="text-center" >Happy Dog 회원가입 양식</h3>
		</th>
	</tr>
</thead>

<tbody>
			<!-- oninput : onclick과 다르게 입력하는 순간마다 실시간으로 된다(함수로 전달)라고 생각하시면 됩니다.
			굳이 비밀번호 일치 체크/아이디 중복 체크를 버튼을 누를때마다 해야한다고 생각 되지 않아서 이렇게 했습니다.	
			 -->
	<tr>
		<td style="width: 110px;">아이디</td>
		<td><input type="text" class="form-control" id="c_id" name="c_id" maxLength="20" 
		oninput="register_checkFunction(this.form);"/></td>
		<td style="width : 100px;" id="checkMsg" ><img id="membrrjoin1" src="img/memberjoin.PNG"></td>
	</tr>
	
<!-- <button type="button" class="btn btn-default"><img id="img8" src="img/icon8.PNG" alt="login">&nbsp;로그인</button> -->
	<tr>
		<td style="width: 110px;">비밀번호</td>		
		<td><input type="password" oninput="checkPassword(this.form)" 
		class="form-control" id="c_pwd" name="c_pwd" maxLength="20"/></td>
		<td><img id="pass1" src="img/pass1.PNG"></td>
	</tr>
		<!-- 비밀번호와 비밀번호 확인에 동일한 함수명입니다. checkPassword() -->
	<tr>
		<td style="width: 110px;">비밀번호<br> 확인</td>
		<td colspan=""><input type="password" oninput="checkPassword(this.form)" 
		class="form-control" id="c_pwd2" name="c_pwd2" maxLength="20"/></td>
		<td style="width : 150px;" id="checkPwd" ><img id="pass2" src="img/pass2.PNG"></td>
	</tr>
	
	
	
			
		
	<tr>
		<td style="width: 110px;">주소</td>
		<td colspan="2"><input type="text" class="form-control" id="c_addr" name="c_addr" maxLength="20"/>
		</td>
	</tr>
		
	<tr>
		<td style="width: 110px;">이름</td>
		<td colspan="2"><input type="text" class="form-control" id="c_name" name="c_name" maxLength="20" oninput="name_chk(this.form)"/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 110px;">전화번호</td>
		<td><input type="tel" class="form-control" id="c_phone" name="c_phone" maxLength="20" 
		oninput="phone_checkFunction(this.form)"/></td>
		<td style="width : 100px;" id="checkPhoneMsg" ></td>
	</tr>
	
	<tr>
		<td style="width: 110px;">성별</td>
		<td colspan="2">
			<div class="form-group" style="text-algin : center; margin : 0 auto">
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-default active"> 
					<!-- btn btn-primary active : 기본선택으로 해놓음 -->
						<input type="radio" name="c_gender" autocomplete="off" value="남자" checked/>남자
					</label>
					
					<label class="btn btn-default">
						<input type="radio" name="c_gender" autocomplete="off" value="여자"/>여자
					</label>
				</div>
			</div>
		</td>
	</tr>
	
	<tr>
		<td style="width: 110px;" id="emails">이메일</td>
		<td colspan="2"><input type="email" class="form-control" id="c_email" name="c_email" maxLength="20" 
		style="width :100%;"oninput="email_checkFunction(this.form)"/>
			<select name="emails" class="form-control" id="emails" style="width :50%;">
            	<option value="@gmail.com">@gmail.com</option>
            	<option value="@nate.com">@nate.com</option>
            	<option value="@daum.net" selected>@daum.net</option>
            	<option value="@naver.com">@naver.com</option>
         	</select>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="width : 100px;" id="checkEmailMsg" ></td>
	</tr>
	
	
	<tr>
		<td style="text-algin: left" colspan="3">
		<!-- pull-right 우측으로 -->
			<input  type="button" class="btn btn-outline-secondary pull-right"  
			data-toggle="modal" data-target="#myModal" value="가입하기" onclick="save_go(this.form)"/>
			<input type="hidden" name="register_chk" value="chk">
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