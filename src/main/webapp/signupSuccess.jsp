<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 성공</title>
</head>
<body>
	<h2>회원 가입 성공</h2>
	<hr>
	축하합니다!<br>
	관리자인 경우에만 로그인 기능이 수행됩니다.<br><br>
	<table border="0"> 
		<tr>
			<td>
				<form action="membership.jsp">
					<input type="submit" value="◀ 사용자 공간이동">
				</form> 
			</td>
			<td>
				<form action="login.jsp">
					<input type="submit" value="관리자 모드 이동 ▶">
				</form>			
			</td>			
		<tr>
	</table>


</body>
</html>