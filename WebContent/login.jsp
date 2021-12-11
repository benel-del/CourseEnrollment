<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>수장신청 시스템 로그인</title>
</head>
<body>
<div id=login>
	<div class="container" style="width:fit-content">
		<div class="col-lg-4" style="width:500px; border:2px solid #ccc; border-radius: 10px;">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top:15px; padding-bottom:30px;background:white">
			
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="login_verify.jsp">
					<h3 style="text-align: center; color:#337ab7; margin-top:0px; font-weight:600;">LOGIN</h3>
					<br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
	</div>
</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>