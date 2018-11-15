<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0,
	maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>카카오톡</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<a id="kakao-login-btn"></a>
	<script type="text/javascript">
		//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init("3709ad1cb3ff20bfa721424e0a2de9c9");
			Kakao.Auth.createLoginButton({
				container: "#kakao-login-btn",
				success: function(authObj) {
					//로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url: "/v2/user/me",
						success: function(res) {
							alert(JSON.stringify(res));
						},
						fail: function(error) {
							alert(JSON.stringify(error));
						}
					});
				},
				fail: function(err) {
					alert(JSON.stringify(err));
				}
			});
		//]]>
	</script>
</body>
</html>