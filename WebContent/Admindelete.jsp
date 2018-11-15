<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>로그인</title>
<!-- jQuery 설정-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	function deleteCustomer(frm) {
		frm.action = "PSC?type=AdminDelete";
		frm.submit();
	}
</script>
</head>

<body>
<div class="container">
  <form id="frmDelete" name="frmDelete" method="post">
	<table class="table table-bordered table-hover" style="text-align : center; border : 1px solid #dddddd" >
		<thead>
			<tr>
				<th colspan="3">
					<h4 style="text-algin : center;" >삭제할 회원정보의 아이디를 입력하세요.</h4>
				</th>
			</tr>
		</thead>
		<tbody>
	<tr>
   		 <td>ID<input type="text" id="c_id" name="c_id" placeholder="아이디" /><br/></td>
    </tr>
	
    <tr>	
			<td style="text-algin: left" colspan="3">
			<input class="btn btn-info pull-right" type="button" value="회원 삭제"
			 onclick="deleteCustomer(this.form)"/>
			 <input type="button" class="btn btn-info pull-right" onclick="location.href='AdminMain.jsp'" value="뒤로가기"/>
			<input type="hidden" name="delete_chk" value="chk"/>
			</td>
	</tr>
	
				
		</tbody>
		</table>
  </form>
  	
</div>

</body>
</html>